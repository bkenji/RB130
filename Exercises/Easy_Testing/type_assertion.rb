require 'minitest/autorun'

class TypeTest < Minitest::Test
  def test_type
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_type_2
    value = Numeric.new
    assert_equal(Numeric, value.class)
  end
end