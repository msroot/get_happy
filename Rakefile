require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

task :build_local do
  system "rake build && rake install"
end


task :default do
  system "bundle exec rspec"
end





task :default => :spec

