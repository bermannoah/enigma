gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test


    def test_decryptor_can_decrypt_one_letter
      e = Encryptor.new
      e.encrypt("A")
      key = e.cipher.key.key
      d = Decryptor.new
      d.decrypt(e.encrypted)
      assert_equal d.decrypt_rotation_A[e.encrypted], e.decrypted[0]
    end

    def test_decryptor_can_handle_when_it_turns_something_into_quotes
      skip
      e.Encryptor.new
      e.decrypt("qrwefewf''''''")
      something else goes here
    end

    def test_decryptor_can_modify_two_identical_chars
      skip
      e = Decryptor.new
      e.decrypt("AA")
      assert_equal e.rotation_A["A"], e.decrypted[0]
    end

    def test_decryptor_can_modify_two_different_chars
      skip
      e = Decryptor.new
      e.decrypt("AZ")
      assert_equal e.rotation_A["A"], e.decrypted[0]
      assert_equal e.rotation_B["Z"], e.decrypted[1]
    end

    def test_decryptor_can_decrypt_a_full_word
      skip
      e = Decryptor.new
      e.decrypt("HELLO")
      assert_equal e.rotation_A["H"], e.decrypted[0]
      assert_equal e.rotation_B["E"], e.decrypted[1]
      assert_equal e.rotation_C["L"], e.decrypted[2]
      assert_equal e.rotation_D["L"], e.decrypted[3]
      assert_equal e.rotation_A["O"], e.decrypted[4]
    end

    def test_decryptor_can_decrypt_a_phrase
      skip
      e = Decryptor.new
      e.decrypt("MORE COFFEE")
      assert_equal e.rotation_A["M"], e.decrypted[0]
      assert_equal e.rotation_B["O"], e.decrypted[1]
      assert_equal e.rotation_C["R"], e.decrypted[2]
      assert_equal e.rotation_D["E"], e.decrypted[3]
      assert_equal e.rotation_A[" "], e.decrypted[4]
      assert_equal e.rotation_B["C"], e.decrypted[5]
      assert_equal e.rotation_C["O"], e.decrypted[6]
      assert_equal e.rotation_D["F"], e.decrypted[7]
      assert_equal e.rotation_A["F"], e.decrypted[8]
      assert_equal e.rotation_B["E"], e.decrypted[9]
      assert_equal e.rotation_C["E"], e.decrypted[10]
    end

    def test_decryptor_comes_up_with_different_rotations
      skip
      e = Decryptor.new
      e.decrypt("MORE COFFEE")
      e1 = Decryptor.new
      e1.decrypt("MORE COFFEE")
      assert e.decrypted != e1.decrypted
    end



end
