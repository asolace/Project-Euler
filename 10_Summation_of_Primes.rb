# Summation of primes
# Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def isPrime?(n)
	i = 2
	while i < n
		return false if n % i == 0
		i += 1
	end
	return true
end


def primeSum(num)
	primes = []

	i = 2
	while i < num
		primes << i if isPrime?(i)
		i += 1
	end
	primes.reduce(:+)
end

# puts primeSum(2_000_000)


#### Above, Brute force. May take some time... ####
#### Below, with Prime library ####

require "prime"

puts Prime.each(2_000_000).reduce(:+)
