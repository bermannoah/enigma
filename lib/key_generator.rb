require 'pry'

class KeyGenerator
  attr_reader :key, :key_a, :key_b, :key_c, :key_d, :date_entry
  attr_accessor :date, :date_a, :date_b, :date_c, :date_d, :keyA, :keyB, :keyC, :keyD

  def initialize(date_entry)
    @key = key
    @date_entry = date_entry
    # @date_a = nil
    # @date_b = nil
    # @date_c = nil
    # @date_d = nil
    @keyA = nil
    @keyB = nil
    @keyC = nil
    @keyD = nil
  end

  def key
    key = rand(10000..99999).to_s
  end

  def initial_rotations
    @key_a = key[0..1].to_i
    @key_b = key[1..2].to_i
    @key_c = key[2..3].to_i
    @key_d = key[3..4].to_i
  end

  def square
    @date = date_entry.to_i * date_entry.to_i
  end

  def last_four
    @date = date.to_s
    @date_a = date[-4].to_i
    @date_b = date[-3].to_i
    @date_c = date[-2].to_i
    @date_d = date[-1].to_i
  end

  def final_keys
    @keyA = date_a + key_a
    @keyB = date_b + key_b
    @keyC = date_c + key_c
    @keyD = date_d + key_d
  end

end
