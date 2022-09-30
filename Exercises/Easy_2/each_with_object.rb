# takes a collection and an arbirary object as an argument, and a block
# passes each element of the collection and an object (usually a collection) to the block
# at each iteration the object may be modified by the block
# retrns the final value of the object


def each_with_object(array, obj)
  array.each { |e| yield(e, obj) }
  obj
end

def each_with_object(array, obj)
  array.inject(obj) {|obj, el| yield(el, obj); obj}
end



result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}