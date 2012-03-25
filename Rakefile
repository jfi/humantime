# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "humantime"
  gem.homepage = "http://github.com/jfi/humantime"
  gem.license = "ISC"
  gem.summary = %Q{Outputs human readable times}
  gem.description = %Q{Outputs human readable times}
  gem.email = "james@jamesinman.co.uk"
  gem.authors = ["James Inman"]
  gem.files = ["README*", "LICENSE*", "lib/humantime.rb"]
end
Jeweler::RubygemsDotOrgTasks.new