class KeyGenerator
  key = rand(1000..9999).to_s
  key_a = key[0,1].to_i
  key_b = key[1,2].to_i
  key_c = key[2,3].to_i
  key_d = key[3,4].to_i
end
