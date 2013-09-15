# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epilicious/version'

Gem::Specification.new do |spec|
  spec.name          = "epilicious"
  spec.version       = Epilicious::VERSION
  spec.authors       = ["Jan Hein Hoogstad"]
  spec.email         = ["yeehaa@codingthehumanities.com"]
  spec.description   = %q{a gem to parse recipes from epicurious}
  spec.summary       = %q{a gem to parse recipes from epicurious}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
end
