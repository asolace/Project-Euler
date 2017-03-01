# Largest palindrome product
# Problem 4
#
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers
# is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit
# numbers.

def getNum(digits)
	num1 = "1"
	num2 = "9"

	while num1.length < digits
		num1 += "0"
		num2 += "9"
	end

	[num1.to_i, num2.to_i]
end


def largestPalindromeProduct(digits)
	range = getNum(digits)

	largest = (range[0]..range[1]).map do |i|
		(i..range[1]).map do |j|
			i * j
		end.select { |n| n.to_s == n.to_s.reverse }
	end.flatten.max

	largest
end

puts largestPalindromeProduct(3)
