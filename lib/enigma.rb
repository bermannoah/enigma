require './lib/encryptor'
require 'pry'

class Enigma < Encryptor

  attr_reader :enigma_machine

  def initialize
    @enigma_machine = nil
    @input = nil
  end

  def starter
    @enigma_machine = Encryptor.new
    puts "Enter the thing you'd like to encrypt > "
    puts "Your current key is #{enigma_machine.cipher.key.key}"
    input = gets.chomp.to_s
  end


end
