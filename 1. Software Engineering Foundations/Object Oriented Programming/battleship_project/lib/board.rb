class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    count = 0
    @grid.each { |row| count += row.count(:S) }
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    ships = (0.25 * @size).round
    ships.times do
      while true
        pos = [rand(0...Math.sqrt(@size)), rand(0...Math.sqrt(@size))]
        break if self[pos] == :N
      end
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    hidden_grid = Array.new(Math.sqrt(@size)) { Array.new(Math.sqrt(@size)) }
    @grid.each_with_index do |row, indx|
      row.each_with_index do |cell, indy|
        if cell == :S
          hidden_grid[indx][indy] = :N
        else
          hidden_grid[indx][indy] = cell
        end
      end
    end
    hidden_grid
  end

  def self.print_grid(grid)
    grid.each do |row|
      row.each_with_index do |cell, idx|
        if idx == row.length - 1
          print cell
        else
          print "#{cell} "
        end
      end
      puts
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
