# -- encoding: utf-8 --
require 'minitest/autorun'
require 'spacetree'

class TestParser < Minitest::Test

  include Spacetree

  def setup
    @parser = Parser.new
  end

  def test_empty_string
    assert_equal n, @parser.parse('')
  end

  def test_one_node
    assert_equal n(nil, n('foo')), @parser.parse('foo')
  end

  def test_more_nodes
    tree = n(nil, n('foo'), n('bar'), n('baz'))
    s = <<~END
    foo
    bar
    baz
    END
    assert_equal tree, @parser.parse(s)
  end

  protected

  def n *args
    Node.new *args
  end

end
