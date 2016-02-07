# -*- encoding: utf-8 -*-

require File.expand_path('../lib/sentry/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "sentry"
  gem.version       = Sentry::VERSION
  gem.summary       = %q{IRC Bot}
  gem.description   = %q{IRC Bot}
  gem.license       = "ISC"
  gem.authors       = ["jRiddick"]
  gem.email         = "apersson.93@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/sentry"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'thor', '~> 0.19'
  gem.add_dependency 'daemons', '~> 1.2'
  gem.add_dependency 'colorize', '~> 0.7'
  gem.add_dependency 'eventmachine', '~> 1.0.9'

  gem.add_dependency 'cinch', '~> 2.0'
  gem.add_dependency 'cinch-identify', '~> 1.7'

  gem.add_dependency 'sentry-helper', '~> 0.1'
  gem.add_dependency 'sentry-github', '~> 0.1'
  gem.add_dependency 'sentry-reddit', '~> 0.1'
  gem.add_dependency 'sentry-titles', '~> 0.1'
  gem.add_dependency 'sentry-videos', '~> 0.1'

  gem.add_development_dependency 'bundler'
end
