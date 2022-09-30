require "minitest/autorun"


class TestInclude < Minitest::Test
  def setup
    @list = ["xyz"]
  end

  def test_include
    assert_includes(@list, "xyz")
  end

end