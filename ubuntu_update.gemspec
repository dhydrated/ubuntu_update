# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ubuntu_update/version'

Gem::Specification.new do |spec|
  spec.name          = "ubuntu_update"
  spec.version       = UbuntuUpdate::VERSION
  spec.authors       = ["taufekj"]
  spec.email         = ["taufek@gmail.com"]
  spec.summary       = "Ubuntu update helper"
  spec.description   = "Tool that wraps Ubuntu update/upgrade command line"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
