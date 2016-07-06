# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swiss_village_directory/version'

Gem::Specification.new do |spec|
  spec.name          = 'swiss-village-directory'
  spec.version       = SwissVillageDirectory::VERSION
  spec.authors       = ['Josua Schmid']
  spec.email         = ['josua.schmid@renuo.ch']

  spec.summary       = 'This gem provides a data set of all swiss villages taken out of the "Ortschaftenverzeichnis" (https://data.geo.admin.ch/ch.swisstopo-vd.ortschaftenverzeichnis_plz/readme.txt)'
  spec.homepage      = 'https://github.com/renuo/swiss-village-directory'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0'
  spec.add_development_dependency 'simplecov', '~> 0'
end
