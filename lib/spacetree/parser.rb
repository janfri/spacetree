# -- encoding: utf-8 --
module Spacetree

  # Parser to parse a text file indented by spaces to a tree structure
  class Parser

    # Do parsing
    # @s String to parse
    # @blk if block given each line without the starting spaces is yielded
    def parse s, &blk
      root = Node.new
      @indent_map = {-1 => root}
      s.chomp.split(/\n/).each do |line|
        generate_node line, &blk
      end
      root
    end

    protected

    def generate_node line
      if line =~ /(^ *)([^ ].*)$/
        indent = $1.size
        line = $2
        line = yield line if block_given?
        parent = search_parent_node indent
        new_node = Node.new line
        @indent_map[indent] = new_node
        parent.children << new_node
      end
    end

    def search_parent_node indent
      fail ArgumentError if indent < 0
      (indent - 1).downto(-1).each do |i|
        res = @indent_map[i]
        return res if res
      end
      fail ArgumentError
    end

  end

end
