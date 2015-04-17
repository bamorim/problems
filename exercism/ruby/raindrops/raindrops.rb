module Raindrops
  OUTS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    prime_factors(number).
      uniq.
      map{|n| OUTS[n]}.
      compact.
      reduce(:+) || number.to_s
  end

  def self.prime_factors(number)
    factor = []
    Primes.until((number**0.5).floor)
  end
end

class Primes
  def self.until(n)
    new(n).to_a
  end

  def initialize n
    @primes = Array.new(n, false)
    set_prime(2)
  end

  def set_prime(n)
    @primes[n-1] = true
  end
end
