# -*- encoding: utf-8 -*-
# stub: contentful-management 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "contentful-management".freeze
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Protas".freeze, "Tomasz Warkocki".freeze, "Contentful GmbH (Andreas Tiefenthaler)".freeze]
  s.date = "2018-11-13"
  s.description = "Ruby client for the https://www.contentful.com Content Management API".freeze
  s.email = ["piotrek@codequest.com".freeze, "warkocz@gmail.com".freeze, "rubygems@contentful.com".freeze]
  s.executables = ["cma-console".freeze]
  s.files = ["bin/cma-console".freeze]
  s.homepage = "https://github.com/contentful/contentful-management.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "contentful management api".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<http>.freeze, ["< 3.0", "> 1.0"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_development_dependency(%q<public_suffix>.freeze, ["< 1.5"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
      s.add_development_dependency(%q<listen>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<http>.freeze, ["< 3.0", "> 1.0"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, ["< 11.0"])
      s.add_dependency(%q<public_suffix>.freeze, ["< 1.5"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<guard-yard>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
      s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<http>.freeze, ["< 3.0", "> 1.0"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["< 11.0"])
    s.add_dependency(%q<public_suffix>.freeze, ["< 1.5"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<guard-yard>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 1.17.3", "~> 1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
