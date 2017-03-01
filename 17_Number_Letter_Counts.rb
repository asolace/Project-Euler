# Number letter counts
# Problem 17
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters and
# 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

@ONES = {
  1 => 3,
  2 => 3,
  3 => 5,
  4 => 4,
  5 => 4,
  6 => 3,
  7 => 5,
  8 => 5,
  9 => 4
}

@ENTY = {
  20 => 6,
  30 => 6,
  40 => 5,
  50 => 5,
  60 => 5,
  70 => 7,
  80 => 6,
  90 => 6
}

@TEENS = {
  10 => 3,
  11 => 6,
  12 => 6,
  13 => 8,
  14 => 8,
  15 => 7,
  16 => 7,
  17 => 9,
  18 => 8,
  19 => 8
}

@IONS = {
  100 => 7,
  1000 => 8,
  1_000_000 => 7,
  1_000_000_000 => 7,
  1_000_000_000_000 => 8
}

def counter(n)
	case n
	when (0..9)
		@ONES[n]
	when (10..19)
		@TEENS[n]
	when (20..99)
		enties(n)
	else
		large_digits(n)
	end
end

def enties(n)
	result = @ENTY[(n / 10) * 10]
	
	if n % 10 != 0
		result += @ONES[(n % 10)]
	end

	result
end

def large_digits(n)
	# size: Gets they key in IONS object
	size = @IONS.keys.take_while { |size| size <= n }.last
	result = counter(n / size) + @IONS[size]


	if (n % size) != 0
		result += (counter(n % size) + 3)
	end

	result
end

def numLetterCounter(start, finish)
	result = 0

	(start..finish).each do |n|
		result += counter(n)
	end

	result
end

# Can input ranges instead of 1..n
puts numLetterCounter(1, 1000)


