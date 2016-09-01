require './lib/cracker'
require 'pry'

class Crack < Cracker



cracker_instance = Cracker.new

filename = ARGV[0]

cipher_text = File.read(filename)

cipher_text

cracker_instance.crack(cipher_text, date = ARGV[2])

if date.nil?
  date = Cipher.new.time_finder
end

output = cracker_instance.clear_text

cracked_filename = ARGV[1]

# encrypted = open(encrypted_filename, "w")

File.write(cracked_filename, output)
puts "Created '#{cracked_filename}' with the key #{cracker_instance.d.key} and the date #{date}"



end
