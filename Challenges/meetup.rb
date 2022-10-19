# 8:18 - 9:50 (1h32m)


# GOAL: Construct objects that represent a meetup date.
# - Each object takes a month number (1-12) and a year (eg 2021).
# - Object should be able to determine exact date of meetup based on weekday request string descriptors: first, second, third, fourth, fifth, last, teenth
# - Weekdays include Saturday and Sunday
# - a 'teenth` weekday si a weekday that falls on a date ending in -teenth (there is exactly one of each weekday that ends in teenth )
# - The fifth day of the month may not happen every month
# - Days of the week are also given by strings (Monday, Tuesday, etc)
# - Strings are case-insensitive

# - Meetup#day needs to return a `Date` object according to the return value of `Date::civil`

# DS:


# APPROACH:
# Given year (e.g. 2013), month (e.g, April), weekday in a week (e.g. Monday), and week within a month( e.g. second Monday), return corresponding `Date.civil` object

# ALGORITHM
# - Given day of the week, month, and year, calculate all possible dates that fall on that weekday in the given month-year and store result in an array (HELPER #1)
# - Return the corresponding weekday (first, second..teenth)


#HELPER #1: calculate day
# - Iterate over all the days of a given month-year
# - Select those days that match the given weekday

# SPIKE:

require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule) 
    @weekday = weekday.downcase
    @schedule = schedule.downcase
    @days = calculate_days
    meetup_date
  end

  private

  def day?
    (@weekday + "?").to_sym
  end

  def calculate_days
    Date.civil(@year, @month)
        .step(Date.civil(@year, @month, -1))
        .select(&day?)
  end

  def meetup_date
    case @schedule
    when "first"   then @days[0]
    when "second"  then @days[1]
    when "third"   then @days[2]
    when "fourth"  then @days[3]
    when "fifth"   then @days[4]
    when "last"    then @days[-1]
    when "teenth"  then teenth
    end
  end

  def teenth
    @days.select {|d| (13..19).include?(d.day)}.first
  end
end

