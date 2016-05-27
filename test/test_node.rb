# -- encoding: utf-8 --
require_relative 'helper'

class TestNode < Minitest::Test

  include Helper

  FOO_BAR_BAZ_TREE_STRING = <<~END.chomp
    foo1
      foo2
        foo3
    bar1
      bar2
        bar3
    baz1
      baz2
        baz3
  END

  def test_enumerable
    arr = [nil, 'foo1', 'foo2', 'foo3', 'bar1', 'bar2', 'bar3', 'baz1', 'baz2', 'baz3']
    res = foo_bar_baz_tree.map &:value
    assert_equal arr, res
  end

  def test_emit_one_node
    assert_equal '', n(nil).emit
    assert_equal 'foo', n('foo').emit
    assert_equal '  foo', n('foo').emit(level: 1)
    assert_equal '    foo', n('foo').emit(level: 2)
    assert_equal '   foo', n('foo').emit(indent: 3, level: 1)
    assert_equal '      foo', n('foo').emit(indent: 3, level: 2)
  end

  def test_complex_emit
    assert_equal FOO_BAR_BAZ_TREE_STRING, foo_bar_baz_tree.emit
  end

  def test_emit_argumenterror_for_negative_arguments
    assert_raises ArgumentError do
      n('foo').emit(indent: -1)
    end
    assert_raises ArgumentError do
      n('foo').emit(level: -1)
    end
  end

  def test_to_s
    assert_equal FOO_BAR_BAZ_TREE_STRING, foo_bar_baz_tree.emit
  end

  protected

  def foo_bar_baz_tree
    n(nil, n('foo1', n('foo2', n('foo3'))), n('bar1', n('bar2', n('bar3'))), n('baz1', n('baz2', n('baz3'))))
  end

end
