# -- encoding: utf-8 --
require_relative 'helper'

class TestParser < Minitest::Test

  include Helper
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

  def test_simple_indentation
    tree = n(nil, n('foo', n('bar')))
    s = <<~END
    foo
      bar
    END
    assert_equal tree, @parser.parse(s)
  end

  def test_usual_indentation
    tree = n(nil, n('foo1', n('foo2', n('foo3'))), n('bar1', n('bar2', n('bar3'))), n('baz1', n('baz2', n('baz3'))))
    s = <<~END
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
    assert_equal tree, @parser.parse(s)
  end

  def test_spaces_in_line
    tree = n(nil, n('foo and bar', n('bar and baz', n('baz and foo'))))
    s = <<~END
    foo and bar
      bar and baz
        baz and foo
    END
    assert_equal tree, @parser.parse(s)
  end

  def test_converting_line
    tree = n(nil, n(%i(foo bar)), n(%i(bar baz)))
    s = <<~END
    foo bar
    bar baz
    END
    res = @parser.parse(s) do |line|
      line.split.map &:to_sym
    end
    assert_equal tree, res
  end

end
