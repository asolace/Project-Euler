# What is fibonacci?
# https://www.blackbytes.info/2015/08/ruby-recursion-and-memoization/

## I decided to bench test some fibonacci algorithms
## Winner goes to Model 3

# Model 1
# https://github.com/franzejr/best-ruby/blob/master/tricks/source_code/fast_memoization_fibonacci.rb
fibonacci = Hash.new{ |numbers,index|
  numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
}.update(0 => 0, 1 => 1)

puts "Model 1"
s1 = Time.new
puts fibonacci[100]
puts "Elapsed: #{(Time.new - s1) * 1000}"
puts ""


# Model 2
# http://stackoverflow.com/questions/24438655/ruby-fibonacci-algorithm
def fib(n, memo = {})
  if n == 0 || n == 1
    return n
  end
  memo[n] ||= fib(n-1, memo) + fib(n-2, memo)
end

puts "Model 2"
s2 = Time.new
puts fib(100)
puts "Elapsed: #{(Time.new - s2) * 1000}"
puts ""


# Model 3
# https://www.dotnetperls.com/fibonacci-ruby
def fibonacci(n)
    a = 0
    b = 1

    # Compute Fibonacci number in the desired position.
    n.times do
        temp = a
        a = b
        # Add up previous two numbers in sequence.
        b = temp + b
    end

    return a
end

puts "Model 3"
s3 = Time.new
puts fibonacci(100)
puts "Elapsed: #{(Time.new - s3) * 1000}"
