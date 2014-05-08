class Scrabble
  LETTER_VALUES = [
    [ 1, 'aeioulnrst'],
    [ 2, 'dg'],
    [ 3, 'bcmp'],
    [ 4, 'fhvwy'],
    [ 5, 'k'],
    [ 8, 'jx'],
    [10, 'qz']
  ].flat_map { |(score, letters)| letters.chars.product([score]) }.to_h
  private_constant :LETTER_VALUES

  class << self
    def score(word)
      new(word).score
    end
  end

  def initialize(word)
    @word = word.to_s.downcase
  end

  def score
    @word.chars.reduce(0) do |total, letter|
      total + LETTER_VALUES.fetch(letter, 0)
    end
  end
end
