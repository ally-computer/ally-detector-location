# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ally/detector/location/version'

Gem::Specification.new do |spec|
  spec.name          = "ally-detector-location"
  spec.version       = Ally::Detector::Location::VERSION
  spec.authors       = ["Chad Barraford"]
  spec.email         = ["cbarraford@gmail.com"]
  spec.description   = %q{An ally detector plugin for finding a location in raw language}
  spec.summary       = %q{An ally detector plugin for getting a location in raw language}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ["lib"]

  spec.add_dependency 'ally'
  spec.add_dependency 'ally-detector-zipcode'
  spec.add_dependency 'ally-detector-place'

  # development dependencies
  spec.add_development_dependency "bundler", "~> 1.3"
  %w( rake rspec rubocop ).each do |gem|
    spec.add_development_dependency gem
  end
end
