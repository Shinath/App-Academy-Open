class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
    pos = gets.chomp.split
    message = 'sorry, that was invalid :<'
    raise message unless pos[0].to_i.to_s == pos[0] || pos[1].to_i.to_s == pos[1]
    raise message unless pos[1].to_i.to_s == pos[1]
    raise message if pos.length > 2 || pos.length < 2

    pos.map(&:to_i)
  end
end
