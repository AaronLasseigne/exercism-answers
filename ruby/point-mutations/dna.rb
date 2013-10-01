class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    difference = 0

    (0).upto(shortest(strand, other).length - 1) do |i|
      difference += 1 if strand[i] != other[i]
    end

    difference
  end

  private

  attr_reader :strand

  def shortest(*strands)
    strands.min_by(&:length)
  end
end
