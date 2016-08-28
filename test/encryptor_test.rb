gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_encryptor_can_encrypt_one_letter
    e = Encryptor.new(280816)
    e.encrypt("A")
    assert_equal e.rotation_A["A"], e.encrypted[0]
  end

  def test_encryptor_can_modify_two_identical_chars
    e = Encryptor.new(220591)
    e.encrypt("AA")
    assert_equal e.rotation_A["A"], e.encrypted[0]
  end

  def test_encryptor_can_modify_two_different_chars
    e = Encryptor.new(220909)
    e.encrypt("AZ")
    assert_equal e.rotation_A["A"], e.encrypted[0]
    assert_equal e.rotation_B["Z"], e.encrypted[1]
  end

  def test_encryptor_can_encrypt_a_full_word
    e = Encryptor.new(220909)
    e.encrypt("HELLO")
    assert_equal e.rotation_A["H"], e.encrypted[0]
    assert_equal e.rotation_B["E"], e.encrypted[1]
    assert_equal e.rotation_C["L"], e.encrypted[2]
    assert_equal e.rotation_D["L"], e.encrypted[3]
    assert_equal e.rotation_A["O"], e.encrypted[4]
  end
end
