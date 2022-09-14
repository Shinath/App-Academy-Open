require_relative 'item'
require_relative 'list'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, list_label, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      @lists[list_label] = List.new(list_label.upcase)
    when 'ls'
      print_lists
    when 'showall'
      @lists.each_value do |item|
        item.print
      end
    when 'mktodo'
      @lists[list_label].add_item(*args)
    when 'quit'
      return false
    when 'up'
      @lists[list_label].up(*args.map(&:to_i))
    when 'down'
      @lists[list_label].down(*args.map(&:to_i))
    when 'swap'
      @lists[list_label].swap(*args.map(&:to_i))
    when 'sort'
      @lists[list_label].sort_by_date!
    when 'toggle'
      @lists[list_label].toggle_item(*args.map(&:to_i))
    when 'priority'
      @lists[list_label].print_priority
    when 'rm'
      @lists[list_label].remove_item(*args.map(&:to_i))
    when 'purge'
      @lists[list_label].purge
    when 'print'
      if args.empty?
        @lists[list_label].print
      else
        @lists[list_label].print_full_item(*args.map(&:to_i))
      end
    else
      print 'Sorry, that command is not recognized.'
    end
    true
  end

  def run
    while get_command
    end
  end

  def print_lists
    counter = 0
    @lists.each_key do |key|
      puts "#{counter}    | #{key}"
      counter += 1
    end
  end
end

TodoBoard.new.run
