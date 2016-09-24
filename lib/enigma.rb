require './lib/cracker'

class Enigma < Cracker

  attr_reader :key

  def initialize
    @key = key
  end

  def new_key_generator
    kg = KeyGenerator.new
    @key = kg.key
  end



end
