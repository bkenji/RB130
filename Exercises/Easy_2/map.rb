# - Iterates over a collection, which it takes as argument
# - Yiedls each element of the collection successively to the associated block to perform some operation on it
# - The return value of the operation is used to populate a new array of the same size as the input array which is then returned to the caller.
# - If the input array is empty, `map` should return an empty array.

def map(collection) # works with hashes as well as arrays (returns an array)
  collection.each_with_object([]) { |(e1, e2), arr| arr << yield(e1, e2) }
end

def map!(array) # destructive version (works with arrays)
  array.each_with_index { |e, idx| array[idx] = yield(e) }
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
