# -*- encoding: utf-8 -*-
# stub: contentful_bootstrap 3.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "contentful_bootstrap".freeze
  s.version = "3.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Litvak Bruno".freeze]
  s.date = "2018-04-25"
  s.email = ["david.litvakb@gmail.com".freeze]
  s.executables = ["contentful_bootstrap".freeze]
  s.files = ["bin/contentful_bootstrap".freeze]
  s.homepage = "https://www.contentful.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Contentful CLI tool for getting started with Contentful".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_development_dependency(%q<public_suffix>.freeze, ["< 1.5"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.24"])
      s.add_development_dependency(%q<rr>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<listen>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49"])
      s.add_runtime_dependency(%q<launchy>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<contentful-management>.freeze, [">= 2.0.2", "~> 2.0"])
      s.add_runtime_dependency(%q<contentful>.freeze, ["~> 2.6.0"])
      s.add_runtime_dependency(%q<inifile>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_dependency(%q<public_suffix>.freeze, ["< 1.5"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.24"])
      s.add_dependency(%q<rr>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
      s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.49"])
      s.add_dependency(%q<launchy>.freeze, [">= 0"])
      s.add_dependency(%q<contentful-management>.freeze, [">= 2.0.2", "~> 2.0"])
      s.add_dependency(%q<contentful>.freeze, ["~> 2.6.0"])
      s.add_dependency(%q<inifile>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["< 11.0"])
    s.add_dependency(%q<public_suffix>.freeze, ["< 1.5"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.24"])
    s.add_dependency(%q<rr>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49"])
    s.add_dependency(%q<launchy>.freeze, [">= 0"])
    s.add_dependency(%q<contentful-management>.freeze, [">= 2.0.2", "~> 2.0"])
    s.add_dependency(%q<contentful>.freeze, ["~> 2.6.0"])
    s.add_dependency(%q<inifile>.freeze, [">= 0"])
  end
end
