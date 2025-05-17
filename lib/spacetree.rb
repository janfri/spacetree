# encoding: utf-8
# Generate a tree structure from a text file indented by spaces.
module Spacetree

  VERSION = '1.0.2'

  autoload :Node, 'spacetree/node'
  autoload :Parser, 'spacetree/parser'

  # Do parsing @see Parser#parse
  def self.parse s, &blk
    Parser.new.parse s, &blk
  end

  # Generate a formatted string representation of a node and its children
  # recursively
  # @see Node#emit
  def self.emit node
    node.emit
  end

end
