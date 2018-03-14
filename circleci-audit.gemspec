# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circleci/audit/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest', '5.11.3'
  spec.add_development_dependency 'rake', '12.3.0'
  spec.add_dependency 'octokit'
  spec.authors = %(nwjsmith)
  spec.bindir = 'exe'
  spec.description = ''
  spec.email = ['sayhi@circleci.com']
  spec.executables = ['circleci-audit']
  spec.files = Dir.glob('lib/**/*.rb') + %w[README.md]
  spec.homepage = 'https://github.com/nwjsmith/thumbtack'
  spec.license = 'MIT'
  spec.name = 'circleci-audit'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4.0'
  spec.summary = ''
  spec.test_files = Dir.glob('test/**/*.rb')
  spec.version = CircleCI::Audit::VERSION
end
