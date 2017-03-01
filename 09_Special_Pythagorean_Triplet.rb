# Special Pythagorean triplet
# Problem 9
#
# A Pythagorean triplet is a set of three natural numbers,
# a < b < c, for which,
#
# 		a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 3 + 4 + 5 = 12
# 3 * 4 * 5 = 60
#
# There exists exactly one Pythagorean triplet for
# which a + b + c = 1000.
# Find the product abc.


def specPythTrip(sum)
	(3..(sum/2)).each do |a|
		(3..(sum/2)).each do |b|
			c = sum - a - b
			if ((a**2) + (b**2) == (c**2))
				return a * b * c
			end
		end
	end
end


puts specPythTrip(100)
