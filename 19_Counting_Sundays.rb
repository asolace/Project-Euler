# Counting Sundays
# Problem 19
#
# You are given the following information,
# but you may prefer to do some research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4,
# but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

def sundayCounter
  days = [31,28,31,30,31,30,31,31,30,31,30,31]
  date, sundays = 0, 0, 0

  (1901...2000).each do
    (0..11).each do |month|
      date = (date + days[month]) % 7
      sundays += 1 if date == 6
    end
  end
  sundays += 1
  sundays
end

puts sundayCounter

#### Above,
#### Below, using date library ####

require 'date'

def sundayCounter2(starting, ending)
  sundays = 0

  while starting < ending
    sundays += 1 if starting.sunday?
    starting = starting >> 1
  end

  sundays
end

starting_date = Date.new(1901, 1, 1)
ending_date = Date.new(2000, 12, 31)

puts sundayCounter2(starting_date, ending_date)
