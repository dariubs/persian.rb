lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

desc 'Build gem'
task :buildgem do
  sh('gem build persian.gemspec')
end

desc 'install builded version of gem'
task :installgem do
  sh('gem install persian-' + Persian::VERSION + '.gem')
end

desc 'Run specs with Rspec'
task :rspec do
  sh('rspec')
end

desc 'Check code style with rubocop'
task :rubocop do
  sh('rubocop')
end

desc 'Run code tests'
task test: [:rspec, :rubocop] do
end

desc 'Generate docs'
task :doc do
  sh('yard doc')
end

desc 'Build and install gem'
task default: [:test, :buildgem, :installgem] do
end
