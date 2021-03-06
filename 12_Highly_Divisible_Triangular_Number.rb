# Highly divisible triangular number
# Problem 12
#
# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
# The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#      1: 1
#      3: 1,3
#      6: 1,2,3,6
#     10: 1,2,5,10
#     15: 1,3,5,15
#     21: 1,3,7,21
#     28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

def nthTriangle(n)
	(1..n).to_a.reduce(:+)
end


def findFactors(n)
	factors = []

	i = 1
	while i <= nthTriangle(n)
		factors << i if nthTriangle(n) % i == 0
		i += 1
	end
	factors
end

def hdtn(n)
	i = 1
	while findFactors(i).length < n
		i += (i + 1)
	end
	findFactors(i).last
end

# puts hdtn(500)


#### Above, Brute force. May take some time... ####
#### Below, with Prime library ####

require "prime"

def divisorCounter(n)
	sum = 1

	n.prime_division.each do |x|
		sum *= (x[1] + 1)
	end
	sum
end

def hdtn2(n)
	nthTri = 1

	i = 1
	while divisorCounter(nthTri) <= n
		i += 1
		nthTri += i
	end
	nthTri
end

puts hdtn2(500)
