gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  def test_the_generator_can_create_a_random_key
    kg = KeyGenerator.new("101010")
    kg2 = KeyGenerator.new("101010")
    refute_equal kg.key, kg2.key
  end


    def test_generator_can_square_a_date
      key = KeyGenerator.new("101010")
      assert_equal  101010 * 101010, key.square
    end

    def test_cipher_can_return_last_four_digits_of_square
      key = KeyGenerator.new("101010")
      key.square
      key.last_four
      assert_equal key.date_a, 0
      assert_equal key.date_b, 1
      assert_equal key.date_c, 0
      assert_equal key.date_d, 0
    end

    def test_generator_can_create_final_keys
      key = KeyGenerator.new("081212")
      key.initial_rotations
      key.square
      key.last_four
      key.final_keys
      refute_equal key.key1, nil
      refute_equal key.key2, nil
      refute_equal key.key3, nil
      refute_equal key.key4, nil
    end
end
