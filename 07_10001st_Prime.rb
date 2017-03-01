# 10001st prime
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

def isPrime?(num)
	return false if num <= 1

	i = 2
	while i < num
		return false if num % i == 0
		i += 1
	end
	return true
end

def stPrime(num)
	counter = 0
	prime = nil

	i = 0
	while counter < num
		if isPrime?(i)
			counter += 1
			prime = i
		end
		i += 1
	end
	prime
end

puts stPrime(10001)

#### Above, Brute force method average 31 seconds ####
#### Below, Average .1 seconds ####

n = 3
primes = [2]
while primes.size < 10001 do
	max = Math.sqrt(n)
	for p in primes do
		if p > max
			primes << n
			break
		end
		break if n % p == 0
	end
	n = n + 1
end


puts primes[10000]
