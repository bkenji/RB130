# Test it against all test cases (not passing all right now)

def max_by(array)
  max = array.first
  array.each do |e|
   yield(e) > yield(max) ? max = e : max
  end
  max
end

def max_by(array)
  array.inject(array.first) do |max, e|
    yield(e) > yield(max) ? max = e : max 
  end
end

p max_by([1, 5, 3]) { |value| value + 2 }# == 5
p max_by([1, 5, 3]) { |value| 9 - value } # == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil