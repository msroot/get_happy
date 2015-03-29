require 'coveralls'
Coveralls.wear!

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'minitest'
require 'minitest/unit'
require 'yaml'
require 'thor'
require 'fileutils'
require 'get_happy'
require 'rspec'


RSpec.configure do |c|
  c.include MiniTest::Assertions
end
