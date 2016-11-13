# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitterlog/version'

Gem::Specification.new do |spec|
  spec.name          = "gitterlog"
  spec.version       = GitterLog::VERSION
  spec.authors       = ["Alexey Dukin"]
  spec.email         = ["gvozdmeister@gmail.com"]

  spec.summary       = %q{Log bot for Gitter API.}
  spec.description   = %q{Log bot for Gitter API.}
  spec.homepage      = "https://github.com/gvoz/gitterlog"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
