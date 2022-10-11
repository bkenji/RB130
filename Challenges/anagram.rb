# 9:28 - 10:08

# PROBLEM:
# Write a program that takes a word and an array of possible anagrams and selects the correct subarray that contains the anagrams of the word.


# INPUT: String, Array of Strings
# OUTPUT: Array of single string

# GOAL:  Write a program that implements a version of `#match` that is able to take an array of strings as arguments, and match its sorted elements against the sorted calling string according to the following requirements:
# - anagrams should be case-insensitive
# - anagrams must have the same length
# - anagrams cannot be the same (case-insenstive) word as the input: e.g. 'corn' and 'Corn' are NOT anagrams of 'corn'

# DS: String -> Array of Strings 

# HIGH-LEVEL ALGORITHM:
# - Iterate over array of strings (selection)
# - For each string:
#   - Check whether it is a valid anagram (same length and different word)
#   - If valid, check whether its sorted and lower-case version matches the sorted and lower-case version of the input string
# - Return array containing words that meet the criteria

# SPIKE:
# class Anagram
# constructor takes one string argument
# override `#match` to take an Array of strings
# - iterates over each (string) element of the array, invoking `String#match` on them.

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(strings)
    strings.select do |str|
      sort(str.downcase).match(sort(word)) if valid?(str)
    end
  end

  private 

  def valid?(str)
    equal_length?(str) && different_word(str)
  end

  def equal_length?(str)
    word.downcase.length == str.downcase.length
  end

  def different_word(str)
    word != str.downcase
  end

  def sort(str)
    str.chars.sort.join
  end
end


