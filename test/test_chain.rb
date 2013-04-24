require_relative 'helper'

class TestChain < MiniTest::Unit::TestCase
  include MiniTest::Chain

  def assert_refutes
    assert_raises(MiniTest::Assertion) do
      yield
    end
  end

  def test_equal
    assert("Hello").equal("Hello")
    assert("World").not_equal("Hello")

    assert_refutes { assert("World").equal("Hello") }
    assert_refutes { assert("Hello").not_equal("Hello") }
  end

  def test_match
    assert("World").match(/World/)
    assert("Hello").not_match(/World/)

    assert_refutes { assert("Hello").match(/World/) }
    assert_refutes { assert("World").not_match(/World/) }
  end

  def test_empty
    assert([]).empty
    assert([1]).not_empty

    assert_refutes { assert([1]).empty }
    assert_refutes { assert([]).not_empty }
  end

  def test_includes
    assert([1]).include(1)
    assert([2]).not_include(1)

    assert_refutes { assert([2]).include(1) }
    assert_refutes { assert([1]).not_include(1) }
  end

  def test_close_to
    assert(1.5).close_to(1.5)
    assert(2.0).not_close_to(1.5)

    assert_refutes { assert(2.0).close_to(1.5) }
    assert_refutes { assert(1.5).not_close_to(1.5) }
  end

  def test_within_epsilon
    assert(1.6).within_epsilon(1.5, 0.10)

    assert_refutes do
      assert(1.9).within_epsilon(1.5, 0.10)
    end
  end

  def test_instance_of
    assert(1  ).instance_of(Fixnum)
    assert(1.5).not_instance_of(Fixnum)

    assert_refutes { assert(1.5).instance_of(Fixnum) }
    assert_refutes { assert(1  ).not_instance_of(Fixnum) }
  end

  def test_is
    assert(1).is(:<, 2)
    assert(3).is_not(:<, 2)

    assert_refutes { assert(3).is(:<, 2) }
    assert_refutes { assert(1).is_not(:<, 2) }
  end

  def test_not_is
    assert_raises(NoMethodError) do
      assert(1).not_is(:zero?)
    end
  end

  def test_is_predicate
    assert([]).is(:empty?)
    assert([1]).is_not(:empty?)

    assert_refutes { assert([1]).is(:empty?) }
    assert_refutes { assert([]).is_not(:empty?) }
  end

  def test_respond_to
    assert([]).respond_to(:empty?)
    assert(1).not_respond_to(:empty?)

    assert_refutes { assert(1).respond_to(:empty?) }
    assert_refutes { assert([]).not_respond_to(:empty?) }
  end

  def test_same
    a = Object.new
    b = Object.new

    assert(a).same(a)
    assert(a).not_same(b)

    assert_refutes { assert(a).same(b) }
    assert_refutes { assert(a).not_same(a) }
  end

  def test_chain
    assert(1)
      .is(:>, 0)
      .equal(1)
      .instance_of(Fixnum)
  end

  def test_nil
    expect(nil).nil
    expect(1).not_nil

    assert_refutes { expect(1).nil }
    assert_refutes { expect(nil).not_nil }
  end
end

