class Robot
  attr_reader :name
  def new
    chars = 2.times.map{(65+rand(26)).chr}
    digits = 3.times.map{rand(10)}
    @name = "#{chars}#{digits}"
  end
end
