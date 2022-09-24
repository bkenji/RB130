5.times do |num|
  puts num
end

# Implementation using each:

# def times(int)
#   (0...int).each do |n|
#     yield(n)
#   end
#   int
# end

#Implementation using a while loop:

def times(int)
  counter = 0
  while counter < int
    yield(counter) if block_given?
    counter += 1
  end
  int
end

times(5) do |num|
  puts num
end

# Let's trace execution:
# Line 12 invokes the method `times`, passing  the integer 5 as an argument, and a block of code.
# Execution enters the first line of the method at line 5, where the method variable `int` is assigned to the integer 5.
# On line 6 the `Range#each` method is invoked on the range (0...5), upon which it iterates, passing each number of the range as arguments at each consecutive iteration.
# For each number in the range, line 7 will be executed yielding control to the block and passing in the current number.
# Execution jumps to the block on line 12, setting the block local variable `num` to the current number.
# Execution continues in the block to line 13, which outputs the block local variable `num`.
# Reaching the end of the block, execution continues back to the `times` method implementation on line 6, proceeding to the next iteration, repeating the steps above with the current number assigned to the block local variable `n`, until the last number of the range (4) is reached and passed in to the block local variable and output.
# Once all the iterations are over, execution moves to line 9, the argument passed in to the method, which, being the last expression in the method body, is returned.
