require "get_happy/version"
require "thor"
require 'yaml'
require 'json'
require "get_happy/cli"
require "get_happy/engine"

module GetHappy 
  class CLI
    default_task :play
  end 
end