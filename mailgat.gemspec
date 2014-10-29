# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailgat/version'

Gem::Specification.new do |spec|
  spec.name          = "mailgat"
  spec.version       = Mailgat::VERSION
  spec.authors       = ["James Phillips"]
  spec.email         = ["jamesdphillips@gmail.com"]
  spec.summary       = %q{Client wrapper for Mailgun API}
  spec.description   = %q{Simple client wrapper for Mailgun API using Faraday client}
  spec.homepage      = "https://www.jphillips.ca"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.9"
  spec.add_dependency "hashie", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "coveralls", "~> 0.7"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.20"
end
