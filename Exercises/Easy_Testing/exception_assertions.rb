require "minitest/autorun"

class NoExperienceError < StandardError; end

class Employee
  def initialize
   @experience = nil
  end

  def hire
    raise NoExperienceError if @experience.nil?
  end
end

class TestException < Minitest::Test
  attr_reader :employee
  def setup
    @employee = Employee.new
  end

  def test_experience
    assert_raises(NoExperienceError) { employee.hire }
  end
end