# -*- encoding: utf-8 -*-
# stub: rubocop-discourse 3.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-discourse".freeze
  s.version = "3.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Discourse Team".freeze]
  s.date = "2023-09-13"
  s.homepage = "https://github.com/discourse/rubocop-discourse".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Custom rubocop cops used by Discourse".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.1.0"])
  s.add_runtime_dependency(%q<rubocop-rspec>.freeze, [">= 2.0.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
end
