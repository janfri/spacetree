# -*- encoding: utf-8 -*-
# stub: spacetree 1.0.0 ruby lib
#
# This file is automatic generated by rim.
# PLEASE DO NOT EDIT IT DIRECTLY!
# Change instead the values in Rim.setup in Rakefile.

Gem::Specification.new do |s|
  s.name = "spacetree".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jan Friedrich".freeze]
  s.date = "2016-05-27"
  s.description = "".freeze
  s.email = "janfri26@gmail.com".freeze
  s.files = ["Changelog".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "lib/spacetree".freeze, "lib/spacetree.rb".freeze, "lib/spacetree/node.rb".freeze, "lib/spacetree/parser.rb".freeze, "test/helper.rb".freeze, "test/test_node.rb".freeze, "test/test_parser.rb".freeze]
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Generate a tree structure from a text file indented by spaces.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rim>.freeze, ["~> 2.6"])
    else
      s.add_dependency(%q<rim>.freeze, ["~> 2.6"])
    end
  else
    s.add_dependency(%q<rim>.freeze, ["~> 2.6"])
  end
end
