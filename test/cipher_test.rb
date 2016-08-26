gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'
require 'pry'

class CipherTest < Minitest::Test

  def test_cipher_can_square_a_date
    c = Cipher.new(1, 101010)
    assert_equal  101010 * 101010, c.date
  end

  def test_cipher_can_return_last_four_digits_of_square
    c = Cipher.new(1, 101010)
    assert_equal ["0", "1", "0", "0"], c.last_four
  end



end
