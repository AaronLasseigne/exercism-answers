class DNA
  NUCLEOTIDES = %w[A T G C].freeze

  def initialize(dna)
    @dna    = dna
    @counts = {}
  end

  def count(nucleotide)
    if NUCLEOTIDES.include?(nucleotide)
      counts[nucleotide] ||= dna.count(nucleotide)
    elsif nucleotide == 'U'
      0
    else
      raise ArgumentError
    end
  end

  def nucleotide_counts
    (NUCLEOTIDES - counts.keys).each do |nucleotide|
      count(nucleotide)
    end

    counts
  end

  private

  attr_reader :dna, :counts
end
