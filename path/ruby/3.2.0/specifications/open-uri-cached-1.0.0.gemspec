# -*- encoding: utf-8 -*-
# stub: open-uri-cached 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "open-uri-cached".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Danial Pearce".freeze]
  s.date = "2021-12-28"
  s.description = "OpenURI with transparent disk caching".freeze
  s.email = "danial.pearce@gmail.com".freeze
  s.homepage = "https://github.com/tigris/open-uri-cached".freeze
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Do a lot of site scraping but take lots of attempts at parsing the content before reaching your end result? This gem is for you. But wait, there's more... Ok, no there isn't.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.10.0"])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.14.0"])
end
