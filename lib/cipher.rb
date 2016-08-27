require './lib/key_generator'
require 'pry'

class Cipher < KeyGenerator

  attr_reader :key, :rotation_A, :rotation_B, :rotation_C, :rotation_D
  attr_accessor :new_key, :characters, :rotated_characters

  def initialize(date_entry)
    @key = KeyGenerator.new(date_entry)
    @new_key = nil
    @rotation_A = nil
    @rotation_B = nil
    @rotation_C = nil
    @rotation_D = nil
    key.key
    key.initial_rotations
    key.square
    key.last_four
    key.final_keys
  end

  def rotation(key)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(key)
    Hash[characters.zip(rotated_characters)]
  end

  def rotations
    @rotation_A = rotation(keyA)
    @rotation_B = rotation(keyB)
    @rotation_C = rotation(keyC)
    @rotation_D = rotation(keyD)
  end



end
