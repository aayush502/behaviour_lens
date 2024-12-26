# frozen_string_literal: true

require_relative 'lib/behavior_lens/version'

Gem::Specification.new do |spec|
  spec.name = 'behavior_lens'
  spec.version = BehaviorLens::VERSION
  spec.authors = ['Aayush Humagain']
  spec.email = ['aayushhumagain23@gmail.com']

  spec.summary = 'A comprehensive user tracking library for Ruby.'
  spec.description = 'behavior_lens provides advanced tools for tracking user activity,
  sessions, custom events, click heatmaps, and more. It supports real-time updates,
  customizable reports, and data persistence for detailed analysis.'

  spec.homepage = 'https://github.com/aayush502/behaviour_lens'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['documentation_uri'] = 'https://github.com/aayush502/behaviour_lens/wiki'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aayush502/behaviour_lens'
  spec.metadata['changelog_uri'] = 'https://github.com/aayush502/behaviour_lens/blob/master/CHANGELOG.md'

  spec.post_install_message = 'Thank you for installing BehaviorLens! Check out https://github.com/aayush502/behaviour_lens for usage instructions.'
  # behavior_lens.gemspec
  spec.add_dependency 'activerecord', '~> 7.2', '>= 7.2.2.1'
  # behavior_lens.gemspec
  spec.add_dependency 'mysql2'

  spec.add_development_dependency 'rspec', '~> 3.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  File.basename(__FILE__)
  # spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
  #   ls.readlines("\x0", chomp: true).reject do |f|
  #     (f == gemspec) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
  #   end
  # end
  # spec.files = Dir['{lib,sig}/**/*', '*.md', '*.txt', 'Rakefile']
  spec.files = `git ls-files`.split("\n")
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
