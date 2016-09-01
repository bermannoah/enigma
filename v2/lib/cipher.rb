require './lib/key_generator'
require 'pry'

class Cipher < KeyGenerator

  attr_reader :rotation_A, :rotation_B, :rotation_C, :rotation_D, :characters, :key_a, :key_b, :key_c, :key_d, :date_squared, :offset_a, :offset_b, :offset_c, :offset_d, :keyA, :keyB, :keyC, :keyD
  attr_accessor :key, :date, :today

  def initialize(key = rand(10000..99999))
    @key = key.to_s
    @date = date
  end

  def time_finder
    time = Time.now
    @today = time.strftime("%d%m%y")
  end

  def date_entry(date_to_use=@today.to_i)
    @date = date_to_use
  end

  def date_square
    @date_squared = date * date
    @date_squared
  end

  def find_first_rotations
    @key_a = key[0..1].to_i
    @key_b = key[1..2].to_i
    @key_c = key[2..3].to_i
    @key_d = key[3..4].to_i
  end

  def generate_offset
    @offset_a = date_squared.to_s[-4].to_i
    @offset_b = date_squared.to_s[-3].to_i
    @offset_c = date_squared.to_s[-2].to_i
    @offset_d = date_squared.to_s[-1].to_i
  end

  def find_final_keys
    @keyA = key_a + offset_a
    @keyB = key_b + offset_b
    @keyC = key_c + offset_c
    @keyD = key_d + offset_d
  end

  def rotate(key)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(key.to_i).to_a
    Hash[characters.zip(rotated_characters)]
  end

  

end
