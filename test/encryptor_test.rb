require './test/test_helper'
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_encryptor_can_accept_input_key_and_date
    e = Encryptor.new
    e.encrypt("they are on to us!", "12345", 300816)
    assert_equal "they are on to us!", e.input
    assert_equal "12345", e.key
    assert_equal "300816", e.date
  end

  def test_encryptor_can_pass_information_to_cipher
    e = Encryptor.new
    e.encrypt("they are on to us!", "12345", 300816)
  end

end
