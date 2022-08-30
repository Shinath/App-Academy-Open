def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(text, &prc)
  text = text.split
  new_text = text.map(&prc)
  new_text.join(' ')
end

def greater_proc_value(num, prc1, prc2)
  return prc1.call(num) if prc1.call(num) > prc2.call(num)
  prc2.call(num)
end

def and_selector(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prc1.call(ele) && prc2.call(ele)
  end
  new_arr
end

def alternating_mapper(arr, prc1, prc2)
  new_arr = []
  arr.each_with_index do |ele, idx|
    if idx.even?
      new_arr << prc1.call(ele)
    else
      new_arr << prc2.call(ele)
    end
  end
  new_arr
end