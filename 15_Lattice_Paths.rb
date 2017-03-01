# Lattice paths
# Problem 15
#
# Starting in the top left corner of a 2×2 grid,
# and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# 	See image in ./img folder
# How many such routes are there through a 20×20 grid?
#
# Formula n! / (k! (k-n)!)
# n = total decisions to make
#
### This is an example of a grid model as an array
# [
# 	[1,1,1],
# 	[1,2,3],
# 	[1,3,6]
# ]

def latticePath(x, y)
	grid = []
	x += 1 # Because arrays starts of at 0
	y += 1 # Because arrays starts of at 0

	# Set grid num x num of 0s
	(1..x).each do |n|
		grid << Array.new(x, 0)
	end

	# Initializing x and y axis to 1
	x1 = 0
	while x1 < x
		y1 = 0
		while y1 < y
			grid[0][y1] = 1
			grid[x1][0] = 1
			y1 += 1
		end
		x1 += 1
	end

	x3 = 1
	while x3 < x
		y3 = 1
		while y3 < y
			grid[x3][y3] = grid[x3-1][y3] + grid[x3][y3-1]
			y3 += 1
		end
		x3 += 1
	end

	grid.last.last
end

puts latticePath(20, 20)

#### Above, Setting up grid and finding the elements in the grid ####
#### Below, Applying the formula :: n! / (k! (k-n)!) ####

def factorial(n)
	(1..n).reduce(:*)
end

def latticePath_Formula(x, y)
	n =  x + y
	factorial(n) / (factorial(x) * factorial(y))
end

puts latticePath_Formula(20, 20)



#### Below, Setting up grid and finding the elements in the grid ####
## Can only work for square grids ##

def latticePath(num)
	grid = []
	num += 1 # Because arrays starts of at 0

	# Set grid num x num of 0s
	(1..num).each do |n|
		grid << Array.new(num, 0)
	end

	# Initializing x and y axis to 1
	(0...num).each do |x|
		(0...num).each do |y|
			grid[0][y] = 1
			grid[x][0] = 1
		end
	end

	(1...num).each do |x|
		(1...num).each do |y|
			grid[x][y] = grid[x-1][y] + grid[x][y-1]
		end
	end

	grid[num-1][num-1]
end

puts latticePath(20)




# Another solution by Sashafklein that I thought was interesting.
# https://github.com/sashafklein/ruby_euler/blob/master/15%20-%20Lattice%20paths.rb
## Can only work for square grids ##

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
