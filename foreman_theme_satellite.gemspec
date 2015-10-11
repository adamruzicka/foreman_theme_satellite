require File.expand_path('../lib/foreman_theme_satellite/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = "foreman_theme_satellite"
  s.version     = ForemanThemeSatellite::VERSION
  s.date        = Date.today.to_s
  s.authors     = ["Alon Goldboim, Shimon Stein"]
  s.email       = ["agoldboi@redhat.com"]
  s.homepage    = "https://github.com/alongoldboim/foreman_theme_satellite"
  s.summary     = "This is a plugin that enables building a theme for Foreman."
  # also update locale/gemspec.rb
  s.description = "This is a plugin that enables building a theme for Foreman."
  s.files = Dir["{app,config,db,lib,locale}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "deface"
  s.add_dependency "get_pomo"

end
