require_relative 'key_generator'

class Cipher

  attr_reader :date, :date_entry, :key, :date_a, :date_b, :date_c, :date_d
  attr_accessor :rotation, :key1, :key2, :key3, :key4

  def initialize(key, date_entry)
    @key = KeyGenerator.new
    @date_entry = gets.chomp.to_s
    @date = date_entry * date_entry
    @rotation = 1
    @date_a = date_entry(-1).to_i
    @date_b = date_entry(-2).to_i
    @date_c = date_entry(-3).to_i
    @date_d = date_entry(-4).to_i
    @key1 = nil
    @key2 = nil
    @key3 = nil
    @key4 = nil
  end

  # def square
  #   date_squared = date * date
  # end

  # def last_four
  #   last = @date.to_s.chars.last(4)
  # end

  def final_keys
    @key1 = date_a + key_a
    @key2 = date_b + key_b
    @key3 = date_c + key_c
    @key4 = date_d + key_d
  end

end
