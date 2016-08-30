gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/encryptor'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_does_this_spin_up_a_new_encryptor
    e = Enigma.new
    refute_equal nil, e
  end



end
