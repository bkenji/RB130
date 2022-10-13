# 10:34 - 10:54

# GOAL: Write a number that takes a number and returns a string telling whether a number is "perfect", "abundant", or "deficient"
# - Perfect numbers are equal to the sum of its positive divisors (its factors minus the number itself)
# - Abundant numbers are smaller than the sum of its positive divisors
# - Deficient numbers are greater than the sum of its positive divisors
# - Prime numebrs are always deficient since their only divisor is 1
# - Numbers must be positive (if negative, raise StandardError)

# DS: Integer -> Array of Integers (positive divisors) -> String

# ALGORITHM:
# - Convert input integer into an array containing its positive divisors (HELPER METHOD 1)
# - Sum the positive divisors and return whether they qualify the integer as perfect, abundant, or deficient (HELPER METHOD 2)

# SPIKE: 
class PerfectNumber
  class << self
    attr_reader :number 

    def classify(number)
      raise StandardError if number < 1
      @number = number
    
      case aliquot
      when number  then "perfect"
      when ...number then "deficient"
      else "abundant"
      end
    end

    private 

    def aliquot
      (1..number/2).select {|n| number % n == 0}.sum
    end
  end
end

