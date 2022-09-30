require "minitest/autorun"

class Refutation < Minitest::Test
  def test_not_included
    list =[3, 2,"xyZ"]
    refute_includes(list, "xyz")
  end 
end