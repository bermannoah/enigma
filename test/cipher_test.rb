require './test/test_helper'
require './lib/cipher'
require 'pry'

class CipherTest < Minitest::Test

  def test_cipher_can_be_passed_a_key
    c = Cipher.new(12345)
    assert_equal "12345", c.key
  end

  def test_cipher_can_create_its_own_key
    c = Cipher.new
    assert_equal 5, c.key.length
  end

  def test_cipher_can_create_new_rotations
    c = Cipher.new(12345)
    c.find_first_rotations
    assert_equal 12, c.key_a
    assert_equal 23, c.key_b
    assert_equal 34, c.key_c
    assert_equal 45, c.key_d
  end

  def test_cipher_has_a_date
    c = Cipher.new
    c.date_entry(300816)
    assert_equal 300816, c.date
  end

  def test_cipher_can_find_todays_date
    c = Cipher.new
    assert_equal c.today, c.date
  end

  def test_if_a_date_is_passed_in_it_overwrites_time_finder
    c = Cipher.new
    c.time_finder
    c.date_entry(190916)
    assert_equal 190916, c.date
  end

  def test_cipher_can_square_the_date
    c = Cipher.new
    c.date_entry(300816)
    c.date_square
    assert_equal 90490265856, c.date_squared
  end
  
  def test_cipher_can_find_first_rotations
    c = Cipher.new(12345)
    c.date_entry(300816)
    c.date_square
    c.find_first_rotations
    assert_equal 12, c.key_a
    assert_equal 23, c.key_b
    assert_equal 34, c.key_c
    assert_equal 45, c.key_d
  end

  def test_cipher_can_come_up_with_offset
    c = Cipher.new
    c.date_entry(300816)
    c.date_square
    c.generate_offset
    assert_equal 5, c.offset_a
    assert_equal 8, c.offset_b
    assert_equal 5, c.offset_c
    assert_equal 6, c.offset_d
  end

  def test_cipher_can_come_up_with_keys_if_not_given_date
    c = Cipher.new
    c.time_finder
    c.date_entry
    c.date_square
    c.generate_offset
    refute_equal nil, c.offset_a
  end

  def test_cipher_can_create_final_keys
    c = Cipher.new(12345)
    c.find_first_rotations
    c.date_entry(190116)
    c.date_square
    c.generate_offset
    c.find_final_keys
    assert_equal 15, c.rotation_key_a
    assert_equal 27, c.rotation_key_b
    assert_equal 39, c.rotation_key_c
    assert_equal 51, c.rotation_key_d
  end
  
  def test_cipher_can_rotate_a_key
    c = Cipher.new(12345)
    assert_equal "S", c.rotate(1234).values[0]
  end
    

end
