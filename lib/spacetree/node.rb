# -- encoding: utf-8 --
module Spacetree

  class Node

    attr_accessor :value, :children

    def initialize value=nil, *children
      @value = value
      @children = children
    end

    def == o
      return false unless o.kind_of? Node
      [self.value, self.children] == [o.value, o.children]
    end

  end

end
