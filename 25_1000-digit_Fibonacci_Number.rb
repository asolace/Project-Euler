# 1000-digit Fibonacci number
# Problem 25
#
# The Fibonacci sequence is defined by the recurrence relation:
#
#     Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
# Hence the first 12 terms will be:
#     F1 = 1
#     F2 = 1
#     F3 = 2
#     F4 = 3
#     F5 = 5
#     F6 = 8
#     F7 = 13
#     F8 = 21
#     F9 = 34
#     F10 = 55
#     F11 = 89
#     F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain
# 1000 digits?

# I used the winning Fibonacci algorithm; tested at "./files/fibonacci.rb"

def fibonacci(n)
  a, b = 0, 1

  n.times do
    temp = a
    a = b
    b = temp + b
  end

  a
end

def fib1kDigit
  i = 12

  while i > 0
    if fibonacci(i).to_s.chars.length >= 1000
      return i
    end
    i += 1
  end
end

puts fib1kDigit

#### Below, Johnny thought of a cleaver solution ####
#### http://johnnycoder.com/blog/2010/07/19/project-euler-25-ruby/ ####


answer =- 1
previous = 0
i = 1
while i.to_s.length < 1000
    answer += 1
    i, previous = previous, previous + i
end

puts answer
