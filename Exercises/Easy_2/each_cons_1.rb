# takes two arguments: a collection and an integer (the number of consecutive elements to iterate over and yield to the block)
# iterates over collection and passes n elements to the associated block
# returns nil

# for this first part of the exercise make it work with 2 elements at a time

def each_cons(array)
  (0...array.size - 1).each do |idx|
   yield(array[idx], array[idx + 1])
  end
  nil
end

p each_cons([1, 2, 3, 4]){|e, b| p [e, b]}
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil