# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

Gem::Specification.new do |s|
  s.name        = 'persian'
  s.version     = Persian::VERSION
  s.date        = '2015-09-03'
  s.summary     = "Persian language set of utilities."
  s.description = ""
  s.authors     = ["Dariush Abbasi"]
  s.email       = 'poshtehani@gmail.com'
  s.files       = ["lib/persian.rb", "lib/persian/version.rb"]
  s.require_paths = ["lib"]
  s.homepage    =
    'http://github.com/goonia/persian'
  s.license       = 'MIT'

  s.add_development_dependency "rspec"
end
