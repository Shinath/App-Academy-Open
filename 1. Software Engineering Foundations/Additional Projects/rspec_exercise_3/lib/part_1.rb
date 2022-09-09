def is_prime?(num)
  return false if num < 2

  (2...num).each { |n| return false if (num % n).zero? }
  true
end

def nth_prime(num)
  prime_numbers_counter = 1
  prime_number = 2
  while prime_numbers_counter < num
    prime_number += 1
    prime_numbers_counter += 1 if is_prime?(prime_number)
  end
  prime_number
end

def prime_range(min, max)
  arr = []
  (min..max).each { |n| arr << n if is_prime?(n) }
  arr
end
