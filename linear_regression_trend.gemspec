# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linear_regression_trend/version'

Gem::Specification.new do |spec|
  spec.name          = "linear_regression_trend"
  spec.version       = LinearRegressionTrend::VERSION
  spec.authors       = ["Gabriel Fortuna"]
  spec.email         = ["gee.forr@gmail.com"]

  spec.summary       = 'A library for calculating linear trend regressions against a time series data set'
  spec.description   = 'A simple library for calculating linear trend regressions against a time series data set. See README for more info'
  spec.homepage      = "https://github.com/zero-one-software/linear_regression_trend"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",       "~> 1.9"
  spec.add_development_dependency "rake",          "~> 13.0"
  spec.add_development_dependency "pry",           "~> 0.13.1"
  spec.add_development_dependency "rspec",         "~> 3.9"
  spec.add_development_dependency "guard-rspec",   "~> 4.7.3"
  spec.add_development_dependency "cztop",         "~> 0.14.1"
  spec.add_development_dependency "iruby",         "~> 0.4.0"
  spec.add_development_dependency "nyaplot",       "~> 0.1.6"
  spec.add_development_dependency "awesome_print", "~> 1.8.0"
end
