# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
    while i > 1
        if num % i == 0
            if prime?(i)
                return i
            end
        end
        i -= 1
    end
end

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

def unique_chars?(str)
    str.each_char do |c|
        return false if str.count(c) > 1
    end
    true
end

def dupe_indices(arr)
    hash = Hash.new{|h,k| h[k] = []}
    arr.each_with_index do |ele, idx|
        hash[ele] << idx
    end
    hash.select {|h,k| k.length > 1}
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length

    if arr1 - arr2 == [] and arr2 - arr1 == []
        return true
    else
        return false
    end
end