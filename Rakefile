require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

task :build_local do
  system "rake build && rake install && get_happy"
end

task :default => :spec

