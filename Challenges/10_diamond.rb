# 9:13 - 9:26
# 9:32 - 10:54
# 13 + 82 = 95 mins (1h35)

# INPUT: letter
# OUTPUT: diamond shape, starting/ending at A, with the input letter at the widest (center) row of diamond.

# GOAL: Output a diamond that starts and ends at A and whose widest row (center) consists of a sequence of the input letter.
# - The diamond is both vertically and horizontally symmetric
# - All rows, except first and last, have exactly two identical letters
# - Diamond has a quare shape (width equals height) - ?
# - Top half has the letters in ascending order
# - Bottom half has the letters in descending order
# - The four corners are triangles - ?


# APPROACH:
# - Replace whitespaces (invisible) by dots (visible) to understand pattern.

# DS: String
# ..A..     
# .B.B.
# C...C
# .B.B.
# ..A..
# # 5 x 5

# ....A....
# ...B.B...   
# ..C...C..
# .D.....D.
# E.......E
# .D.....D.
# ..C...C..
# ...B.B...  
# ....A....
# # 9 x 9

# ALGORITHM:
# Horizontal symmetry:
# - Calculate `side`` of the diamond/square:  ("A"..letter).to_a.size * 2 - 1
# - Define variables/methods side_space, center_space, letter
# - center_space is incremented in odd steps (1,3,5...) up to `side` - 2
# - side_space is DEcremented in single steps, starting at side / 2 (integer division) down to 0 (the row where  input `letter` belongs)
# Vertical symmetry:
# - Repeat the process in reverse 

# SPIKE:

class Diamond
  def self.make_diamond(letter)
    class_ivars(letter)
    @diamond << half + half.reverse[1..]
    @diamond.join
  end

  class << self
    SPACE = " "
    
    private

    def half
      half = []
      @range.each_with_index do |char, i|
        half << row(char, i)
      end
      @center_gap = 1
      half
    end

    def row(char, i)
      if char == "A"
        "#{side_space(i)}#{char}#{side_space(i)}\n"
      else
        "#{left_half(char, i)}#{center_space}#{right_half(char, i)}\n"
      end
    end

    def side_space(index)
      SPACE * (@side / 2 - index)
    end

    def left_half(char, i)
      "#{side_space(i)}#{char}"
    end

    def right_half(char, i)
      "#{char}#{side_space(i)}"
    end

    def center_space
      space = SPACE * @center_gap
      @center_gap += 2
      space
    end

# Initializing class ivars for convenience and cleaner code:
    def class_ivars(letter)  
      @range = ("A"..letter)
      @diamond = []
      @center_gap = 1
      @side = (@range).to_a.size * 2 - 1
    end
  end
end

puts Diamond.make_diamond("D")


