require './lib/encryptor'

class Decryptor < Encryptor

  attr_reader :decrypt_rotation_a, :decrypt_rotation_b, :decrypt_rotation_c, :decrypt_rotation_d
  attr_accessor :decrypted

  def decrypt(input=" ", key = Cipher.new.key, date = Cipher.new.time_finder)
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
    @decrypt_rotation_a = rotate(c.rotation_key_a).invert
    @decrypt_rotation_b = rotate(c.rotation_key_b).invert
    @decrypt_rotation_c = rotate(c.rotation_key_c).invert
    @decrypt_rotation_d = rotate(c.rotation_key_d).invert
  end

  def decryption_rotator(input)
    @decrypted = []
    @rotation_count = 1
    letters = input.chars.to_a
    letters.each do |letter|
      if @rotation_count == 1
        @decrypted << decrypt_rotation_a[letter]
        @rotation_count += 1
      elsif @rotation_count == 2
        @decrypted << decrypt_rotation_b[letter]
        @rotation_count += 1
      elsif @rotation_count == 3
        @decrypted << decrypt_rotation_c[letter]
        @rotation_count += 1
      elsif @rotation_count == 4
        @decrypted << decrypt_rotation_d[letter]
        @rotation_count = 1
      end

    end
    final_decrypted = @decrypted.join
    final_decrypted
  end
end
