# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

Gem::Specification.new do |s|
  s.name        = 'persian'
  s.version     = Persian::VERSION
  s.date        = '2016-06-02'
  s.summary     = "A set of utilities for Persian language."
  s.description = "A set of utilities for Persian language."
  s.authors     = ["Dariush Abbasi"]
  s.email       = 'poshtehani@gmail.com'
  s.files       = ["lib/persian.rb", "lib/persian/number.rb", "lib/persian/character.rb","lib/persian/list/number.rb", "lib/persian/num_to_char.rb", "lib/persian/version.rb"]
  s.require_paths = ["lib"]
  s.homepage    =
    'http://github.com/goonia/persian'
  s.license       = 'MIT'

  s.add_development_dependency "rspec"
end
