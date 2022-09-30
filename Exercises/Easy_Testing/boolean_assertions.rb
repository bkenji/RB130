                                          # Minimum code required to run a test with Minitest:

require 'minitest/autorun'                # require minitest 

class BooleanTest < MiniTest::Test        # define a subclass of `Minitest::Test`            (Test Suite)
  def test_odd?                           # define a method (or more) starting with `test_`  (Test Case)
    value = 4
    assert_equal(true, value.odd?)        # invoke the desired assertion(s) against the 
                                          # return value to be tested                        (Test Step)
  end
end 