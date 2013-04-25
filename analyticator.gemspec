# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'analyticator/version'

Gem::Specification.new do |spec|
  spec.name          = "Analyticator"
  spec.version       = Analyticator::VERSION
  spec.authors       = ["Chris MacNaughton"]
  spec.email         = ["chris@elocal.com"]
  spec.description   = %q{ Retrieve data about tests Off of Saucelabs.com }
  spec.summary       = %q{ Retrieve data about tests Off of Saucelabs.com }
  spec.homepage      = "http://nyancat.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables = ['analyticator']
  spec.default_executable = 'analyticator'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"

  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'haml'
end