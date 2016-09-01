require './lib/cipher'

class Encryptor < Cipher

  attr_reader :rotation_A, :rotation_B, :rotation_C, :rotation_D
  attr_accessor :input, :encrypted, :encrypt

  def encrypt(input=" ", date = Cipher.new.time_finder, key = Cipher.new.key)
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
    @rotation_A = rotate(c.keyA)
    @rotation_B = rotate(c.keyB)
    @rotation_C = rotate(c.keyC)
    @rotation_D = rotate(c.keyD)
  end

  def encryption_rotator(input)
    @encrypted = []
    @rotation_count = 1
    input.gsub(/\n/, " ")
    letters = input.chars.to_a
    letters.push(" ", ".", ".", "e", "n", "d", ".", ".")
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
    final = @encrypted.join
    final
  end
end
