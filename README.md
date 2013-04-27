# MiniTest::Chain

MiniTest::Chain gives you readable, RSpec-comparable, chainable assertions:

```ruby
require 'minitest-chain'

class TestChain < MiniTest::Unit::TestCase
  include MiniTest::Chain
  
  def test_plus
    assert(2 + 2).equal(4)
    assert(2 + 2).not_equal(5)
  end

  def test_minus
    assert(2 - 2).is(:zero?)
    assert(2 - 1).is_not(:zero?)
  end

  def test_expect
    list = [1, 2, 3]
    expect(list.index(4)).nil
  end

  def test_expect_raise
    expect { 1 + '2' }.raises(TypeError)
  end
end
```

The following assertions are available:

* #equal (assert_equal)
* #match (assert_match)
* #nil (assert_nil)
* #close_to (assert_in_delta)
* #within_epsilon (assert_in_epsilon)
* #instance_of (assert_instance_of)
* #kind_of (assert_kind_of)
* #same (assert_same)
* #empty (assert_empty)
* #include (assert_includes)
* #is (assert_operator / assert_predicate)
* #respond_to (assert_respond_to)
* #raises (assert_raises)
* #throws (assert_throws)
* #silent (assert_silent)
* #output (assert_output)

You can negate the assertion by prepending the method name with `not_` (e.g.
`not_equal`). The only exception being `is` which can be negated by `is_not`.

You can use `expect` to start a chain without requiring a value to be truthy.

