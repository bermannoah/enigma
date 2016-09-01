require './lib/decryptor'
require 'pry'

class Decrypt < Decryptor



decrypt_instance = Decryptor.new

filename = ARGV[0]

cipher_text = File.read(filename)

decrypt_instance.decrypt(cipher_text, date = ARGV[3], key = ARGV[2])

output = decrypt_instance.decrypted.join

decrypted_filename = ARGV[1]

# encrypted = open(encrypted_filename, "w")

File.write(decrypted_filename, output)


end
