spacetree
=========

A Ruby library to generate a tree structure from a text file indented by spaces.

Example
-------

Given a text file tree.txt

    foo
      bar
      baz

Parsing it:

    require 'spacetree'
    parser = Spacetree::Parser.new
    tree = parser.parse File.read('tree.txt')
    # tree is root node
    tree.value # => nil
    tree.children.map(&:value) # => ["foo"]
    tree.children.map(&:children).flatten.map(&:value) # => ["bar", "baz"]


Emitting a tree as indented text:

    puts tree.emit

or simple

    puts tree
  
Author
------

Jan Friedrich <janfri26@gmail.com>

License
-------

MIT license see file LICENSE.
