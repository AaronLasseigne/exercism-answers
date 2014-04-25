class Bob {
  def hey(msg: String) = msg match {
    case m if isSilent(m) =>
      "Fine. Be that way!"
    case m if isShouting(m) =>
      "Woah, chill out!"
    case m if isAsking(m) =>
      "Sure."
    case _ =>
      "Whatever."
  }

  private def isSilent(msg: String) = msg.trim.isEmpty

  private def isShouting(msg: String) = {
    val loud  = msg.toUpperCase
    var quiet = msg.toLowerCase

    msg == loud && quiet != loud
  }

  private def isAsking(msg: String) = msg.endsWith("?")
}
