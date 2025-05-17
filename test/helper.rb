# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/spacetree'

module Helper

  protected

  def n *args
    Spacetree::Node.new *args
  end

end
