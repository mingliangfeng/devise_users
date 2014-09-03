$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_users"
  s.version     = DeviseUsers::VERSION
  s.authors     = ["Andrew Feng"]
  s.email       = ["mingliangfeng@gmail.com"]
  s.homepage    = "https://github.com/mingliangfeng/devise_users"
  s.summary     = "Devise user management"
  s.description = "Rails 4 engine for managing devise users"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.5"
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency "devise"
  s.add_dependency 'less-rails'
  s.add_dependency 'execjs'
  s.add_dependency 'therubyracer'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'factory_girl_rails'
end
