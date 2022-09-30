def step(start, to, step)
  (start..to).each {|n| yield(n) if (n - start) % step == 0}
end

p step(1, 10, 3) { |value| puts "value = #{value}" }