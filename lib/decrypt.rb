require './lib/decryptor'
require 'pry'

class Decrypt < Decryptor



decrypt_instance = Decryptor.new

filename = ARGV[0]

cipher_text = File.read(filename)

decrypt_instance.decrypt(cipher_text, key = ARGV[2], date = ARGV[3])

if date.nil?
  date = Cipher.new.time_finder
end

output = decrypt_instance.decrypted.join

decrypted_filename = ARGV[1]


File.write(decrypted_filename, output)
puts "Created '#{decrypted_filename}' with the key #{decrypt_instance.key} and the date #{date}"


end
