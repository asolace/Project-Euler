# Lattice paths
# Problem 15

# Starting in the top left corner of a 2×2 grid,
# and only being able to move to the right and down, 
# there are exactly 6 routes to the bottom right corner.

# 	See image in img folder

# How many such routes are there through a 20×20 grid?

# Formula n! / ( k! ( k-n )! )
# n = total decisions to make

def latticePath(num)

				grid[i][j] = grid[i-1][j] + grid[i][j-1]
				grid[j][i] = grid[j-1][i] + grid[j][i-1]

end

p latticePath(20)


#### Below, Applying the formula ####

def factorial(n)
	(1..n).reduce(:*)
end

def latticePath_Formula(x, y)
	n =  x + y

	factorial(n) / (factorial(x) * factorial(y))
end

puts latticePath_Formula(20, 20)




# Another solution by Sashafklein that I thought was interesting.
# https://github.com/sashafklein/ruby_euler/blob/master/15%20-%20Lattice%20paths.rb

def paths(n)
	row = Array.new(n+1){1}

	n.times do
		(1..n).each do |i|
			# Effects a Pascal-style addition of each number at each corner
			# to produce the final number of paths hitting the end.
			row[i] = row[i] + row[i-1] 
		end
	end

	row.last
end

puts paths(20)