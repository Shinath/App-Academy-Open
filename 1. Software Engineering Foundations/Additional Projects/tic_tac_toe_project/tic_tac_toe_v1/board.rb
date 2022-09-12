class Board
  def initialize(size)
    @size = size
    @board = Array.new(size) { Array.new(size, '_') }
  end

  def valid?(pos)
    pos[0] >= 0 && pos[0] < @size && pos[1] >= 0 && pos[1] < @size
  end

  def empty?(pos)
    @board[pos[0]][pos[1]] == '_'
  end

  def place_mark(pos, mark)
    raise unless valid?(pos) && empty?(pos)

    @board[pos[0]][pos[1]] = mark
  end

  def print
    @board.each do |row|
      row.each do |cell|
        printf "#{cell} "
      end
      puts
    end
  end

  def win_row?(mark)
    true_counter = 0
    @board.each do |row|
      row.each { |cell| true_counter += 1 if cell == mark }
      return true if true_counter == @size

      true_counter = 0
    end
    false
  end

  def win_col?(mark)
    true_counter = 0
    (0...@size).each do |row|
      (0...@size).each do |col|
        true_counter += 1 if @board[row][col] == mark
      end
      return true if true_counter == @size

      true_counter = 0
    end
    false
  end

  def win_diagonal?(mark)
    return true if @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark
    return true if @board[0][2] == mark && @board[1][1] == mark && @board[2][0] == mark

    false
  end

  def win?(mark)
    win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @board.each_with_index do |arr, row|
      arr.each_with_index { |_, col| return true if empty?([row, col]) }
    end
    false
  end
end