def drop_while(array)
  arr = array.dup
  array.each do |e| 
    arr.shift if yield(e)
    return arr if !yield(e)
  end
  arr
end

def drop_while(array)
  array.each_with_index do |e, idx|
    return array[idx.. -1] if !yield(e)
  end
  []
end

def drop_while(array)
  (0...array.size).each do |idx|
    return array[idx.. -1] if !yield(array[idx])
  end
  []
end

def drop_while(array)
  array.inject(0) do |idx, el| 
    return array[idx.. -1] if !yield(el)
    idx += 1
  end
  []
end

 p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true }  == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []