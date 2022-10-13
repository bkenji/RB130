# 2:35...3:50

# GOAL: Write a program that converts modern decimal numbers into their Roman number equivalents
# - The logic (and length and cumbersomeness) of Roman numbers is related to the fact that the Romans did not know 0 (which meant they could not reuse the digits from one place-value to another and had to come up with distinct symbols for them).
# Unique Roman numerals (at every 5 units a unique numeral; the 4th unit is the 5th unique numeral minus one of the previous unit):
# 1 - I
# 5 - V
# 10 - X
# 50 - L
# 500 - D
# 100 - C
# 1000 - M
# 9 - IX
# 90 - XC
# 900 - CM


# DS: Integer -> Array of Digits -> Hash -> String (roman numeral)
# 2008 -> two 1000 (MM);
#      -> skip the zeros
#      -> eight 1 -> one 5 (V) plus three 1 (III)
#      -> MMVIII

# 98 -> one 100 (C) minus one 10 (X) -> XC
#    -> eight 1 (VIII)         
#    -> XCVIII

# HIGH-LEVEL ALGORITHM:
# - Determine the place value of each digit of the input number
# - Store each place-value number in a sorted array
# - Divide each element of the array by the corresponding key in the conversion hash, and multiply the value by the quotient (how do you determine the corresponding key)

# SPIKE:
class RomanNumeral
  attr_reader :number

  ONES      = %w(I II III IV V VI VII VIII IX)
  TENS      = %w(X XX XXX XL L LX LXX LXXX XC)
  HUNDREDS  = %w(C CC CCC CD D DC DCC DCCC CM)
  THOUSANDS = %w(M MM MMM)

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = number.digits
    ones, tens, hundreds, thousands = digits.map{|n| n.zero? ? nil : n}
    thousands &&= THOUSANDS[thousands - 1] 
    hundreds  &&= HUNDREDS[hundreds - 1]
    tens      &&= TENS[tens - 1]
    ones      &&= ONES[ones - 1] 
    "#{thousands}#{hundreds}#{tens}#{ones}"
  end
end

