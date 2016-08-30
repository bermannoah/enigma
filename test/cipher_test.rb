gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/cipher'
require 'pry'

class CipherTest < Minitest::Test

  def test_cipher_can_use_keys_to_create_hash
    c = Cipher.new
    c.rotations
    assert Hash, c.rotation_A
  end

  def test_cipher_creates_different_hashes_for_each_key
    c = Cipher.new
    c.rotations
    refute_equal c.rotation_A, c.rotation_D
    refute_equal c.rotation_B, c.rotation_C
    refute_equal c.rotation_C, c.rotation_B
    refute_equal c.rotation_D, c.rotation_A
  end

end
