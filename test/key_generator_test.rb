gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  def test_the_generator_can_create_a_random_key
    kg = KeyGenerator.new(101010)
    kg2 = KeyGenerator.new(101010)
    refute_equal kg.key, kg2.key
  end


    def test_generator_can_square_a_date

      key = KeyGenerator.new(101010)
      assert_equal  101010 * 101010, key.square
    end

    def test_cipher_can_return_last_four_digits_of_square
      key = KeyGenerator.new(101010)
      assert_equal ["0", "1", "0", "0"], key.square.last_four
    end

end
