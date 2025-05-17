# encoding: utf-8
require_relative 'lib/spacetree'

Gem::Specification.new do |s|
  s.name = 'spacetree'
  s.version = Spacetree::VERSION

  s.summary = 'Generate a tree structure from a text file indented by spaces.'
  s.homepage = 'https://github.com/janfri/spacetree'

  s.author = 'Jan Friedrich'
  s.email = 'janfri26@gmail.com'

  s.license = 'MIT'

  s.require_path = 'lib'
  s.files = %w[Changelog LICENSE README.md Rakefile] + Dir['{lib,test}/**/*.rb']

  s.add_development_dependency('minitest', '>= 5.9.0')
  s.add_development_dependency('rake', '>= 0')
  s.add_development_dependency('rim', '~> 3.0')
end
