def multiple?(n)
  factors = [3, 5]
  factors.all?{|f| n % f == 0}
end


p multiple?(15)
p multiple?(5)
p multiple?(3)
p multiple?(30)