require './test/test_helper'
require './lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test
  
  def test_decryptor_can_create_decryption_hash
    d = Decryptor.new
    d.create_decryption_hash
    assert_equal 91, d.decrypt_rotation_a.count
    assert_equal 91, d.decrypt_rotation_b.count
    assert_equal 91, d.decrypt_rotation_c.count
    assert_equal 91, d.decrypt_rotation_d.count    
  end
  
  def test_decryptor_can_create_four_separate_decryption_hahses
    d = Decryptor.new
    d.create_decryption_hash
    refute d.decrypt_rotation_a == d.decrypt_rotation_b
    refute d.decrypt_rotation_a == d.decrypt_rotation_c
    refute d.decrypt_rotation_a == d.decrypt_rotation_d
    refute d.decrypt_rotation_b == d.decrypt_rotation_d
    refute d.decrypt_rotation_c == d.decrypt_rotation_d
  end
  
  def test_decryptor_can_decrypt
    e = Encryptor.new
    d = Decryptor.new
    assert_equal "T!3> 7P[q*+[:", e.encrypt("Hello", 12345, 171010)
    assert_equal "Hello ..end..", d.decrypt("T!3> 7P[q*+[:", 12345, 171010)
  end
  
  
  
end