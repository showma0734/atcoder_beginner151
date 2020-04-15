def valid?(n, k, m, arr)
  return false unless [n, k, m].all?{|obj| obj.is_a?(Integer)}
  return false unless arr.is_a?(Array)
  return false unless arr.all?{|obj| obj.is_a?(Integer)}
  return false if n < 2 || n > 100
  return false if k < 1 || k > 100
  return false if m < 1 || m > k
  return false if arr.any?{|num| num < 0 || num > k}
  return false if (n - 1) != arr.size
  true
end

def achieve(n, k, m, arr)
  return nil unless valid?(n, k, m, arr)
  sum = (m * n) - arr.sum
  if sum >= 100 
    sum = -1
  elsif sum <= 0
    sum = 0
  end
  sum
end

#test
puts achieve(5, 10, 7, [8, 10, 3, 6]) == 8
puts achieve(4, 100, 60, [100, 100, 100]) == 0
puts achieve(4, 100, 60, [0, 0, 0]) == -1
puts achieve(2, 10, 5, [5]) == 5 
puts achieve(1, 10, 10, [nil]) == nil
puts achieve(100, 10, 5, [5]*99) == 5
puts achieve(101, 10, 5, [5]*100) == nil
puts achieve(2, 1, 1, [1]) == 1
puts achieve(2, 0, 1, [1]) == nil
puts achieve(2, 101, 50, [50]) == nil
puts achieve(2, 10, 0, [1]) == nil
puts achieve(2, 10, 11, [10]) == nil
puts achieve(2, 10, 5, [0]) == 10
puts achieve(2, 10, 5, [-1]) == nil
puts achieve(2, 10, 5, [11]) == nil
puts achieve(2, 10, 5, [10, 10]) == nil
puts achieve("a", 10, 5, [5]) == nil
puts achieve(2, "a", 5, [5]) == nil
puts achieve(2, 10, "a", [5]) == nil
puts achieve(2, 10, 5, ["a"]) == nil
#all true