class Phrase(phrase: String) {
  def wordCount = words
    .groupBy { word => word }
    .mapValues { _.size }

  private def words = phrase
    .split("(?i)[^a-z0-9']+")
    .map { _.toLowerCase }
}
