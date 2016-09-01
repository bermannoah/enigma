
def raw_text_file_read(filename)
  raw_text = File.open(filename, "r")
  @clear_text = raw_text.read
  @input = @clear_text
end


def encrypted_file_write
  output = File.open(encrypted.txt, "w")
  output.write(encrypted.join)
  output.close
end

def encrypted_file_open(filename)
  encrypted_input = File.open(filename, "r")
  @code_language = input.read
  @input = @code_language
end

def decrypted_file_write
  decrypted_output = File.open(decrypted.txt, "w")
  decrypted_output.write(decrypted.join)
  output.close
end
