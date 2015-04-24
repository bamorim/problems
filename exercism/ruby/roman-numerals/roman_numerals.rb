class Integer
  def to_roman
    to_s.chars.reverse.each_with_index.map do |d,i|
      digit_to_roman d, i
    end.reverse.join
  end

  private

  ROMAN_DIGITS = ['I','V','X','L','C','D','M']
  def digit_to_roman digit, expoent=0
    d = digit.to_i
    if d == 9
      [0,2]
    elsif d >= 5
      [1]+([0]*(d-5))
    elsif d == 4
      [0,1]
    else
      [0]*d
    end.map{|i| ROMAN_DIGITS[i+expoent*2]}.join
  end
end
