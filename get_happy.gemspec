# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_happy/version'

Gem::Specification.new do |spec|
  spec.name          = "get_happy"
  spec.version       = GetHappy::VERSION
  spec.authors       = ["Ioannis Kolovos"]
  spec.email         = ["yannis.kolovos@gmail.com"]
  spec.summary       = "A Gem to make you happy!"
  spec.description   = "Creates a collection with your music favorite links and opens a random one"
  spec.homepage      = "https://github.com/msroot/get_happy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "coveralls", "~> 0.7.11"  
  spec.add_development_dependency "minitest", '~> 5.5', '>= 5.5.1'
  spec.add_development_dependency "rspec", '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency "guard", '~> 2.12', '>= 2.12.5'
  spec.add_development_dependency "guard-rspec", '~> 4.5', '>= 4.5.0'
  spec.add_runtime_dependency "thor", "~> 0.19.1"
end
