# -- encoding: utf-8 --
require 'minitest/autorun'
require 'spacetree'

module Helper

  protected

  def n *args
    Spacetree::Node.new *args
  end

end
