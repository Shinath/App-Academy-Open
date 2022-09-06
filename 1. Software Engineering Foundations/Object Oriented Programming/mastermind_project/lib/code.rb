class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all?{ |peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def initialize(pegs)
    raise unless Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << ['R', 'G', 'B', 'Y'].sample}
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    counter = 0
    guess.pegs.each_with_index do |peg, idx|
      counter += 1 if peg == @pegs[idx]
    end
    counter
  end

  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(other)
    @pegs == other.pegs
  end
end
