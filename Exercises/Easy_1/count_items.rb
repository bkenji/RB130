

def count(array)
  result = []
  array.each {|e| result << e if yield(e)}
  result.size
end


def count(array)
  count = 0
  array.each {|e| count += 1 if yield(e)}
  count
end


def count(array)
  array.select{|e| yield(e)}.size
end

def count(array, &block)
  array.select(&block).size
end

def count(arr, &block)
  return 0 if arr.empty?
  yield(arr.shift) ? count(arr, &block) + 1 : count(arr, &block)
end

def count(enumerable)
  enumerable.reduce(0) do |count, args|
    count + (yield(args) ? 1 : 0)
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } # == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
