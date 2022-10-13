def find_subs(digits, length)
  result = []
  (0..digits.size - length).each do |start_index|
      result << digits[start_index, length]
  end
  result
end

def slices(digits, length)
  subs = find_subs(digits, length)
  series(subs)
end

def series(subs)
  subs.map {|sub| sub.chars.map(&:to_i)}
end

p slices("01234", 2)
p series(["01", "12", "23", "34"])