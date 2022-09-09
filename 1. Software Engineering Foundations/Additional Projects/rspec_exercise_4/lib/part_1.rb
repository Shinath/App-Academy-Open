def my_reject(arr, &prc)
  new_arr = []
  arr.each { |ele| new_arr << ele unless prc.call(ele)}
  new_arr
end

def my_one?(arr, &prc)
  true_counter = 0
  arr.each { |ele| true_counter += 1 if prc.call(ele)}
  return true if true_counter == 1

  false
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each { |k, v| new_hash[k] = v if prc.call(k, v)}
  new_hash
end

def xor_select(arr, prc1, prc2)
  arr.select { |ele| !(prc1.call(ele) && prc2.call(ele)) && (prc1.call(ele) || prc2.call(ele))}
end

def proc_count(num, proc_arr)
  counter = 0
  proc_arr.each { |proc| counter += 1 if proc.call(num)}
  counter
end
