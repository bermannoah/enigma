require './lib/cipher'
require 'pry'

class Encryptor < Cipher

  attr_reader :cipher, :rotate
  attr_accessor :encrypted, :rotation_count

  def initialize(date_entry)
    @cipher = Cipher.new(date_entry)
    @input = nil
    @rotation_A = rotation(cipher.key.keyA)
    @rotation_B = rotation(cipher.key.keyB)
    @rotation_C = rotation(cipher.key.keyC)
    @rotation_D = rotation(cipher.key.keyD)
    @rotation_count = 1
  end

  def encrypt(input)
    @input = input
    @encrypted = []
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
end

# letters = input.chars.to_a
# encrypted = letters.map do |letter|
#   letter = rotation_A(letter)
# end


# letter.rotate(@rotation_A)
