# Goal: Given an encrypted input string using the ROT13 algorithm, rotate each character 13 characters to the left it and output the unencrypted version of that string.


# INPUT: String with each character rotated 13 characters to the right
# OUTPUT: De-encrypted string with each character rotated 13 characters back to the left.

# - For each word of the input string, each character of the input string must be rotated 13 characters to the left.
# - Case must remain the same as in the input
#   - it's possible to treat the method as case-insensitive and simply capitalize the words afterwards
#

# DATA STRUCTURE:
# - String -> Array of words -> Rotated words -> String

# APPROACH:
# - Since there are 26 letters in the alphabet, in order to rotate a letter 13 characters to either direction, all you need to do is to match the letter in a given half of the alphabet (letters 1-13) to the letter at the same index in the other half of the alphabet (letters 14-26), and vice-versa. 

# ALGORITHM:
# - Divide alphabet into two halves (each half will contain 13 characters)
# - Iterate over the characters of the input string
#  - If current character belongs to first half, convert it to the character at the same index in the second half, and vice-versa.

class String
  def title_case
    split.map(&:capitalize!).join(" ")
  end
end

key = Proc.new do |chr|
        half_1 = ("a".."m").to_a
        half_2 = ("n".."z").to_a
        alphabet = (half_1.zip(half_2) + half_2.zip(half_1)).to_h

        chr == " " ? chr : alphabet[chr]
      end

def decode(str, key)
  str.downcase.each_char.with_index do |chr, idx|
    str[idx] = key.call(chr)
  end
  str.title_case
end

p key.binding.eval("chr='b'")
p key.call("a")

p decode("Nqn Ybirynpr", key) # => Ada Lovelace
p decode("Tenpr Ubccre", key) # => Grace Hopper
p decode("Nqryr Tbyqfgvar", key) # => Adele Goldstine
p decode("Puneyrf Onoontr",key) # => Charles Babbage






