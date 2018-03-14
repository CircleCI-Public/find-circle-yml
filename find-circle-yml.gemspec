# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'find_circle_yml/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest', '5.11.3'
  spec.add_development_dependency 'rake', '12.3.0'
  spec.add_dependency 'octokit'
  spec.authors = %(nwjsmith)
  spec.bindir = 'exe'
  spec.description = <<-DESCRIPTION
    A command-line tool for finding which repositories in your GitHub
    organization or Bitbucket team have circle.yml configuration files.
  DESCRIPTION
  spec.email = ['sayhi@circleci.com']
  spec.executables = ['find-circle-yml']
  spec.files = Dir.glob('lib/**/*.rb') + %w[README.md]
  spec.homepage = 'https://github.com/CircleCI-Public/find-circle-yml'
  spec.license = 'MIT'
  spec.name = 'find-circle-yml'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4.0'
  spec.summary = 'Finds circle.yml files'
  spec.test_files = Dir.glob('test/**/*.rb')
  spec.version = FindCircleYml::VERSION
end
