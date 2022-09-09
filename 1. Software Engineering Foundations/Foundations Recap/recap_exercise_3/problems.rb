def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each { |ele| hash[ele] += 1}
  hash.select { |k, v| v == 1 }.keys
end
puts
puts '---no_dupets?---'
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  arr.each_index do |idx|
    return false if arr[idx] == arr[idx + 1]
  end
  true
end
puts
puts '---no_consecutive_repeats?---'
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new { |k, v| k[v] = []}
  str.split('').each_index { |idx| hash[str[idx]] << idx }
  hash
end
puts
puts '---char_indices---'
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  streak = ''
  private_streak = []
  str.split('').each_index do |idx|
    private_streak << str[idx]
    unless str[idx] == str[idx + 1]
      streak = private_streak.join('') if private_streak.length >= streak.length
      private_streak = []
    end
  end
  streak
end
puts
puts '---longest_streak---'
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def bi_prime?(num)
  prime_factors = prime_factors(num)
  prime_factors.each_index do |idx|
    prime_factors.each_index do |jdx|
      return true if prime_factors[idx] * prime_factors[jdx] == num
    end
  end
  false
end

def prime_factors(num)
  factors = []
  (2...num).each do |n|
    factors << n if prime?(n) && (num % n).zero?
  end
  factors
end

def prime?(num)
  (2...num).each { |n| return false if (num % n).zero? }
  true
end
puts
puts '---bi_prime?---'
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(str, keys)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_str = ''
  key_idx = 0
  str.each_char do |char|
    key_idx = 0 if key_idx >= keys.length

    idx = alphabet.index(char)
    idx = (idx + keys[key_idx]) % 26
    new_str += alphabet[idx]
    key_idx += 1
  end
  new_str
end
puts
puts '---vigenere_cipher---'
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowels = %w[a e i o u]
  str.each_char.with_index.map do |char, idx|
    vowels.rotate(idx).index(char)
  end.map(&:to_s).join
end
puts
puts '---vowel_rotate---'
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

class String
  def select(&prc)
    return '' unless prc

    str = ''
    each_char { |char| str += char if prc.call(char) }
    str
  end

  puts
  puts '---String#select---'
  p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
  p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
  p "HELLOworld".select          # => ""

def map!(&prc)
  each_char.with_index { |char, i| self[i] = prc.call(char, i) }
  self
end
  puts 
  puts '---String#map!---'
  word_1 = 'Lovelace'
  word_1.map! do |ch|
    if ch == 'e'
      '3'
    elsif ch == 'a'
      '4'
    else
      ch
    end
  end
  p word_1        # => "Lov3l4c3"

  word_2 = 'Dijkstra'
  word_2.map! do |ch, i|
    if i.even?
      ch.upcase
    else
      ch.downcase
    end
  end
  p word_2        # => "DiJkStRa"
end

def multiply(a, b)
  return 0 if a.zero? || b.zero?

  return a if b == 1
  return b if a == 1
  return multiply(b, a) if a > b

  if a.negative? && b.negative?
    a = a.abs
    b = b.abs
  end

  a + multiply(a, b - 1)
end
puts
puts '---multiply---'
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(num)
  return [] if num.zero?
  return [2] if num == 1
  return [2, 1] if num == 2

  lucas_sequence(num - 1) << lucas_sequence(num - 1).last + lucas_sequence(num - 2).last
end
puts
puts '---lucas_sequence---'
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
  eturn [] if num == 1
  return [num] if prime?(num)

  (2..num).each do |i|
    return [i] + prime_factorization(num / i) if (num % i).zero?
  end
end
puts
puts '---prime_factorization---'
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
