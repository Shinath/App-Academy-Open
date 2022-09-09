def proper_factors(num)
  arr = []
  (1...num).each { |n| arr << n if (num % n).zero? }
  arr
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(num)
  counter = 0
  n = 1
  arr = []
  while counter != num
    n += 1
    if perfect_number?(n)
      arr << n
      counter += 1
    end
  end
  arr
end
