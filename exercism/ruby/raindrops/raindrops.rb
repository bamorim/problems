module Raindrops
  OUTS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    str = OUTS.map{|k,v| number % k == 0 ? v : ""}.reduce(:+)
    str.empty? ? number.to_s : str
  end
end
