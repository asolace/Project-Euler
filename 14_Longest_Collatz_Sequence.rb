# Longest Collatz sequence
# Problem 14
#
# The following iterative sequence is defined for the set of
# positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13,
# we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.


@memo = {1 => 1}
def collatzOf(num)
	longest_chain = 0
	longest_starting = 0

	(1..num).each do |starting|
		i = starting
		chain = 0
		while (i != 1) && (i >= starting)
			i = i.even? ? i / 2 : (3 * i + 1) / 2
			chain += 1
		end
		chain += @memo[i]
		if chain > longest_chain
			longest_chain = chain
			longest_starting = starting
		end
		@memo[starting] = chain
		starting += 1
	end
	longest_starting
end

p collatzOf(1_000_000)
