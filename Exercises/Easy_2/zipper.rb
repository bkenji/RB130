# take two arrays as arguments
# return a new Array
# the new array should consist of  2-elements subarrays, where the first element is a value from the first array, and the second element is a value from the second arrary


def zip(arr1, arr2)
  count = 0
  new_array = []
  while count < arr1.size
    new_array << [arr1[count], arr2[count]]
    count += 1
  end
  new_array
end

def zip(arr1, arr2)
  arr1.each_index.with_object([]) do |idx, new_arr|
    new_arr << [arr1[idx], arr2[idx]]
  end
end

def zip(arr1, arr2)
  (0...arr1.size).map {|n| [arr1[n], arr2[n]] }
end

def zip(arr1, arr2)
  new_arr = []
  0.upto(arr1.size - 1) {|n| new_arr << [arr1[n], arr2[n]]}
  new_arr
end

def zip(arr1, arr2)
  arr1.size.times.with_object([]){|idx, arr| arr << [arr1[idx], arr2[idx]]}
end

def zip(arr1, arr2)
  (0...arr1.size).map.with_object({})  {|idx, hsh| hsh[arr1[idx]] = arr2[idx]}.to_a
end



p zip([1, 2, 3], [4, 5, 6])== [[1, 4], [2, 5], [3, 6]]