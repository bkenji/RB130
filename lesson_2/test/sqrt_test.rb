require "minitest/autorun"

require_relative "../sqrt.rb"

class SquareRootTest < Minitest::Test
  def test_that_sqrt_of_9_is_3
    result = square_root(9)
    assert_equal 3, result
  end

  def test_that_sqrt_of_17_is_4
    result = square_root(17)
    assert_equal 4, result
  end

  def test_that_sqrt_of_24_is_5
    result = square_root(24)
    assert_equal 5, result
  end

  def test_that_sqrt_of_negative_is_nil
    result = square_root(-1)
    assert_nil result
  end
end

