require './lib/encryptor'
require 'pry'

class Decryptor < Encryptor

  attr_reader :cipher, :rotate
  attr_accessor :encrypted, :rotation_count

  def initialize(date_entry)
    @input = nil
    @rotation_A = rotation(cipher.key.keyA)
    @rotation_B = rotation(cipher.key.keyB)
    @rotation_C = rotation(cipher.key.keyC)
    @rotation_D = rotation(cipher.key.keyD)
    @rotation_count = 1
    @encryption_key = e.encrypted
  end

  def encrypt(input)
    @input = input
    @decrypted = []
    letters = input.chars.to_a
    letters.each do |letter|
      if @rotation_count == 1
        @decrypted << rotation_A.invert![letter]
        @rotation_count += 1
      elsif @rotation_count == 2
        @decrypted << rotation_B.invert![letter]
        @rotation_count += 1
      elsif @rotation_count == 3
        @decrypted << rotation_C.invert![letter]
        @rotation_count += 1
      elsif @rotation_count == 4
        @decrypted << rotation_D.invert![letter]
        @rotation_count = 1
      end
    end
  end
end
