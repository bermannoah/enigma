require './lib/key_generator'
require 'pry'

class Cipher < KeyGenerator

  attr_reader :key, :rotation_A, :rotation_B, :rotation_C, :rotation_D
  attr_accessor :new_key, :characters, :rotated_characters

  def initialize
    @key = KeyGenerator.new
    @new_key = nil
    key.key
    key.initial_rotations
    key.date_finder
    key.square
    key.last_four
    key.final_keys
  end

  def rotation(key)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(key.to_i).to_a
    Hash[characters.zip(rotated_characters)]
  end

  def rotations
    @rotation_A = rotation(key.keyA)
    @rotation_B = rotation(key.keyB)
    @rotation_C = rotation(key.keyC)
    @rotation_D = rotation(key.keyD)
  end



end
