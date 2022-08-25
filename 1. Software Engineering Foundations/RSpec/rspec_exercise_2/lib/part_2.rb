def palindrome?(str)
    pld = ""
    idx = str.length - 1
    while idx >= 0 
        pld += str[idx]
        idx -= 1
    end
    if pld == str
        true
    else
        false
    end
end

def substrings(str)
    arr = []
    (0...str.length).each do |i|
        word = ""
        (i...str.length).each do |j|
            word += str[j]
            arr << word
        end
    end
    arr
end

def palindrome_substrings(str)
    new_arr = []
    arr = substrings(str)
    arr.each do |a|
        if palindrome?(a) and a.length > 1
            new_arr << a
        end
    end
    new_arr
end