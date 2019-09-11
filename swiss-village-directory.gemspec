# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swiss_village_directory/version'

Gem::Specification.new do |spec|
  spec.name          = 'swiss-village-directory'
  spec.version       = SwissVillageDirectory::VERSION
  spec.authors       = ['Josua Schmid', 'Simon Huber']
  spec.email         = ['josua.schmid@renuo.ch', 'simon.huber@renuo.ch']

  spec.summary       = 'This gem provides a data set of all swiss villages taken out of the "Ortschaftenverzeichnis" (https://data.geo.admin.ch/ch.swisstopo-vd.ortschaftenverzeichnis_plz/readme.txt)'
  spec.homepage      = 'https://github.com/renuo/swiss-village-directory'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.74'
  spec.add_development_dependency 'simplecov', '~> 0.17'
end
