lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

desc 'Build and install persian gem'
task default: [:build, :install]

desc 'Build persian gem'
task :build do
  sh('gem build persian.gemspec')
end

desc 'Install builded lastest version of gem'
task :install do
  sh('gem install persian-' + Persian::VERSION + '.gem')
end

desc 'Run Rspec specs'
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

desc 'Generate yard docs in doc/ directory'
task :doc do
  sh('yard doc')
end
