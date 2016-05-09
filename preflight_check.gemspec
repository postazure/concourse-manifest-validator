# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'preflight_check/version'

Gem::Specification.new do |spec|
  spec.name          = "preflight_check"
  spec.version       = PreflightCheck::VERSION
  spec.authors       = ["Max Gordon"]
  spec.email         = ["gordonmaxc@gmail.com"]
  spec.summary       = 'Pre-flight check your concourse config yaml before taking off.'
  spec.description   = "Validate your concourse config yaml before deploying."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "colorize"
end
