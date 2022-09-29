
def time_it
  start_time = Time.now
  yield if block_given?
  finish_time = Time.now

  puts "It took #{finish_time - start_time} seconds."
end

def divisors(num)
  results = []
  (1..Math.sqrt(num)).each {|n| results << n << num / n if (num % n).zero?}
  results.uniq.sort
end

# def divisors(num, arr=Array.new)
#   return 1 if num == 2
#   arr << divisors(num - 1) if (num %)
# end


time_it {p divisors(1) == [1]}
time_it {p divisors(7) == [1, 7]}
time_it {p divisors(12) == [1, 2, 3, 4, 6, 12]}
time_it {p divisors(98) == [1, 2, 7, 14, 49, 98]}
time_it {p divisors(99400891) == [1, 9967, 9973, 99400891]} # may take a minute