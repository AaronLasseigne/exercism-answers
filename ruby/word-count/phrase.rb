class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    @word_count ||= tally_words
  end

  private

  attr_reader :text

  def normalized_text
    text.downcase
  end

  def tally_words
    tally = Hash.new(0)

    normalized_text.scan(/[[:alnum:]]+/) do |word|
      tally[word] += 1
    end

    tally
  end
end
