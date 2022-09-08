# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  pairs = []
  vowels = 'aeiou'
  words.each do |word|
    used_vowels_word1 = used_vowels(word)
    words.each do |other|
      used_vowels_word2 = used_vowels(other)
      pairs << "#{word} #{other}" if (used_vowels_word1 + used_vowels_word2).split('').sort.uniq.join('') == vowels && !pairs.include?("#{other} #{word}")
    end
  end
  pairs
end

def used_vowels(word)
  vowels = 'aeiou'
  used_vowels = ''
  word.each_char do |char|
    used_vowels += char if vowels.include?(char)
  end
  used_vowels
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).each { |n| return true if (num % n).zero?}
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["oo", "ck", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  used_bigrams = []
  bigrams.each { |biagram| used_bigrams << biagram if str.include?(biagram) }
  used_bigrams
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      prc ||= Proc.new { |k, v| k == v }
      
      selected = {}
      self.each do |k, v|
        selected[k] = v if prc.call(k, v)
      end
      selected
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
      substrings = []
      (0...self.length).each do |i|
        substring = ''
        (i...self.length).each do |j|
          substring += self[j]
          substrings << substring
        end
      end
      
      return substrings.select { |sub| sub.length == length } if length

      substrings
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      alphabet = 'abcdefghijklmnopqrstuvwxyz'
      new_str = ''
      self.each_char do |char|
        if alphabet.include?(char)
          idx = alphabet.index(char)
          idx = (idx + num) % 26
          new_str += alphabet[idx]
        else
          new_str += char
        end
      end
      new_str
    end
  end
