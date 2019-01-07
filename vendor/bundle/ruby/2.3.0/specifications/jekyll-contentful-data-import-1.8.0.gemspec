# -*- encoding: utf-8 -*-
# stub: jekyll-contentful-data-import 1.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-contentful-data-import".freeze
  s.version = "1.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Contentful GmbH".freeze]
  s.date = "2018-10-15"
  s.description = "Load blog posts and other managed content into Jekyll".freeze
  s.email = ["david.litvak@contentful.com".freeze]
  s.homepage = "https://www.contentful.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Include mangablable content from the Contentful CMS and API into your Jekyll projects".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["< 4", ">= 2.5.0"])
      s.add_runtime_dependency(%q<contentful>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<rich_text_renderer>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["< 4", ">= 2.5.0"])
      s.add_dependency(%q<contentful>.freeze, ["~> 2.1"])
      s.add_dependency(%q<rich_text_renderer>.freeze, ["~> 0.1"])
      s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["< 4", ">= 2.5.0"])
    s.add_dependency(%q<contentful>.freeze, ["~> 2.1"])
    s.add_dependency(%q<rich_text_renderer>.freeze, ["~> 0.1"])
    s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.2"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
  end
end
