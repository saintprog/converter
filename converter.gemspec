# frozen_string_literal: true

require File.expand_path('lib/converter/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'converter'
  spec.version               = Converter::VERSION
  spec.authors               = ['Mikhail Bobryshev']
  spec.email                 = ['saintprog@gmail.com']
  spec.summary               = 'Converts everything!'
  spec.description           = 'A simple gem that extends numbers functionality to easily convert between some measurements'
  spec.homepage              = 'https://github.com/saintprog/converter'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 3.0'

  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb',
                   'converter.gemspec']
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

end
