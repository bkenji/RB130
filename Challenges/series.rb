# 8:32 - 8:54 (22 mins)

# INPUT: String of Digits
# OUTPUT: Array of subarrays (integers) of specified length

# GOAL: Given a string of digits and a specified length, return all possible consecutive number series of that length from the elements in that string. (Return all substrings of a given length as subarrays of integers)
# - a series is  a substring

# DS: String of digits -> substrings -> subarrays of characters converted to integers


# ALGORITHM:
# - Find all substrings of length `l` from the input string (HELPER METHOD 1: find_subs)
# - Split substrings into arrays of characters and return them stored in an array (HELPER METHOD 2: series)

# HELPER METHOD 1: find_subs
# - Iterate over string from 0 up to but excluding string.size minus length


# SPIKE:

class Series
  attr_reader :digits_str

  def initialize(digits_str)
    @digits_str = digits_str
  end

  def slices(length)
    raise ArgumentError if length > digits_str.size
    subs = find_subs(length)
    series(subs)
  end

  private 

  def find_subs(length)
    result = []
    (0..digits_str.size - length).each do |start_index|
        result << digits_str[start_index, length]
    end
    result
  end

  def series(subs)
    subs.map {|sub| sub.chars.map(&:to_i)}
  end
end

