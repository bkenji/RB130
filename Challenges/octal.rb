# 12:07 - 12:44 (one test case left)
#1:58 - 2:12 --- total: 51 min

# GOAL: Given an octal input string, implement octal to decimal conversion.
# - Invalid input should be considered octal 0
# - Do not use any built-in methods
# - 

# DS: String(octal) -> Array of digits -> Integer(decimal)

# ALGORITHM:
# - Convert the string into an integer and split it into digits 
# - Iterate over the array of digits (transformation)
#   - Multiply each digit by 8 elevated to the current index
# - Sum the transformed elements of the array



# SPIKE:

class Octal
  attr_reader :octal

  def initialize(str_octal)
    @octal = valid?(str_octal) ? str_octal.to_i : 0
  end

  def to_decimal
    octal.digits.map.with_index do |n, idx|
      n.to_i * (8**idx)
    end.sum
  end

  private
  
  def valid?(str)
   str.chars.all?{|c| c =~ /[0-7]/}
  end
end
