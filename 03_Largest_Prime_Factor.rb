# Largest prime factor
# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

def largestPrimeFactor(num)
	(2..num).each do |n|
		return num if num <= n
		num /= n if (num > n && num % n == 0)
	end
end

puts largestPrimeFactor(600851475143)
