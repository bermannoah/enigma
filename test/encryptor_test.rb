gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_encryptor_can_encrypt_one_letter
    e = Encryptor.new
    e.encrypt("A")
    assert_equal e.rotation_A["A"], e.encrypted[0]
  end

  def test_encryptor_can_modify_two_identical_chars
    e = Encryptor.new
    e.encrypt("AA")
    assert_equal e.rotation_A["A"], e.encrypted[0]
  end

  def test_encryptor_can_modify_two_different_chars
    e = Encryptor.new
    e.encrypt("AZ")
    assert_equal e.rotation_A["A"], e.encrypted[0]
    assert_equal e.rotation_B["Z"], e.encrypted[1]
  end

  def test_encryptor_can_encrypt_a_full_word
    e = Encryptor.new
    e.encrypt("HELLO")
    assert_equal e.rotation_A["H"], e.encrypted[0]
    assert_equal e.rotation_B["E"], e.encrypted[1]
    assert_equal e.rotation_C["L"], e.encrypted[2]
    assert_equal e.rotation_D["L"], e.encrypted[3]
    assert_equal e.rotation_A["O"], e.encrypted[4]
  end

  def test_encryptor_can_encrypt_a_phrase
    e = Encryptor.new
    e.encrypt("MORE COFFEE")
    assert_equal e.rotation_A["M"], e.encrypted[0]
    assert_equal e.rotation_B["O"], e.encrypted[1]
    assert_equal e.rotation_C["R"], e.encrypted[2]
    assert_equal e.rotation_D["E"], e.encrypted[3]
    assert_equal e.rotation_A[" "], e.encrypted[4]
    assert_equal e.rotation_B["C"], e.encrypted[5]
    assert_equal e.rotation_C["O"], e.encrypted[6]
    assert_equal e.rotation_D["F"], e.encrypted[7]
    assert_equal e.rotation_A["F"], e.encrypted[8]
    assert_equal e.rotation_B["E"], e.encrypted[9]
    assert_equal e.rotation_C["E"], e.encrypted[10]
  end

  def test_encryptor_comes_up_with_different_rotations
    e = Encryptor.new
    e.encrypt("MORE COFFEE")
    e1 = Encryptor.new
    e1.encrypt("MORE COFFEE")
    assert e.encrypted != e1.encrypted
  end

end
