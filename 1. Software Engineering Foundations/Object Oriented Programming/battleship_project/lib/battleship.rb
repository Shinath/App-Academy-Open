require_relative "board"
require_relative "player"

class Battleship
  attr_reader :player, :board

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = n * n / 2
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    return false if @remaining_misses.positive?

    puts 'you lose'
    true
  end

  def win?
    return false if @board.num_ships.positive?

    puts 'you win'
    true
  end

  def game_over?
    win? || lose?
  end

  def turn
    @remaining_misses -= 1 unless @board.attack(@player.get_move)
    @board.print
    puts @remaining_misses
  end
end
