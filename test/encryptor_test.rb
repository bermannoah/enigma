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

  def test_encryptor_can_create_encryption_hash
    e = Encryptor.new
    e.create_encryption_hash
    assert_equal 91, e.rotation_a.count
    assert_equal 91, e.rotation_b.count
    assert_equal 91, e.rotation_c.count
    assert_equal 91, e.rotation_d.count
  end
  
  def test_encryptor_can_create_four_separate_encryption_hahses
    e = Encryptor.new
    e.create_encryption_hash
    refute e.rotation_a == e.rotation_b
    refute e.rotation_a == e.rotation_c
    refute e.rotation_a == e.rotation_d
    refute e.rotation_b == e.rotation_d
    refute e.rotation_c == e.rotation_d
  end

  def test_encryptor_can_encrypt
    e = Encryptor.new
    assert_equal "T!3> 7P[q*+[:", e.encrypt("Hello", 12345, 171010)
  end
  
  
  def test_encryptor_can_encrypt_if_not_given_date
    e = Encryptor.new
    e.encrypt("Hello", Cipher.new.key, 12345)
    refute "Hello" == e.encrypted
  end 
  
  def test_encryptor_can_encrypt_if_not_given_key
    e = Encryptor.new
    e.encrypt("Hello", 230916) 
    refute "Hello" == e.encrypted
  end
  
  def test_encryptor_can_encrypt_if_not_given_date_or_key
    e = Encryptor.new
    e.encrypt("Hello")
    refute "Hello" == e.encrypted
  end


  def test_encryptor_can_pass_information_to_cipher
    e = Encryptor.new
    e.encrypt("they are on to us!", "12345", 300816)
  end

end
