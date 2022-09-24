# The `Ennumerable#reduce` method takes a collection as an argument, through which it iterates.
# The `reduce` method then yields two arguments to the block: an accumulator object and the current element of the collection
# The return value of the block is then assigned to the accumulator object
# The accumulator is then passed to the block, together with the next current element, in the next iteration.
# After iterating through the collection the `reduce` method returns the accumulator

# It is also possible to initialize the accumulator to a default value.

# Implementation with a while loop:

# def reduce(arr, acc = 0)
#   counter = 0

#   while counter < arr.size
#     acc = yield(acc, arr[counter])
#     counter += 1
#   end

#   acc
# end

# Implementation with `Array#each`:

def reduce(arr, acc = arr[0])
  counter = 0

  if acc == arr[0]
    arr[1..-1].each do |element|
      acc = yield(acc, element)
      counter += 1
    end
  else
    arr.each do |element|
      acc = yield(acc, element)
      counter += 1
    end
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p array.reduce(10) { |acc, num| acc + num }                 # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
puts
p array.reduce { |acc, num| acc * num }                     # => 120
p array.reduce(2) { |acc, num| acc * num }                  # => 240
p array.reduce { |acc, num| acc += num }                    # =>  15
puts
p reduce(array) { |acc, num| acc * num }                    # => 120
p reduce(array, 2) { |acc, num| acc * num }                 # => 240
p reduce(array) { |acc, num| acc += num }                   # => 15
# # p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
puts
p reduce(["a", "b", "c"]) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ["a", "b"]]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
puts

p ["a", "b", "c"].reduce { |acc, value| acc += value }      # => 'abc'
p [[1, 2], ["a", "b"]].reduce { |acc, value| acc + value }  # => [1, 2, 'a', 'b']
