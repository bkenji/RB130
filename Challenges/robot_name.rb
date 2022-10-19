# 3:32pm

# GOAL: Write a program that instantiates new Robot objects with a random name following a given Regex pattern. When a robot is reset to its factory settings, their name gets wiped. The next time the Robot#name method is invoked, it will have a new random name following the same pattern.
# - Use `Kernel#srand` with the 1234 seed to generate random names for different robots
# - Look up documentation for `Kernel#rands`
# - Look up Random class (https://ruby-doc.org/core-3.1.2/Random.html#method-c-rand)

# DS:

# ALGORITHM:



# SPIKE:


class Robot
  attr_reader :name
  @@names = []
 
  def initialize
    @name = generate_name
  end

  def reset
    @@names.delete(@name)
    initialize
  end

  private

  def generate_name
    Kernel.srand
    new_name = ([letter] * 2 + [digit] * 3).join
    generate_name while @@names.include?(new_name)
    @@names << new_name 
    new_name
  end

  def letter
    [*"A".."Z"][rand(0..25)]
  end

  def digit
    rand(0..9)
  end
end
