def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |hash| hash['age'] < 3 }
end

def count_positive_subarrays(grid)
  grid.count { |arr| arr.sum.positive? }
end

def aba_translate(str)
  str = str.split('')
  str = str.map do |char|
    if 'aioeu'.include?(char)
      "#{char}b#{char}"
    else
      char
    end
  end
  str.join('')
end

def aba_array(arr)
  arr.map { |ele| aba_translate(ele) }
end