# Reciprocal cycles
# Problem 26

# A unit fraction contains 1 in the numerator.
# The decimal representation of the unit fractions with
# denominators 2 to 10 are given:

#     1/2	= 	0.5
#     1/3	= 	0.(3)
#     1/4	= 	0.25
#     1/5	= 	0.2
#     1/6	= 	0.1(6)
#     1/7	= 	0.(142857)
#     1/8	= 	0.125
#     1/9	= 	0.(1)
#     1/10= 	0.1

# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.

require 'prime' # because of info from wikipedia
# https://en.wikipedia.org/wiki/Repeating_decimal#Cyclic_numbers

def recipCycleLength(n)
	return 0 if (n % 2 == 0 || n % 5 == 0)
	i = 1
	until (((10 ** i) - 1) % n) == 0
		i += 1
	end
	i
end

def longestRecipCycle(denominators)
	longest_length = 0
	longest_recip = 0

	Prime.each(denominators) do |d|
		if recipCycleLength(d) > longest_length
			longest_length = recipCycleLength(d)
			longest_recip = d
		end
	end
	longest_recip
end

puts longestRecipCycle(1000)
