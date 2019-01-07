# -*- encoding: utf-8 -*-
# stub: contentful 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "contentful".freeze
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Contentful GmbH (Jan Lelis)".freeze, "Contentful GmbH (Andreas Tiefenthaler)".freeze, "Contentful GmbH (David Litvak Bruno)".freeze]
  s.date = "2018-04-16"
  s.description = "Ruby client for the https://www.contentful.com Content Delivery API".freeze
  s.email = "rubygems@contentful.com".freeze
  s.homepage = "https://github.com/contentful/contentful.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "contentful".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<http>.freeze, ["< 3.0", "> 0.8"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_development_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.41.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<rr>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
      s.add_development_dependency(%q<tins>.freeze, ["~> 1.6.0"])
    else
      s.add_dependency(%q<http>.freeze, ["< 3.0", "> 0.8"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<guard-yard>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.41.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<rr>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
      s.add_dependency(%q<tins>.freeze, ["~> 1.6.0"])
    end
  else
    s.add_dependency(%q<http>.freeze, ["< 3.0", "> 0.8"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, ["< 11.0"])
    s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<guard-yard>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.41.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rr>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
    s.add_dependency(%q<tins>.freeze, ["~> 1.6.0"])
  end
end
