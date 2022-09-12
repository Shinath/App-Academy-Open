require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(player_1_mark, player_2_mark)
    @player1 = HumanPlayer.new(player_1_mark)
    @player2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_player = @player1
  end

  def switch_turn
    return @current_player = @player2 if @current_player == @player1

    @current_player = @player1
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "Player #{@current_player.mark} wins!"
        return
      end
      switch_turn
    end
    puts 'Draw!'
  end
end

Game.new(:X, :O).play
