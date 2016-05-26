# -- encoding: utf-8 --
module Spacetree

  class Parser

    def parse s
      root = Node.new
      s.chomp.split(/\n/).each do |line|
        root.children << Node.new(line)
      end
      root
    end

  end

end
