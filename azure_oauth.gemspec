$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "azure_oauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "azure_oauth"
  s.version       = AzureOauth::VERSION
  s.authors       = ["Ahmed Ali"]
  s.email         = ["ahmedrali2@gmail.com"]
  s.date          = "2013-10-21"
  s.summary       = "azure_auth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  s.description   = "azure_auth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  s.homepage      = "https://github.com/Ahmedrali/azure_oauth"
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
