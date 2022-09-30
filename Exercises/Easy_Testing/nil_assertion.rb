require "minitest/autorun"

class TestNil < Minitest::Test
  def setup
    @value = nil 
  end


  def test_nil
    assert_nil(@value)
  end

end