def valid?(c)
  return false unless c.is_a?(String)
  return false if c == "z"
  return false if c.size != 1
  return false if c == c.upcase 
  return false if c != c.downcase
  true 
end

def alphabet(c)
  return nil unless valid?(c)
  c.next
end

#test
puts alphabet("a") == "b"
puts alphabet("y") == "z"
puts alphabet("z") == nil
puts alphabet(1) == nil
puts alphabet("A") == nil
puts alphabet("aa") == nil

#all true