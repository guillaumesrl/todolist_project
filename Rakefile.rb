require 'bundler/gem_tasks'
require 'rake/testtask'
require 'find'


desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end


desc 'Run test'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end


desc 'Display inventory of all files'
task :inventory do
  Find.find('.') do |name|
    puts name if File.file?(name) && !name.include?('/.')
  end
end