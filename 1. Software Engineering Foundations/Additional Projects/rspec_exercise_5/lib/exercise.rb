def zip(*arrs)
  new_arr = Array.new(arrs[0].length) {Array.new}
  arrs.each do |arr|
    row = 0
    arr.each do |e|
      new_arr[row] << e
      row += 1
    end
  end
  new_arr
end

def prizz_proc(arr, prc1, prc2)
  arr.select { |ele| !(prc1.call(ele) && prc2.call(ele)) && (prc1.call(ele) || prc2.call(ele))}
end

def zany_zip(*arrays)
  length = arrays.map(&:length).max

    (0...length).map do |i|
      arrays.map { |array| array[i] }
    end
end

def maximum(arr, &prc)
  max = arr.first
  arr.each { |ele| max = ele if prc.call(max) <= prc.call(ele) }
  max
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = []}
  arr.each { |ele| hash[prc.call(ele)] << ele}
  hash
end

def max_tie_breaker(arr, prc1, &prc2)
  max = my_group_by(arr, &prc2).max_by{ |k, _| k }
  return nil if arr.empty?

  if max[1].length > 1
    new_max = ''
    max[1].each do |ele|
      new_max = ele if prc1.call(new_max) < prc1.call(ele)
    end
    return new_max
  end
  max[1][0]
end

def silly_syllables(str)
  new_str = []
  vowels = 'aeuio'
  str.split.each do |word|
    vowels_indexes = []
    word.each_char.with_index { |char, i| vowels_indexes << i if vowels.include?(char) }
    if  vowels_indexes.length < 2
      new_str << word
    else
      new_str << word[vowels_indexes[0]..vowels_indexes.last]
    end
  end
  new_str.join(' ')
end
