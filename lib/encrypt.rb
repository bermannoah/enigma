require './lib/encryptor'
require 'pry'

class Encrypt < Encryptor

encrypt_instance = Encryptor.new

filename = ARGV[0]

raw_text = File.read(filename)

edited_raw_text = raw_text.gsub("\n", " ")

date = ARGV[2]

if date.nil?
  date = Cipher.new.time_finder
end

encrypt_instance.encrypt(edited_raw_text, key = Cipher.new.key, date)

output = encrypt_instance.encrypted.join

encrypted_filename = ARGV[1]

# encrypted = open(encrypted_filename, "w")

File.write(encrypted_filename, output)
puts "Created '#{encrypted_filename}' with the key #{encrypt_instance.key} and the date #{encrypt_instance.date}"


end
