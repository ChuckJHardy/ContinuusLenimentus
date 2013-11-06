# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'continuus_lenimentus/version'

Gem::Specification.new do |spec|
  spec.name          = "continuus_lenimentus"
  spec.version       = ContinuusLenimentus::VERSION
  spec.authors       = ["Chuck J hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]
  spec.description   = %q{A SimpleCov Formatter for Continuus Lenimentus Local CI.}
  spec.summary       = %q{A SimpleCov Formatter for Continuus Lenimentus Local CI. When the spec suite is run a file is generated with data on the state of the test suite. This is encrypted with a key to ensure minimal conflicts when using version control.}
  spec.homepage      = "https://github.com/ChuckJHardy/SimpleLocalCI"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "simplecov", "~> 0.7.1"
  spec.add_dependency "gibberish", "~> 1.3.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
end
