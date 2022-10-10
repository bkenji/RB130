# RB130 Challenge: Triangles - 1st pass
# (11:17 - 11:55)

# GOAL & REQUIREMENTS: Write a program that determines whether a triangle is equilateral, isosceles, or scalene 
#  - equilateral: all 3 sides of same length
#  - isosceles: 2 sides of same length
#  - scalene: 0 sides of same length
#  Valid triangle:
# - All sides must be of length > 0
# - Sum of the lengths of any two sides > length of third side

# DS: Integers -> Array of Integers -> String

# HIGH-LEVEL ALGORITHM (Triangle#kind)
# - check if valid triangle (Triangle#valid_triangle?)
# - if all sides are of same length, return "equilateral" 
# - if 2 sides are of same length, return "isosceles"
# - Otherwise, return "scalene"



# SPIKE: 

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [@side1, @side2, @side3]

    raise ArgumentError if !valid_triangle?
  end

  def kind   # returns string: 'equilateral', 'isosceles', or 'scalene'
    if @side1 == @side2 && @side2 == @side3
      "equilateral"
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      "isosceles"
    else
      "scalene"
    end
  end

private 

  def valid_triangle?
    @sides.none?(0) && valid_sides?
  end

  def valid_sides?
    (@side1 + @side2 > @side3) && 
    (@side1 + @side3 > @side2) &&
    (@side2 + @side3 > @side1) 
  end
end


# e = Triangle.new(5, 5, 5,)
# i = Triangle.new(10,10, 3)
# s = Triangle.new( 5, 6, 7)
# inv = Triangle.new(1, 1, 3)
# p e.kind
# p i.kind
# p s.kind

# p inv.valid_triangle?
# p inv.valid_sides?
# p inv.kind


