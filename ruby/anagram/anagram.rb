class Anagram
  def initialize(subject)
    @subject = AnagramWord.new(subject)
  end

  def match(words)
    words.select do |word|
      subject == AnagramWord.new(word)
    end
  end

  private

  attr_reader :subject
end

class AnagramWord
  def initialize(word)
    @word = word
  end

  def ==(other)
    !same?(other) && same_chars?(other)
  end

  protected

  def normalize
    word.downcase
  end

  def sorted_chars
    normalize.chars.sort
  end

  private

  attr_reader :word

  def same?(other)
    normalize == other.normalize
  end

  def same_chars?(other)
    sorted_chars == other.sorted_chars
  end
end
