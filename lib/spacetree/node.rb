# -- encoding: utf-8 --
module Spacetree

  class Node

    include Enumerable

    attr_accessor :value, :children

    def initialize value=nil, *children
      @value = value
      @children = children
    end

    def == o
      return false unless o.kind_of? Node
      [self.value, self.children] == [o.value, o.children]
    end

    def each *args, &blk
      enum = Enumerator.new do |y|
        y << self
        children.each do |c|
          c.each *args, &blk
        end
      end
      if block_given?
        enum.each *args, &blk
      else
        enum
      end
    end

  end

end
