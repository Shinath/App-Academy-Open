# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length > 0
      self.max - self.min
    else
      nil
    end
  end

  def average
    if self.length > 0
      self.sum / (self.length * 1.0)
    else
      nil
    end
  end

  def median
    if self.empty?
      return nil
    end

    if self.length.even?
      (self.sort[self.length / 2] + self.sort[self.length / 2 - 1]) / 2.0
    else 
      self.sort[self.length / 2]
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |c| hash[c] += 1 }
    hash
  end

  def my_count(v)
    counter = 0
    self.each do |ele|
      counter += 1 if ele == v
    end
    counter
  end

  def my_index(v)
    self.each_with_index do |ele, idx|
      return idx if ele == v
    end
    nil
  end

  def my_uniq()
    arr = []
    self.each do |ele|
      arr << ele unless arr.include?(ele)
    end
    arr
  end

  def my_transpose()
    new_grid = Array.new(self.length) {Array.new}
    x = 0
    y = 0
    self.length.times do
      self.length.times do
        new_grid[x] << self[y][x]
        x += 1
      end
      x = 0
      y += 1
    end
    new_grid
  end
end
