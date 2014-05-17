class DNA(strand: String) {
  require(DNA.validNucleotideStrand(strand))

  def count(nucleotide: Char) = {
    require(DNA.validNucleotide(nucleotide) || nucleotide == 'U')

    nucleotideCounts.getOrElse(nucleotide, 0)
  }

  lazy val nucleotideCounts =
    DNA.nucleotides.map { nucleotide =>
      (nucleotide -> strand.count(_ == nucleotide))
    }.toMap
}

object DNA {
  private val nucleotides = Set('A', 'T', 'G', 'C')

  private def validNucleotide(nucleotide: Char) =
    nucleotides.contains(nucleotide)

  private def validNucleotideStrand(strand: String) =
    strand.forall { validNucleotide(_) }
}
