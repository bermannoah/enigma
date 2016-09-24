require './test/test_helper'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_can_create_a_new_key
    e = Enigma.new
    e.new_key_generator
    assert_equal 5, e.key.length
  end

end
