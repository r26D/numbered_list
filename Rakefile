# require 'rake/testtask'
#
# Rake::TestTask.new do |t|
#   t.libs << 'test'
# end
#
# desc "Run tests"
# task :default => :test

require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
# Default directory to look in is `/spec`
RSpec::Core::RakeTask.new(:spec)
task :default => :spec