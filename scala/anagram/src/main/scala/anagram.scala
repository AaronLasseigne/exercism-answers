class Anagram(word: String) {
  def matches(words: Seq[String]) =
    words.filter { isAnagram(word, _) }

  private def isAnagram(word: String, anagram: String) = {
    val lowerWord = word.toLowerCase
    val lowerAnagram = anagram.toLowerCase

    lowerWord != lowerAnagram &&
    normalize(lowerWord).sameElements(normalize(lowerAnagram))
  }

  private def normalize(word: String) =
    word.toCharArray.sortBy(identity)
}
