# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

Gem::Specification.new do |s|
  s.name        = 'persian'
  s.version     = Persian::VERSION
  s.date        = '2016-11-16'
  s.summary     = 'Persian language for ruby.'
  s.description = 'A set of utilities for Persian language.'
  s.authors     = ['Dariush Abbasi']
  s.email       = 'poshtehani@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")
  s.executables =
    `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage      =
    'http://github.com/negah/persian'
  s.license       = 'MIT'

  s.add_development_dependency 'rspec', '3.4'
end
