gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_can_create_a_new_key
    e = Enigma.new
    e.new_key_generator
    assert_equal 5, e.key.length
  end

  def test_enigma_can_generate_offsets
    e = Enigma.new
    e.new_key_generator
    e.date_entry(300816)
    e.date_square
    e.find_first_rotations
    e.generate_offset
  end



end
