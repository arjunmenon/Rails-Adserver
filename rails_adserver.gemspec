$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_adserver/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_adserver"
  s.version     = RailsAdserver::VERSION
  s.authors     = ["Thomas Muntaner"]
  s.email       = ["thomas.muntaner@gmail.com"]
  s.homepage    = "http://www.thomasmuntaner.com/rails_adserver"
  s.summary     = "An adserver for rails"
  s.description = "An adserver for rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "haml"
  s.add_dependency "coffee-script"
  s.add_dependency "carrierwave"
  s.add_dependency "geokit"
  s.add_dependency "fog"
  
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "devise"
  s.add_development_dependency "sqlite3"
end
