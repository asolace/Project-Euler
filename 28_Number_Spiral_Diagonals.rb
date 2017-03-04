# Number spiral diagonals
# Problem 28
#
# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:
#
# 							21 22 23 24 25
# 							20  7  8  9 10
# 							19  6  1  2 11
# 							18  5  4  3 12
# 							17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?

# top-right: n^2
# top-left: n^2 - n + 1
# bottom-left: n^2 - 2n + 2
# bottom-right: n^2 - 3n + 3
#
# sum = 4n^2 - 6n + 6. || 4(2n+1)2 – 12n
#
# Formula:
# http://www.mathblog.dk/project-euler-28-sum-diagonals-spiral/


#### Below, Using Formulas ####
width = (1001 + 1) / 2
def sumSpiralDiag(n)
  (16 * n**3 - 18 * n**2 + 14*n) / 3-3
end

puts sumSpiralDiag(width)

def sumSpiralDiag2(n)
  return 1 if n == 1
  4*((2*n-1)**2 - (3 * n - 3)) + sumSpiralDiag2(n-1)
end

puts sumSpiralDiag2(width)


#### Below, http://johnnycoder.com/blog/2010/07/30/project-euler-28-ruby/ ####
def sumsum
  sum = 1

  (3..1001).step(2).each do |n|
    n_squared = n*n

    sum += n_squared \
      + (n_squared - n + 1) \
      + (n_squared - 2*n + 2) \
      + (n_squared - 3*n + 3)
  end

  sum
end

puts sumsum
