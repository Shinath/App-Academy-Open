require_relative 'item'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = '')
    return false unless Item.valid_date?(deadline)

    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index.negative? || index >= @items.length

    true
  end

  def swap(index1, index2)
    return false unless valid_index?(index1) && valid_index?(index2)

    @items[index1], @items[index2] = @items[index2], @items[index1]
    true
  end

  def [](index)
    return nil unless valid_index?(index)

    @items[index]
  end

  def priority
    @items[0]
  end

  def print
    puts '-------------------------------------------------'
    puts "                #{@label.upcase}".ljust(17)
    puts '-------------------------------------------------'
    puts 'Index | Item                 | Deadline   | Done'
    puts '-------------------------------------------------'
    @items.each_with_index do |item, index|
      mark = '[✓]' if item.done
      mark = '[ ]' unless @items[index].done
      puts "#{index.to_s.ljust(6)}| #{item.title.ljust(21)}| #{item.deadline.ljust(11)} | #{mark.ljust(5)}"
    end
    puts '-------------------------------------------------'
  end

  def print_full_item(index)
    return unless valid_index?(index)

    mark = '[✓]' if @items[index].done
    mark = '[ ]' unless @items[index].done
    puts '-------------------------------------------------'
    puts "#{@items[index].title.ljust(32)}#{@items[index].deadline}    #{mark}"
    puts @items[index].description
    puts '-------------------------------------------------'
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false unless valid_index?(index)

    amount.times do
      break unless swap(index, index - 1)

      index -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false unless valid_index?(index)

    amount.times do
      break unless swap(index, index + 1)

      index += 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end

  def toggle_item(index)
    @items[index].toggle
  end

  def remove_item(index)
    return false unless valid_index?(index)

    @items.delete_at(index)
    true
  end

  def purge
    @items.reject!(&:done)
  end
end
