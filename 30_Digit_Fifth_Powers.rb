# Digit fifth powers
# Problem 30
#
# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:
#
#     1634 = 1^4 + 6^4 + 3^4 + 4^4
#     8208 = 8^4 + 2^4 + 0^4 + 8^4
#     9474 = 9^4 + 4^4 + 7^4 + 4^4
#
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.

def sumPowerDigits(p)
  max = 5*9**5
  sums = 0
  (2..max).each do |n|
    digit_sum = n.to_s.chars.map { |e| (e.to_i )**p}.reduce(:+)
    sums += n if digit_sum == n
  end
  sums
end

puts sumPowerDigits(5)
