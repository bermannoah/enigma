require './test/test_helper'
require './lib/cracker'
require 'pry'

class CrackerTest < Minitest::Test
 
 def test_cracker_can_decrypt_something_given_all_the_info
   c = Cracker.new
   c.crack("`$,K,\"6Gz BG$8B[:!56:E", 300816, 12345)
   assert_equal "They found us! ..end..", c.clear_text
 end
 
 def test_cracker_can_decrypt_something_given_the_date
   c = Cracker.new
   c.crack("`$,K,\"6Gz BG$8B[:!56:E", 300816)
   assert_equal "They found us! ..end..", c.clear_text
 end
 
 def test_cracker_can_decrypt_something_given_no_info
   c = Cracker.new
   c.crack("`$,K,\"6Gz BG$8B[:!56:E")
   assert_equal "They found us! ..end..", c.clear_text
 end


end
