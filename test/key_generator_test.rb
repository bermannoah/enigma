require './test/test_helper'
require './lib/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_creates_a_random_key
    a = KeyGenerator.new
    b = KeyGenerator.new
    refute a == b
  end

  def test_key_is_a_string
    a = KeyGenerator.new
    assert String, a.key
  end
end
