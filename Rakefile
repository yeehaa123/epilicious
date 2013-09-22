require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new(:default) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

Rake::TestTask.new(:cookbook) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/cookbook_test.rb"]
end

Rake::TestTask.new(:recipe) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/recipe_test.rb"]
end

Rake::TestTask.new(:utilities) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/utilities_test.rb"]
end

Rake::TestTask.new(:main) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/epilicious_test.rb"]
end
