require './lib/cracker'

class Enigma < Cracker

  attr_reader :key

  def new_key_generator
    kg = KeyGenerator.new
    key = kg.key
  end

  

end
