require "bundler"
Bundler::GemHelper.install_tasks
require "rspec/core/rake_task"
require_relative "lib/ffuu_formatter"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = "--format FfuuFormatter --color"
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
