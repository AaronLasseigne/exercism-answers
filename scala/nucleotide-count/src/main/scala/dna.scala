class DNA(strand: String) {
  require(strand.forall(DNA.validate(_)))

  def count(nucleotide: Char) = {
    require(nucleotide == 'U' || DNA.validate(nucleotide))

    nucleotideCounts.getOrElse(nucleotide, 0)
  }

  lazy val nucleotideCounts =
    DNA.nucleotides.map { nucleotide =>
      (nucleotide -> strand.count(_ == nucleotide))
    }.toMap
}

object DNA {
  private val nucleotides = Set('A', 'T', 'G', 'C')

  private def validate(nucleotide: Char) = DNA.nucleotides.contains(nucleotide)
}
