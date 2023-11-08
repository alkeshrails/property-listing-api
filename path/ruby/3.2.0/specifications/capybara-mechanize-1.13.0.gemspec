# -*- encoding: utf-8 -*-
# stub: capybara-mechanize 1.13.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara-mechanize".freeze
  s.version = "1.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeroen van Dijk".freeze]
  s.date = "2023-03-28"
  s.description = "RackTest driver for Capybara, but with remote request support thanks to mechanize".freeze
  s.email = "jeroen@jeevidee.nl".freeze
  s.homepage = "https://github.com/jeroenvandijk/capybara-mechanize".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "RackTest driver for Capybara with remote request support".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<capybara>.freeze, [">= 3.0.0", "< 4"])
  s.add_runtime_dependency(%q<mechanize>.freeze, ["~> 2.8.5"])
  s.add_development_dependency(%q<launchy>.freeze, [">= 2.0.4"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
end
