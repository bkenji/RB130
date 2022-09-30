require "minitest/autorun"

class EmptyObjectTest < Minitest::Test
  def setup
    @list = []
  end


  def test_empty
    assert_empty @list
  end
end