# Power digit sum
# Problem 16
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

def powerDigitSum(num, expo)
  (num**expo).to_s.chars.map!{|c| c.to_i}.reduce(:+)
end

puts powerDigitSum(2, 1000)
