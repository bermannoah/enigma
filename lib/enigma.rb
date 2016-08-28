require './lib/encryptor'
require './lib/decryptor'
require 'pry'

class Enigma

  def initialize(date_entry)
    encrypt = Encryptor.new(date_entry)
    decrypt = Decryptor.new(date_entry)
    # @encrypt_date_entry = nil
    # @decrypt_date_entry = nil
  end


end
