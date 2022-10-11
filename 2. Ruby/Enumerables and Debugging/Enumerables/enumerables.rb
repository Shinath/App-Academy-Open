class Array
  def my_each(&prc)
    length = self.length
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each do |el|
      arr << el if prc.call(el)
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    my_each do |el|
      arr << el unless prc.call(el)
    end
    arr
  end

  def my_any?(&prc)
    my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    my_each { |el| return false unless prc.call(el) }
    true
  end

  def my_flatten
    arr = []
    my_each do |el|
      if el.is_a?(Array)
        arr += el.my_flatten
      else
        arr << el
      end
    end
    arr
  end

  def my_zip(*args)
    new_arr = []
    i = 0
    while i < length
      sub_arr = []
      sub_arr << self[i]
      args.my_each do |ele|
        sub_arr << ele[i]
      end
      new_arr << sub_arr
      i += 1
    end
    new_arr
  end

  def my_rotate(num = 1)
    new_arr = dup
    if num.positive?
      num.times do
        new_arr.push(new_arr.shift)
      end
    else
      num.abs.times do
        new_arr.unshift(new_arr.pop)
      end
    end
    new_arr
  end

  def my_join(str = '')
    new_str = ''
    my_each do |char|
      new_str += char
      new_str += str
    end
    new_str
  end

  def my_reverse
    index = self.length - 1
    new_str = []
    while index >= 0
      new_str << self[index]
      index -= 1
    end
    new_str
  end
end

