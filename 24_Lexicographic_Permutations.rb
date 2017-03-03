# Lexicographic permutations
# Problem 24
#
# A permutation is an ordered arrangement of objects.
# For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
# If all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order.
# The lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the
# digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

def perm(arr)
  digits = arr.permutation.to_a
  digits[999_999].join
end

digits = (0..9).to_a
puts perm(digits)

#### Above, with permutation method ####
#### Below, a cleaver solution (Credits to Bristow)####
#### http://jondotcomdotorg.net/ #####

class Integer
  def factorial
    return 1 if self == 0
    (1..self).inject(1,:*)
  end
end

def solver
  seed = "0123456789"
  sofar = ""
  nth = 999999
  (0..9).each do |i|
    f=(9-i).factorial
    n=nth/f
    sofar += seed[n]
    nth -= f*n
    seed = seed.delete(seed[n])
  end
  sofar
end

puts solver
