class Phrase(phrase: String) {
  private val words =
    phrase
      .split("(?i)[^a-z0-9']+")
      .map(_.toLowerCase)

  lazy val wordCount =
    words
      .groupBy(identity)
      .mapValues(_.size)
}
