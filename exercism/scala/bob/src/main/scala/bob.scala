class Bob {
  val Yell = "(?=.*[A-Z].*)[^a-z]+".r
  val Question = """\?$""".r.unanchored
  val Silence = """\s*""".r

  def hey(msg: String):String = msg match {
    case Silence() => "Fine. Be that way!"
    case Yell() => "Whoa, chill out!"
    case Question() => "Sure."
    case _ => "Whatever."
  }
}
