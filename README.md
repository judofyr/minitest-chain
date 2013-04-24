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
end
```

The following assertions are available:

* #equal (assert_equal)
* #match (assert_match)
* #close_to (assert_in_delta)
* #within_epsilon (assert_in_epsilon)
* #instance_of (assert_instance_of)
* #same (assert_same)
* #empty (assert_empty)
* #include (assert_includes)
* #is (assert_operator / assert_predicate)
* #respond_to (assert_respond_to)

You can negate the assertion by prepending the method name with `not_` (e.g.
`not_equal`). The only exception being `is` which can be negated by `is_not`.


