# iterates through the array
# yields each element to the block
# the block can perform any operation it needs to each element
# returns the calling object

def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter]) if block_given?
    counter += 1
  end
  array
end

arr = [5, 4, 3, 2]

p each(arr) { |n| puts n * 2 }.select { |n| n.odd? }
