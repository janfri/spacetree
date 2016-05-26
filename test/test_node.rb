# -- encoding: utf-8 --
require_relative 'helper'

class TestNode < Minitest::Test

  include Helper

  def setup
    @tree = n(nil, n('foo1', n('foo2', n('foo3'))), n('bar1', n('bar2', n('bar3'))), n('baz1', n('baz2', n('baz3'))))
  end

  def test_enumerable
    arr = [nil, 'foo1', 'foo2', 'foo3', 'bar1', 'bar2', 'bar3', 'baz1', 'baz2', 'baz3']
    res = @tree.map &:value
    assert_equal arr, res
  end

end
