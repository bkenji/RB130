# 12:25 - 12:49

# Hamming Distance - Point Mutations

# GOAL: Given two input strings (strands), str1 and str2, where str1's length is equal to or shorter than str2, compare the character-index relationship in str1 to those of str2, index by index. Return the count of those characters in str1 that differ from those in str2 at the same index.
# - If strings are of different length, iterate over the shorter string.

# DS: String -> Array of Characters -> Integer

# HIGH-LEVEL ALGORITHM (DNA#hamming_distance):
# - Initialize `distance` to 0
# - Determine which strand is the shorter
# - Iterate over the shorter strand
# - For each index, compare the current character at strand1 with that at strand2. If the characters are different, increment `distance` by 1.
# - Return distance

# SPIKE:

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    distance = 0
    shorter_strand, longer_strand = [strand, strand2].sort_by(&:size)
    shorter_strand.chars.each_with_index do |c, i| 
      distance += 1 if c != longer_strand[i]
    end
    distance
  end
end
