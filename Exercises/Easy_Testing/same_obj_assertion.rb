require "minitest/autorun"

class List
  def process
    self
  end
end

class TestSameObject < Minitest::Test
  def test_same_obj
    list = List.new
    assert_same(list, list.process)
  end

end