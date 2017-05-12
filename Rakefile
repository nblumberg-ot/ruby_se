require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['tests/test*.rb']
  puts t.name
  t.verbose = true
end

# Rake::TestTask.new(:fast) do |t|
#   files = if ENV['TEST_FILES']
#     ENV['TEST_FILES'].split(',')
#   else
#     FileList["tests/test_*.rb"]
#   end

#   t.libs << 'test'
#   t.verbose = true
#   t.test_files = files
# end
# Rake::Task['test:fast'].comment = "Runs unit/functional/integration tests (or a list of files in TEST_FILES) in one block"