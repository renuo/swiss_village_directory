$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage 100

require 'swiss_village_directory'
