class Squares
  attr_reader :sum_of_squares, :square_of_sums

  def initialize n
    @sum_of_squares = (1..n).map{|n| n**2}.reduce(:+)
    @square_of_sums = (1..n).reduce(:+) ** 2
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
