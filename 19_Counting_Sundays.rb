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
  date, sundays = 0, 1

  (1901...2000).each do
    (0..11).each do |month|
      date = (date + days[month]) % 7
      sundays += 1 if date == 6
    end
  end
  sundays
end

puts sundayCounter




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




## Another awesome solution by:
## https://ruby.janlelis.de/37-project-euler-19-20-21-22-23-24-25-ruby

class << SundayCounter = Module.new  # same as module SundayCounter; class << self
  START_YEAR = 1900
  END_YEAR   = 2000

  def leap_year?(y)
    y % 400 == 0  or
    ( y % 4 == 0 and y % 100 != 0 )
  end

  def month_length_of(m)
    [31, @february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m]
  end

  def set_february(year)
     @february = 28 + ( leap_year?(year) ? 1 : 0 )
  end

  def count
    sundays  = 0
    day      = 0
    month    = 0
    count_activated = false
    year     = START_YEAR
    set_february( year )

    while year <= END_YEAR
      sundays += 1  if day == 6 && count_activated

      day = (day + 7) % month_length_of(month)

      if day < 7 # new month reached
        month = (month + 1) % 12

        if month.zero? # new year reached
          year += 1
          set_february( year )
          count_activated = true # don't count the first year
        end

      end
    end

    sundays
  end
end

puts SundayCounter.count