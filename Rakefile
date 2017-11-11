require 'rspec/core/rake_task'

task :default => :run

desc "Run tests on my_any? and my_select"
RSpec::Core::RakeTask.new(:spec) do |t|
	t.rspec_opts = "-c -w -f documentation"
	t.verbose = false
end
