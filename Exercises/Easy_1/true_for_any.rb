# The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for any element, then #any? returns true. Otherwise, #any? returns false. Note in particular that #any? will stop searching the collection the first time the block returns true.

# Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

# - should stop processing elements for the first element the block returns true
# -  if the input array is empty, return false.
# - cannot use any `all?`, `any?`, `none?`, or `one?` methods.

# APPROACH:
# Since explicit returns from within a block causes the enclosing method to return (as opposed to simply exiting the block or the iteration), we can use the `return` keyword from within the block to pop the method `any?` from the call stuck returning true if any of the elements return true within the block. Otherwise, the method will return false.

def any?(arr)
  false if arr.each { |e| return true if yield(e) } 
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

