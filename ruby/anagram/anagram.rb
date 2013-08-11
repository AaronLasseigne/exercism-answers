class Anagram
  def initialize(subject)
    @subject = subject
  end

  def match(words)
    @words ||= words.select do |word|
      anagram?(word)
    end
  end

  private

  attr_reader :subject

  def anagram?(word)
    !same?(word) && same_letters?(word)
  end

  def same?(word)
    normalized_subject == normalize(word)
  end

  def same_letters?(word)
    sorted_normalized_subject == sort_characters(normalize(word))
  end

  def normalize(word)
    word.downcase
  end

  def sort_characters(word)
    word.split('').sort
  end

  def normalized_subject
    @normalized_subject ||= normalize(subject)
  end

  def sorted_normalized_subject
    @sorted_normalized_subject ||= sort_characters(normalized_subject)
  end
end
