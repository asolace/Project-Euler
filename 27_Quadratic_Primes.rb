# Quadratic primes
# Problem 27
#
# Euler discovered the remarkable quadratic formula:
#
# n^2+n+41
#
# It turns out that the formula will produce 40 primes for the consecutive integer
# values 0≤n≤39.
#
# However, when n=40,40^2+40+41=40(40+1)+41 is divisible by 41,
# and certainly when n=41,41^2+41+41 is clearly divisible by 41.
#
# The incredible formula n^2−79n+1601 was discovered,
# which produces 80 primes for the consecutive values 0≤n≤79.
# The product of the coefficients, −79 and 1601, is −126479.
#
# Considering quadratics of the form:
#
#     n^2+an+b, where |a|<1000 and |b|≤1000
#
# where |n| is the modulus/absolute value of n e.g. |11|=11 and |−4|=4
#
# Find the product of the coefficients, a and b, for the quadratic expression that
# produces the maximum number of primes for consecutive values of n,
# starting with n=0.

require 'prime'
def oddOrEven?(b)
  # a && b must both be odd || even
  b % 2 == 0 ? -1 : 0
end

def sign?(i)
  i == 0 ? 1 : -1
end

def quadPrime
  max = 0
  product = 0

  (-999..1_000).step(2) do |a|
    (2..1_000).each do |b|
      i = 0
      while i < 2
        n = 0
        while (((n ** 2) + (a + oddOrEven?(b)) * n + (sign?(i) * b)).prime?)
          n += 1
        end

        if n > max
          max = n
          product = a * b
        end
        i += 1
      end
    end
  end
  product
end

puts quadPrime
