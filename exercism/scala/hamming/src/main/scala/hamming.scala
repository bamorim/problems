object Hamming {
  def compute(as:String, bs:String):Int = 
    (as zip bs).count { case (a,b) => a != b }
}
