require "minitest/autorun"

class TestEquality < Minitest::Test

  def setup 
    @value = "XYZ"
  end

  def test_downcase 
    assert_equal("xyz", @value.downcase)
  end
end