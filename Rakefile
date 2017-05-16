require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['tests/test*.rb']
  puts t.name
  t.verbose = true
end
