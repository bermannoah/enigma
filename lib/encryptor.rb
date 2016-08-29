require './lib/cipher'
require 'pry'

class Encryptor < Cipher

  attr_reader :cipher, :rotate, :encrypt, :decrypt_rotation_A, :decrypt_rotation_B, :decrypt_rotation_C, :decrypt_rotation_D, :decrypted
  attr_accessor :encrypted, :rotation_count

  def initialize
    @cipher = Cipher.new
    @input = nil
    @rotation_A = rotation(cipher.key.keyA)
    @rotation_B = rotation(cipher.key.keyB)
    @rotation_C = rotation(cipher.key.keyC)
    @rotation_D = rotation(cipher.key.keyD)
    @decrypt_rotation_A = rotation_A.invert
    @decrypt_rotation_B = rotation_B.invert
    @decrypt_rotation_C = rotation_C.invert
    @decrypt_rotation_D = rotation_D.invert
    @rotation_count = nil
  end

  def encrypt(input)
    @input = input
    @encrypted = []
    @rotation_count = 1
    letters = input.chars.to_a
    letters.each do |letter|
      if @rotation_count == 1
        @encrypted << rotation_A[letter]
        @rotation_count += 1
      elsif @rotation_count == 2
        @encrypted << rotation_B[letter]
        @rotation_count += 1
      elsif @rotation_count == 3
        @encrypted << rotation_C[letter]
        @rotation_count += 1
      elsif @rotation_count == 4
        @encrypted << rotation_D[letter]
        @rotation_count = 1
      end
    end
  end

  def print_info
    puts "Message: #{encrypted.join}\n Date: #{cipher.date_finder}, Key: #{cipher.key.key} "
  end

  def decrypt(input)
    @input = input
    @decrypted = []
    @rotation_count = 1
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


  def print_decrypted_info
    puts "Decrypted message: #{decrypted.join}\n Date: #{cipher.date_finder}, Key: #{cipher.key.key} "
  end




end
