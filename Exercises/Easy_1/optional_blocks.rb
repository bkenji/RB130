# def compute
#   block_given? ? yield : "Does not compute."
# end

# Further exploration:
def compute(arg="default")
  block_given? ? yield(arg) : "Does not compute."
end

# Furthering exploration with explicit block:
def compute(arg= "default", &block)
  block_given? ? block.call(arg) : "Does not compute."
end

chars = :chars.to_proc

p compute(3) {|arg|[1, 2] << arg} # => [1, 2, 3]
p compute("echo") {|arg| arg * 2} # => "echoecho"
p compute(&:upcase)               # => "DEFAULT" (implictly calls `to_proc` on the `Symbol` obj)
p compute(&chars)                 # => ["d", "e", "f", "a", "u", "l", "t"] (passing a Proc obj)
p compute("no block")             # => "Does not compute."
p compute                         # => "Does not compute."


