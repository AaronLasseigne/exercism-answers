class Anagram(word: String) {
  def matches(words: Seq[String]) =
    words.filter(isAnagram)

  private lazy val lowerWord = word.toLowerCase

  private def isAnagram(anagram: String) = {
    val lowerAnagram = anagram.toLowerCase

    lowerWord != lowerAnagram && lowerWord.sorted == lowerAnagram.sorted
  }
}
