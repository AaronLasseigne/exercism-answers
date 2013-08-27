module Nucleotide
  class Base
    def self.frequency(chain)
      chain.count(letter)
    end

    def self.letter
      class_name[0]
    end

    def self.class_name
      name.split('::').last
    end
    private_class_method :class_name
  end

  class Adenine  < Base; end
  class Cytosine < Base; end
  class Guanine  < Base; end
  class Thymine  < Base; end
  class Uracil   < Base; end

  ALL = [Adenine, Cytosine, Guanine, Thymine, Uracil].freeze

  def self.find_by_letter(letter)
    nucleotide = ALL.detect do |nucleotide|
      nucleotide.letter == letter
    end

    if not nucleotide
      raise ArgumentError, %Q("#{letter}" is not a valid representation of a nucldeotide.)
    end

    nucleotide
  end
end

class DNA
  NUCLEOTIDES = [
    Nucleotide::Adenine,
    Nucleotide::Cytosine,
    Nucleotide::Guanine,
    Nucleotide::Thymine
  ].freeze
  NUCLEOTIDE_LETTERS = NUCLEOTIDES.map(&:letter).freeze

  def initialize(letters)
    @letters = letters
    @letter_counts = {}
  end

  def count(letter)
    return letter_counts[letter] if letter_counts[letter]

    nucleotide = Nucleotide.find_by_letter(letter)
    frequency = nucleotide.frequency(letters)

    if NUCLEOTIDES.include?(nucleotide)
      letter_counts[letter] = frequency
    end

    frequency
  end

  def nucleotide_counts
    uncounted_letters.each do |letter|
      count(letter)
    end

    letter_counts
  end

  private

  attr_reader :letters, :letter_counts

  def uncounted_letters
    (NUCLEOTIDE_LETTERS - letter_counts.keys)
  end
end
