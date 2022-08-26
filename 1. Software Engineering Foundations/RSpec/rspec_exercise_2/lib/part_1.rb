def partition(arr, num)
    tab = Array.new(2) {Array.new()}
    arr.each do |n|
        if n >= num
            tab[1] << n
        else
            tab[0] << n
        end
    end
    tab
end

def merge(hash1, hash2)
    new_hash = Hash.new
    keys2 = hash2.keys

    hash1.each_key do |k|
        new_hash[k] = hash1[k]
    end

    hash2.each_key do |k|
        new_hash[k] = hash2[k]
    end
    new_hash
end

def censor(sent, arr)
    tab = sent.split
    tab.each do |word|
        arr.each do |ar|
            if word.downcase == ar.downcase
                word.gsub!(/[aeiouAEIOU]/, '*')
            end
        end
    end
    tab.join(" ")
end

def power_of_two?(num)
    (0..num/2).each do |n|
        if 2 ** n == num
            return true
        end
    end
    return false
end
