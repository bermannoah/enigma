require './lib/key_generator'

class Cipher < KeyGenerator

  attr_reader :date, :date_entry, :key, :date_a, :date_b, :date_c, :date_d
  attr_accessor :rotation, :key1, :key2, :key3, :key4

  def initialize
    @key = KeyGenerator.new
    @date = date
  end

  def generate_rotation_factors
    new_key = @key.key
    new_key.

  end

end
