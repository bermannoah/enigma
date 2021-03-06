require './lib/cipher'
require './lib/decryptor'
require 'pry'

class Cracker < Decryptor

  attr_reader :cracked, :d, :input, :key, :date, :clear_text
  attr_accessor :key, :key_saver, :keys_used

  def initialize
    @d = d
    @cracked = []
    @counter = 0
  end

  def key_saver(key)
    @keys_used = []
    @keys_used << key
    @keys_used
  end

  def crack(input, date=Cipher.new.time_finder, key=10000)
    @d = Decryptor.new
    puts "The cracker is running. We appreciate your patience."
    until @cracked.include?("..end..")
      key = Cipher.new.key
      key_saver(key)
      if keys_used.include?(key)
        key = Cipher.new.key
      end
      @d.decrypt(input, key, date)
      @cracked = d.decrypted[-7..-1].join
      @counter += 1
      @clear_text = d.decrypted.join
      if @counter == 1_000_000
        break
        puts "Try again."
      end
    end
    @cracked = []
  end

end
