class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)

    false
  end

  def get_matching_indices(char)
    array = []
    idx = 0
    @secret_word.each_char do |c|
      array << idx if c == char
      idx += 1
    end
    array
  end

  def fill_indices(char, indices)
    @guess_word.each_index do |idx|
      @guess_word[idx] = char if indices.include?(idx)
    end
  end

  def try_guess(char)
    indices = get_matching_indices(char)
    if indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, indices)
    end
    if already_attempted?(char)
      print "That has already been attempted\n"
      false
    else
      @attempted_chars << char
      true
    end
  end

  def ask_user_for_guess
    print "Enter a char: \n"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      print "WIN\n"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      print "LOSE\n"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      print @secret_word
      true
    else
      false
    end
  end
end
