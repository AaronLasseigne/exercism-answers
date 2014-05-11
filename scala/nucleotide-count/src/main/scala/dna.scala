class DNA(strand: String) {
  private val nucleotides = Set('A', 'T', 'G', 'C')

  private def validate(nucleotide: Char) =
    nucleotides.contains(nucleotide) || (throw new IllegalArgumentException)

  strand.foreach(validate(_))

  def count(nucleotide: Char) = nucleotide match {
    case 'U' => 0
    case nucleotide if validate(nucleotide) =>
      strand.count { _ == nucleotide }
  }

  def nucleotideCounts =
    nucleotides.map { nucleotide =>
      (nucleotide -> count(nucleotide))
    }.toMap
}
