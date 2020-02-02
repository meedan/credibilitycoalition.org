require_relative './data_page_generator'
require 'digest'

module Jekyll
  module CredCatalog
    include Jekyll::Sanitizer

    def credify_projects(projects, svg)
      # Build clean list of locations for later usage.
      clean_locations = Jekyll.sites[0].data['credcatalog']['locations']
        .select { |loc| loc['Geographic Type'] && loc['Geographic Name'] }
        .map { |loc| loc.merge({
          'Geographic Name' => loc['Geographic Name'].strip,
          'Direct Relationship' => split_better(loc['Direct Relationship'])
        })}

      # Augment the existing projects list with processed fields for display.
      projects.map { |project| project.merge({
        'NameLinked' => '<a class="project-name" href="/credcatalog/project/%s">%s</a>' % [
          sanitize_filename(project['Name']),
          project['Name']
        ],
        'NameSlug' => sanitize_filename(project['Name']),
        'FundersLinked' => split_better(project['Funders'])
          .select{ |f| f != '[needs more research]' }
          .map(&:strip)
          .map { |f| '<a href="/credcatalog/funder/%s">%s</a>' % [
            sanitize_filename(f),
            f
          ]}
          .join(', '),
        'Spectra' => _spectra(project, svg),
        'CategoriesCleaned' => split_better(project['Solutions Categories']).sort.join(', '),
        'LocationCleaned' => split_better(project['Location']).sort.join(', '),
        'LocationFiltered' => split_better(project['Location'])
          .reduce([]) { |locs, loc|
            locs.concat(_location_hierarchy(clean_locations, loc))
            locs
          }
          .uniq.sort.join(', '),
        'LanguagesCleaned' => split_better(project['Languages-2']).sort.join(', ')
      })}
    end

    def _location_hierarchy(locations, location)
      #
      # Given a location, return its hierarchy up to its root in locations.
      #
      hierarchy = []
      parent = locations.find { |loc| loc['Geographic Name'] == location }
      while !parent.nil?
        hierarchy.push(parent['Geographic Name'])
        parent = locations.find { |loc| loc['Direct Relationship'].include? parent['Geographic Name'] }
        parent = nil if parent&.dig('Geographic Name') == 'Global' # Don't go up to Global
      end
      hierarchy
    end

    def credify_funders(funders)
      funders
        .select { |f| f != '[needs more research]' }
        .map { |funder| funder.merge({
        'FunderHTML' => '<a class="funder-link" href="/credcatalog/funder/%s">%s</a><span class="funder-type">%s</span>' % [
          sanitize_filename(funder['Name']),
          funder['Name'],
          funder['Type']
        ],
        'ProjectsHTML' => split_better(funder['Initatives']) # Typo 'Initatives' as per funders.json!!
          .map(&:strip)
          .map { |p| '<a href="/credcatalog/project/%s">%s</a>' % [
            sanitize_filename(p),
            p
          ]}
          .join(', ')
      })}
    end

    def similar_to(projects, target)
      target_hash = _schema_hash(target)
      projects.select { |project|
        project['Name'] != target['Name'] &&
        (
          target_hash == _schema_hash(project) ||
          target['CategoriesCleaned'] == project['CategoriesCleaned'] ||
          target['LocationCleaned'] == project['LocationCleaned'] ||
          target['LanguagesCleaned'] == project['LanguagesCleaned']
        )
      }
    end

    def location_options(locations)
      #
      # Return an ordered list of locations from the CredCatalog locations table,
      # filtered by locations that contain any initiative.
      #
      # Assumes the locations table contains data organized top-down, i.e. root => leaves
      #
      child_indents = {
        'Global' => '',
        'Region' => '-- ',
        'Subregion' => '---- '
      }
      locations
        .select { |loc| loc['Geographic Type'] && loc['Geographic Name'] }
        .reduce([]) { |opts, loc|
          value = loc['Geographic Name'].strip

          # Find location index in the array.
          if loc['Geographic Type'] == 'Global'
            # For 'Global', it's the first element.
            opts.push({
              'label' => 'Global',
              'value' => 'Global',
              'parent' => nil,
              'count' => 0
            })
            n = 0
          else
            # Other options should have already been added as children of previous locations
            n = opts.index { |opt| opt['value'] == value }
          end

          if !n.nil?
            # Update count of initiatives for this node and its parents.
            projects = split_better(loc['Initiatives']).length
            node = opts[n]
            while !node.nil?
              node['count'] += projects
              # FIXME Inefficient way to find the parent by value, because the parent
              # index keeps changing as we insert elements. Maybe consider a map.
              node = opts.find { |opt| opt['value'] == node['parent'] }
            end

            # Add the children of the current location.
            split_better(loc['Direct Relationship'])
              .sort
              .reverse
              .each { |child|
                opts.insert(n+1, {
                  'label' => child_indents[loc['Geographic Type']] + child,
                  'value' => child,
                  'count' => 0,
                  'parent' => loc['Geographic Type'] == 'Global' ? nil : value
                })
              }
          end

          opts
        }
        .select { |opt| opt['count'] > 0 }
    end

    def _schema_hash(project)
      return Digest::MD5.hexdigest(
        project['Map Spectra: Theory'] +
        project['Map Spectra: Practice'] +
        project['Map Spectra: Message'] +
        project['Map Spectra: Infrastructure']
      )
    end

    def _spectra(project, svg)
      [
        { field: 'Map Spectra: Theory', id: 'theory' },
        { field: 'Map Spectra: Practice', id: 'practice' },
        { field: 'Map Spectra: Message', id: 'message' },
        { field: 'Map Spectra: Infrastructure', id: 'infrastructure' }
      ].each { |s|
        ranking = Jekyll.sites[0].data['credcatalog']['scales'].select{ |scale| scale['Option'] == project[s[:field]] }[0]
        if ranking['Numeric Value'].to_i < 2
          svg = svg.gsub(/id="#{s[:id]}"\s+style="fill:#[\da-f]{6};/i, "/id=\"#{s[:id]}\" style=\"fill:#F2F2F2;")
        end
      }
      svg
    end

  end
end

Liquid::Template.register_filter(Jekyll::CredCatalog)
