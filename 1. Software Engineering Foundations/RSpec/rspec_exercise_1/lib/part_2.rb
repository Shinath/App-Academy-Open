def hipsterfy(word)
    vowels = "aeiou"
    is_removed = false
    index = word.length - 1 
    while !is_removed
        if index < 0
            is_removed = true
        end
        if vowels.include?(word[index])
            word.slice!(index)
            is_removed = true
        end
    index -= 1
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    hashs = Hash.new(0)
    str.downcase.each_char do |c|
        if vowels.include?(c)
            hashs[c.downcase] += 1
        end
    end
    hashs
end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_str = ""
  str.each_char do |char|
    if alphabet.include?(char)
        idx = alphabet.index(char)
        idx = (idx + num) % 26
        new_str += alphabet[idx]
    else
        new_str += char
    end
  end
  return new_str
end