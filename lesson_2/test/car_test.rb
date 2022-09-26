
require "minitest/autorun"

require_relative "../car"

class CarTest < MiniTest::Test
  attr_reader :car

  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(car)
  end
 
  def test_wheels                     # individual test (instance method starting with `test_`)
    assert_equal(4, car.wheels)       # assertion (what we are trying to verify)
  end

  def test_name_is_nil
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey") # raises an ArgumentError, so assertion passes
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, car)
  end

  # def test_includes_car
  #   arr = [1, 2, 3]
  #   arr << car
  #   assert_includes(arr, car)
  # end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    assert_same(car1, car2)
  end
  
end

