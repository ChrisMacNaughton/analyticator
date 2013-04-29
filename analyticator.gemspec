# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'analytics/version'

Gem::Specification.new do |spec|
  spec.name          = "analyticator"
  spec.version       = Analyticator::VERSION
  spec.authors       = ["Chris MacNaughton"]
  spec.email         = ["chris@elocal.com"]
  spec.description   = %q{ Emulate google analytics during development to test events }
  spec.summary       = %q{ Emulate google analytics during development }
  spec.homepage      = "http://chrismacnaughton.com/projects/#analyticator"
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