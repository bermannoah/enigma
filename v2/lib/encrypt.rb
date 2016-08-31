require './lib/encryptor'
require 'pry'

class Encrypt < Encryptor



encrypt_instance = Encryptor.new

filename = ARGV[0]

raw_text = File.read(filename)
raw_text.gsub("\n", " ")

encrypt_instance.encrypt(raw_text, date = Cipher.new.time_finder, key = Cipher.new.key)

output = encrypt_instance.encrypted.join

encrypted_filename = ARGV[1]

# encrypted = open(encrypted_filename, "w")

File.write(encrypted_filename, output)
puts "Created '#{encrypted_filename}' with the key #{encrypt_instance.key} and the date #{encrypt_instance.date}"


end
