lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'persian/version'

task :buildgem do
	sh('gem build persian.gemspec')
end

task :installgem do
	sh('gem install persian-' + Persian::VERSION + '.gem')
end

task :test do
	sh('rspec')
	sh('rubocop')
end

task :default =>[:buildgem, :installgem] do

end
