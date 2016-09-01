require './lib/cipher'
require 'pry'

class Encryptor < Cipher

  attr_reader :rotation_a, :rotation_b, :rotation_c, :rotation_d
  attr_accessor :input, :encrypted, :encrypt, :final

  def encrypt(input=" ", key = Cipher.new.key, date = Cipher.new.time_finder)
    @input = input
    @key = key
    @date = date
    create_encryption_hash
    encryption_rotator(input)
  end

  def create_encryption_hash
    c = Cipher.new(key)
    c.date_entry(@date)
    c.find_first_rotations
    c.generate_offset
    c.find_final_keys
    @rotation_a = rotate(c.rotation_key_a)
    @rotation_b = rotate(c.rotation_key_b)
    @rotation_c = rotate(c.rotation_key_c)
    @rotation_d = rotate(c.rotation_key_d)
  end

  def encryption_rotator(input)
    @encrypted = []
    @rotation_count = 1
    letters = input.chars.to_a
    letters.push(" ", ".", ".", "e", "n", "d", ".", ".")
    letters.each do |letter|
      if @rotation_count == 1
        @encrypted << rotation_a[letter]
        @rotation_count += 1
      elsif @rotation_count == 2
        @encrypted << rotation_b[letter]
        @rotation_count += 1
      elsif @rotation_count == 3
        @encrypted << rotation_c[letter]
        @rotation_count += 1
      elsif @rotation_count == 4
        @encrypted << rotation_d[letter]
        @rotation_count = 1
      end

    end
    final = @encrypted.join
    final
  end
end
