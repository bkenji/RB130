# 9:22 - 9:53

# GOAL: Given an input string, calculate the scrabble score for the word.
# - Each letter or set of letters has a set value
# - The scrabble score is determined by the sum of the value of each character of the word
# -  Each repeated character counts individually


# INPUT: string
# OUTPUT: Integer

# DS: String -> Array of characters -> Hash -> Integer

# HIGH-LEVEL ALGORITHM:
# - Create a hash pairing sets of letters with their respective value
# - Create a local variable results assigned to 0 to store result
# - Split word into an array of characters

# - Iterate over the array of characters
#   - For each character, iterate over the keys of the hash and check which key includes the character
#   - increment `results` by the value of that key
# - Return results


# SPIKE:
class Scrabble
  TILE_SCORES = {%w(A E I O U L N R S T) => 1,
                 %w(D G)                 => 2,
                 %w(B C M P)             => 3,
                 %w(F H V W Y)           => 4,
                 %w(K)                   => 5,
                 %w(J X)                 => 8,
                 %w(Q Z)                 => 10
                }


  def initialize(word)
    @word = word ? word : ""
  end

  def score
    chars = word.upcase.chars
    results = 0
    chars.each do |chr|
      TILE_SCORES.each do |k, v|
        results += v if k.include?(chr)
      end
    end
    results
  end

  def self.score(word) # convenient scoring
    Scrabble.new(word).score
  end

  private

  attr_reader :word
end


# p Scrabble.new("qui9#$%#%@7rky").score

