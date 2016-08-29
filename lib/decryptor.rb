require './lib/encryptor'
require './lib/cipher'
require 'pry'

class Decryptor < Cipher

  # attr_reader :cipher, :rotate, :encrypt
  # attr_accessor :encrypted, :rotation_count

  def initialize
    @input = nil
    @decrypt_rotation_A = Encryptor.rotation_A.invert
    @decrypt_rotation_B = Encryptor.rotation_B.invert
    @decrypt_rotation_C = Encryptor.rotation_C.invert
    @decrypt_rotation_D = Encryptor.rotation_D.invert
    @rotation_count = 1
  end

  



  call previous encryptor
  set rotation a to encryptor.rotation_A.invert
  ...

  def decrypt(input)
    @input = input
    @decrypted = []
    letters = input.chars.to_a
    letters.each_do |letter|
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
    puts "Decrypted message: #{decrypted.join}\n Date: #{cipher.date_finder}, Key: #{cipher.key.key}."
  end

  #
  #   @input = input
  #   @encrypted = []
  #   letters = input.chars.to_a
  #   letters.each do |letter|
  #     if @rotation_count == 1
  #       @encrypted << rotation_A[letter]
  #       @rotation_count += 1
  #     elsif @rotation_count == 2
  #       @encrypted << rotation_B[letter]
  #       @rotation_count += 1
  #     elsif @rotation_count == 3
  #       @encrypted << rotation_C[letter]
  #       @rotation_count += 1
  #     elsif @rotation_count == 4
  #       @encrypted << rotation_D[letter]
  #       @rotation_count = 1
  #     end
  #   end
  # end
  #
  # def print_info
  #   puts "Message: #{encrypted.join}\n Date: #{cipher.date_finder}, Key: #{cipher.key.key} "
  # end


































#
# class Decryptor < Cipher
#
#   attr_reader :cipher, :rotate, :decrypt
#   attr_accessor :encrypted, :rotation_count
#
#   def initialize(date_entry, key=Cipher.new)
#     @key = key
#     @rotation_A = rotation(key.keyA)
#     @decrypt_rotation_A = rotation_A.invert
#     @rotation_B = rotation(cipher.key.keyB)
#     @decrypt_rotation_B = rotation_B.invert
#     @rotation_C = rotation(cipher.key.keyC)
#     @decrypt_rotation_C = rotation_C.invert
#     @rotation_D = rotation(cipher.key.keyD)
#     @decrypt_rotation_D = rotation_D.invert
#     @rotation_count = 1
#   end
#
#   def decrypt(input)
#     @input = input
#     @decrypted = []
#     letters = input.chars.to_a
#     letters.each do |letter|
#       if @rotation_count == 1
#         @decrypted << decrypt_rotation_A[letter]
#         @rotation_count += 1
#       elsif @rotation_count == 2
#         @decrypted << decrypt_rotation_B[letter]
#         @rotation_count += 1
#       elsif @rotation_count == 3
#         @decrypted << decrypt_rotation_C[letter]
#         @rotation_count += 1
#       elsif @rotation_count == 4
#         @decrypted << decrypt_rotation_D[letter]
#         @rotation_count = 1
#       end
#     end
#   end
# end
