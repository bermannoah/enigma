require './lib/cipher'
require './lib/decryptor'

class Enigma < Decryptor

  attr_reader :key

  def new_key_generator
    kg = KeyGenerator.new
    key = kg.key
  end

  def encrypt(input=" ", key = Cipher.new.key, date = Cipher.new.time_finder)
    e = Encryptor.new
      e.encrypt(input, key, date)
      puts "#{e.encrypted.join}"
      puts "and the key is: #{e.key}"
  end

  def decrypt(input=" ", key = Cipher.new.key, date = Cipher.new.time_finder)
    d = Decryptor.new
      d.decrypt(input, key, date)
      puts "#{d.decrypted.join}"
      puts "and the key was #{d.key}"
    end

end
