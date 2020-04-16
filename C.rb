def valid?(n, m, p_arr, s_arr)
  return false unless [n, m].all?{|obj| obj.is_a?(Integer)}
  return false unless [p_arr, s_arr].all?{|obj| obj.is_a?(Array)}
  return false unless p_arr.all?{|obj| obj.is_a?(Integer)}
  return false if n < 1 || n > 10**5
  return false if m < 0 || m > 10**5
  return false if p_arr.any?{|p| p < 1 || p > n }
  return false unless s_arr.all?{|s| s == "AC" || s == "WA"}
  return false if m != p_arr.size
  return false if m != s_arr.size
  true
end

def welcome(n, m, p_arr, s_arr)
  return nil unless valid?(n, m, p_arr, s_arr)
  sum = p_arr.zip(s_arr).uniq.select{|arr| arr[1] == "AC"}.size
  if sum == 0
    penalty = 0
  else
    arr = p_arr.zip(s_arr).uniq
    ac_idx = arr.map.with_index(1){|s, idx|idx if s[1] == "AC"}.compact
    penalty = ac_idx.max - sum
  end
  "#{sum} #{penalty}"
end

#test
puts welcome(2, 5, [1, 1, 2, 2, 2], ["WA",  "AC", "WA", "AC", "WA"]) == "2 2"
puts welcome(1000, 3, [777, 777, 777], ["AC", "AC", "AC"]) == "1 0"
#puts welcome(6, 0, [nil], [nil]) == "0 0"
puts welcome(1, 1, [1], ["AC"]) == "1 0"
puts welcome(0, 0, [nil], [nil]) == nil
puts welcome(10**5, 1, [1], ["AC"]) == "1 0"
puts welcome(11**5, 1, [1], ["AC"]) == nil
puts welcome(10, -1, [nil], [nil]) == nil
puts welcome(10, 10**5, [1]*10**5, ["WA"]*10**5) == "0 0"
puts welcome(10, 11**5, [1]*11**5, ["WA"]*11**5) == nil
puts welcome(10, 1, [0], ["WA"]) == nil
puts welcome(10, 1, [11], ["WA"]) == nil
puts welcome(10, 1, [5], ["WC"]) == nil
puts welcome(10, 1, [5, 5], ["WA"]) == nil
puts welcome(10, 1, [5], ["AC", "WA"]) == nil
puts welcome("a", 1, [1], ["WA"]) == nil
puts welcome(10, "a", [5], ["WA"]) == nil
puts welcome(10, 1, ["a"], ["WA"]) == nil
puts welcome(10, 1, [5], [1]) == nil
puts welcome(10, 1, [5], ["1"]) == nil
puts welcome(10, 1, [5], ["wa"]) == nil
#all true