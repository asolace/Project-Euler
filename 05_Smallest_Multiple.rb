# Smallest multiple
# Problem 5
#
# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?

def gcd(lcm, n)
  while n > 0
    lcm %= n
    return n if lcm == 0
    n %= lcm
  end

  lcm
end

def smallestMultiple(num)
	lcm = 1

	(2..num).each do |n|
		lcm *= n / gcd(lcm, n)
	end

	lcm
end

puts smallestMultiple(20)
