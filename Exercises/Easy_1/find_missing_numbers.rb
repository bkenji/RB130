
def missing(array)
  (array.first..array.last).reject {|n| array.include?(n)}
end

# Further Exploration, invoking methods that don't require a block:

# Solution 1:
def missing(arr)
  (arr.first..arr.last).to_a - arr
end

# Solution 2:
def missing(array)
  full_array = (array.first..array.last).to_a
  full_array.delete(array.shift) until array.empty?
  full_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []