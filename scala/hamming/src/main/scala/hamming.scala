object Hamming {
  def compute(a: String, b: String) = {
    a.zip(b).count { pair => pair._1 != pair._2 }
  }
}
