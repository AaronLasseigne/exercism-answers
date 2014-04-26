object Hamming {
  def compute(a: String, b: String) = {
    a zip b count { case (x, y) => x != y }
  }
}
