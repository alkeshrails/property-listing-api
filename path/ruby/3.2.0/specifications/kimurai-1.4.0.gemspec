# -*- encoding: utf-8 -*-
# stub: kimurai 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kimurai".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Victor Afanasev".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-01-30"
  s.email = ["vicfreefly@gmail.com".freeze]
  s.executables = ["kimurai".freeze]
  s.files = ["exe/kimurai".freeze]
  s.homepage = "https://github.com/vifreefly/kimuraframework".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Modern web scraping framework written in Ruby and based on Capybara/Nokogiri".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<cliver>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<murmurhash3>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<capybara>.freeze, [">= 2.15", "< 4.0"])
  s.add_runtime_dependency(%q<capybara-mechanize>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<poltergeist>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<selenium-webdriver>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<headless>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<pmap>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<whenever>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<rbcat>.freeze, ["~> 0.2"])
  s.add_runtime_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
end
