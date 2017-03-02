# Factorial digit sum
# Problem 20
#
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10!
# is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

def factorial(n)
  return 1 if n <= 1

  n * factorial(n-1)
end

def fds(n)
  factorial(n)
  .to_s
  .chars
  .map!{|c| c.to_i}
  .reduce(:+)
end

puts fds(100)
