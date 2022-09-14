class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def self.valid_date?(date)
    date = date.split('-')
    return false if date[0].length != 4
    return false if date[1].length != 2
    return false if date[2].length != 2
    return false if date[1].to_i.negative? || date[1].to_i > 12
    return false if date[2].to_i.negative? || date[2].to_i > 31

    true
  end

  def initialize(title, deadline, description)
    raise unless Item.valid_date?(deadline)

    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    raise unless Item.valid_date?(new_deadline)

    @deadline = new_deadline
  end

  def toggle
    return @done = false if @done

    @done = true
  end
end
