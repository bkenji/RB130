# 2:44 - 3:11 (27 min)

# INPUT: Integer, Array of Integers(default: [3, 5])
# OUTPUT:  Integer (sum of all multiples of elements less than integer input)

# GOAL: Calculate the sum of the multiples of the factors given in an array up to, but excluding, X.


# DS:
# 10 -> 3, 5, 6, 9
# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
# ALGORITHM:
# - Initialize a results array
# - Iterate over a range going from 1 up to, but excluding, X.
#  - If the current number is a multiple of all the numbers in the factors array, include it in results
# - Return the sum of the elements of results.

# SPIKE

class SumOfMultiples
  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def to(num)
    (1...num).select{|n| multiple?(n)}.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  private 
  
  attr_reader :factors

  def multiple?(n)
    factors.any?{|f| n % f == 0}
  end
end


n = SumOfMultiples.new

p n.to(10)

