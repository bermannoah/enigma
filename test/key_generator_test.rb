gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  

  def test_the_generator_can_create_a_random_key
    kg = KeyGenerator.new
    kg2 = KeyGenerator.new
    kg.initial_rotations
    kg2.initial_rotations
    refute_equal kg.key, kg2.key
  end

  def test_the_generator_can_find_a_date
    kg = KeyGenerator.new
    kg.date_finder
    assert_equal "300816", kg.date_entry
  end

  def test_generator_can_square_a_date
    key = KeyGenerator.new
    key.date_finder
    assert_equal  key.date_entry.to_i * key.date_entry.to_i, key.square
  end


  def test_cipher_can_return_last_four_digits_of_square
    key = KeyGenerator.new
    key.square
    key.last_four
    assert_equal key.date_a, key.last_four[0]
    assert_equal key.date_b, key.last_four[1]
    assert_equal key.date_c, key.last_four[2]
    assert_equal key.date_d, key.last_four[3]
  end

  def test_generator_can_create_final_keys
    key = KeyGenerator.new
    key.initial_rotations
    key.date_finder
    key.square
    key.last_four
    key.final_keys
    refute_equal key.keyA, nil
    refute_equal key.keyB, nil
    refute_equal key.keyC, nil
    refute_equal key.keyD, nil
  end
end
