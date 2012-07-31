require 'rubygems'
require 'rspec/core/rake_task'
require File.join(File.dirname(__FILE__), 'lib/shuttle')

task :default => :test
task :test => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    #t.pattern = 'spec/**/*_spec.rb' # not needed this is default
    t.rspec_opts = %w{--colour --format progress}
  end
end

namespace :shuttle do
  desc 'some task'
  task :some_task do
    puts 'Some task.'
  end
end

