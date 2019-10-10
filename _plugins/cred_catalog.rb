require_relative './data_page_generator'
require 'digest'

module Jekyll
  module CredCatalog
    include Jekyll::Sanitizer

    def credify(projects, svg)
      projects.map { |project| project.merge({
        'NameLinked' => '<a class="project-name" href="/credcatalog/project/%s">%s</a>' % [
          sanitize_filename(project['Name']),
          project['Name']
        ],
        'NameSlug' => sanitize_filename(project['Name']),
        'FundersLinked' => project['Funders']
          .split(',')
          .select{ |f| f != '[needs more research]' }
          .map(&:strip)
          .map{ |f| '<a href="/credcatalog/funder/%s">%s</a>' % [
            sanitize_filename(f),
            f
          ]}
          .join(', '),
        'Spectra' => _spectra(project, svg)
      })}
    end

    def credify_funders(funders)
      funders
        .select{ |f| f != '[needs more research]' }
        .map { |funder| funder.merge({
        'FunderHTML' => '<a class="funder-link" href="/credcatalog/funder/%s">%s</a><span class="funder-type">%s</span>' % [
          sanitize_filename(funder['Name']),
          funder['Name'],
          funder['Type']
        ],
        'ProjectsHTML' => split_better(funder['Initatives'], ',')
          .map(&:strip)
          .map{ |p| '<a href="/credcatalog/project/%s">%s</a>' % [
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
        target_hash == _schema_hash(project)
      }
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
      ].each{ |s|
        ranking = Jekyll.sites[0].data['credcatalog']['scales'].select{ |scale| scale['Option'] == project[s[:field]] }[0]
        if ranking['Numeric Value'].to_i < 2
          svg = svg.gsub(/id="#{s[:id]}"\s+style="fill:#[\da-f]{6};/i, "/id=\"#{s[:id]}\" style=\"fill:#646464;")
        end
      }
      svg
    end

  end
end

Liquid::Template.register_filter(Jekyll::CredCatalog)
