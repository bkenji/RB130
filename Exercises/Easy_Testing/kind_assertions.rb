require "minitest/autorun"

class Kind_Test < Minitest::Test
  def test_kind
    value = 3
    assert_kind_of(Numeric, value)
  end
end