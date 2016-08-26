class Cipher

  attr_reader :date, :last

  def initialize(key, date)
    @key = key
    @date = date * date
    @rotation = 0
  end

  # def square
  #   date_squared = date * date
  # end

  def last_four
    last = @date.to_s.chars.last(4)
  end

end
