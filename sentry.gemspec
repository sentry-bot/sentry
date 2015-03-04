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

  gem.add_dependency 'thor'
  gem.add_dependency 'daemons'
  gem.add_dependency 'colorize'
  gem.add_dependency 'eventmachine'

  gem.add_dependency 'cinch'
  gem.add_dependency 'cinch-identify'

  gem.add_development_dependency 'bundler'
end
