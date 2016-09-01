require './lib/encryptor'

class Decryptor < Encryptor

  attr_reader :decrypt_rotation_A, :decrypt_rotation_B, :decrypt_rotation_C, :decrypt_rotation_D
  attr_accessor :decrypted

  def decrypt(input=" ", date = Cipher.new.time_finder, key = Cipher.new.key)
    @input = input
    @key = key
    @date = date
    create_decryption_hash
    decryption_rotator(input)
  end

  def create_decryption_hash
    c = Cipher.new(key)
    c.date_entry(@date)
    c.find_first_rotations
    c.generate_offset
    c.find_final_keys
    @decrypt_rotation_A = rotate(c.keyA).invert
    @decrypt_rotation_B = rotate(c.keyB).invert
    @decrypt_rotation_C = rotate(c.keyC).invert
    @decrypt_rotation_D = rotate(c.keyD).invert
  end

  def decryption_rotator(input)
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
    final_decrypted = @decrypted.join
    final_decrypted
  end
end
