class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    (0...(shortest(strand, other).length)).count do |i|
      strand[i] != other[i]
    end
  end

  private

  attr_reader :strand

  def shortest(*strands)
    strands.min_by(&:length)
  end
end
