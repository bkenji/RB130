# Write a `select` method that mirrors the behavior of `Array#select`.

# Implementation using a while loop:

# def select(arr)
#   counter = 0
#   result = []
#   while counter < arr.size
#     if block_given?
#       result << arr[counter] if yield(arr[counter])
#     end
#     counter += 1
#   end
#   result
# end

# Implementation using Array#each:

def select(arr)
  result = []
  arr.each do |element|
    if block_given?
      result << element if yield(element)
    end
  end
  result
end

arr = [1, 2, 3, 4, 5]

p arr.select { |num| num.odd? }
# p arr.select { |num| puts num }
p arr.select { |num| num + 1 }
p select(arr) { |num| num.odd? }
# p select(arr) { |num| puts num }
p select(arr) { |num| num + 1 }
