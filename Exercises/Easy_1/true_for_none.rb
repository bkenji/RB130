def any?(arr)
  false if arr.each { |e| return true if yield(e) } 
end

# solution 1:
def none?(array)
  true if array.each { |e| return false if yield(e) }
end

# solution 2:
def none?(array, &block)
   any?(array, &block) ? false : true
end



p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true