class DNA(strand: String) {
  require(strand.forall(DNA.validate(_)))

  def count(nucleotide: Char) = nucleotide match {
    case 'U' => 0
    case nucleotide if validate(nucleotide) =>
      strand.count { _ == nucleotide }
    case _ =>
      throw new IllegalArgumentException
  }

  def nucleotideCounts =
    DNA.nucleotides.map { nucleotide =>
      (nucleotide -> count(nucleotide))
    }.toMap
}

object DNA {
  private val nucleotides = Set('A', 'T', 'G', 'C')

  private def validate(nucleotide: Char) = DNA.nucleotides.contains(nucleotide)
}
