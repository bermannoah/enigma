require './lib/encryptor'
require 'pry'

class Decryptor < Encryptor

  attr_reader :cipher, :rotate, :decrypt
  attr_accessor :encrypted, :rotation_count

  def initialize(date_entry, key)
    @cipher
    # @rotation_A = rotation(cipher.key.keyA)
    @decrypt_rotation_A = rotation_A.invert
    # @rotation_B = rotation(cipher.key.keyB)
    @decrypt_rotation_B = rotation_B.invert
    # @rotation_C = rotation(cipher.key.keyC)
    @decrypt_rotation_C = rotation_C.invert
    # @rotation_D = rotation(cipher.key.keyD)
    @decrypt_rotation_D = rotation_D.invert
    @rotation_count = 1
  end

  def decrypt(input)
    @input = input
    @decrypted = []
    letters = input.chars.to_a
    letters.each do |letter|
      if @rotation_count == 1
        @decrypted << decrypt_rotation_A[letter]
        @rotation_count += 1
      elsif @rotation_count == 2
        @decrypted << decrypt_rotation_B[letter]
        @rotation_count += 1
      elsif @rotation_count == 3
        @decrypted << decrypt_rotation_C[letter]
        @rotation_count += 1
      elsif @rotation_count == 4
        @decrypted << decrypt_rotation_D[letter]
        @rotation_count = 1
      end
    end
  end
end
