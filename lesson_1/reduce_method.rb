# The `Ennumerable#reduce` method takes a collection as an argument, through which it iterates.
# The `reduce` method then yields two arguments to the block: an accumulator object and the current element of the collection
# The return value of the block is then assigned to the accumulator object
# The accumulator is then passed to the block, together with the next current element, in the next iteration.
# After iterating through the collection the `reduce` method returns the accumulator

# It is also possible to initialize the accumulator to a default value.

def reduce(arr, acc = nil)
  acc.nil? ? (acc = arr[0]) && (counter = 1) : counter = 0

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]
p array.reduce(1) {|acc, num|  acc + num}
p reduce(array, 1) {|acc, num| acc + num}

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p array.reduce(10) { |acc, num| acc + num }                 # => 25
# # reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
# puts
p array.reduce { |acc, num| acc * num }                     # => 120
p array.reduce(2) { |acc, num| acc * num }                  # => 240
p array.reduce { |acc, num| acc += num }                    # =>  15
# puts
p reduce(array) { |acc, num| acc * num }                    # => 120
p reduce(array, 2) { |acc, num| acc * num }                 # => 240
p reduce(array) { |acc, num| acc += num }                   # => 15
# # # p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
# puts
p reduce(["a", "b", "c"]) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ["a", "b"]]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
puts

p ["a", "b", "c"].reduce { |acc, value| acc += value }      # => 'abc'
p [[1, 2], ["a", "b"]].reduce { |acc, value| acc + value }  # => [1, 2, 'a', 'b']
