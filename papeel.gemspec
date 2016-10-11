$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "papeel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "papeel"
  s.version     = Papeel::VERSION
  s.authors     = ["Nicolas Florentin"]
  s.email       = ["nicolas@sleede.com"]
  s.homepage    = "TODO"
  s.summary     = "simple roles library for rails projects"
  s.description = "simple roles library for rails projects"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2.0"

  s.add_development_dependency "sqlite3"
end
