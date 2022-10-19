# 8:53 - 9:02 (pause) 9 min
# 9:21 - 9:52 31 min
# 10:00 - 11:19 1 hour


# GOAL: Create a clock that allows you to add and subtract minutes (and keeps a record of time), without using built-in time or date functionality
# - at method takes a variable array as argument consisting of hour and optional minutes
# - it is possible to add/subtract minutes to a given time (define +/- method?)

# APPROACH: use `sleep` in a loop in order to automatically update time (unless this doesn't meet test cases)

# INPUT: Array [hour, minute]
# OUTPUT: Formatted String time

# DS:

# ALGORITHM:

# SPIKE: 
# class Clock
#   def initialize(hour, minute)
#     @hour = hour
#     @minute = minute 
#     time_in_minutes
#   end

#     def self.at(*time) 
#       hour, minute = time
#       minute = 0 if minute.nil?
#       new(hour, minute)
#     end
    
#     def +(minutes)
#       @time_in_minutes += minutes
#       @hour = normalize(@time_in_minutes).first
#       @minute = normalize(@time_in_minutes).last
#       normalize_hour
#       self 
#     end

#     def -(minutes)
#       @time_in_minutes -= minutes
#       @hour = normalize(@time_in_minutes).first
#       @minute = normalize(@time_in_minutes).last
#       normalize_hour
#       self
#     end
    
#     def ==(other)
#       to_s == other.to_s
#     end

#     def to_s
#       format('%02d:%02d', @hour, @minute)
#     end

#     def time_in_minutes
#       @time_in_minutes = (@hour * 60) + @minute
#     end

#     def normalize(total_minutes) # 0 == 24; cycles of 60 minutes
#       if total_minutes < 1440
#         hour, minute = total_minutes.divmod(60)
#       else
#         days, minutes = total_minutes.divmod(1440)
#         hour, minute = minutes.divmod(60)
#       end
#       [hour, minute]
#     end

#     def normalize_hour
#       @hour = @hour.divmod(24).last
#     end
#   # end
# end

## Singleton Object solution 

class Clock
  class << self  
    def at(*time) 
      @hour, @minute = time
      @minute = 0 if @minute.nil?
      time_in_minutes
      self.dup
    end

    def +(minutes)
      @time_in_minutes += minutes
      normalize_time
      self
    end

    def -(minutes)
      @time_in_minutes -= minutes
      normalize_time
      self
    end

    def ==(other)
      to_s == other.to_s
    end

    def to_s
      format('%02d:%02d', @hour, @minute)
    end

    private

    def time_in_minutes
      @time_in_minutes = (@hour * 60) + @minute
    end

    def normalize_time
      @hour = normalize(@time_in_minutes).first
      @minute = normalize(@time_in_minutes).last
      @hour = @hour.divmod(24).last
    end

    def normalize(total_minutes) 
      if total_minutes < 1440
        hour, minute = total_minutes.divmod(60)
      else
        days, minutes = total_minutes.divmod(1440)
        hour, minute = minutes.divmod(60)
      end
      [hour, minute]
    end
  end
end
c = Clock.at(11, 9)
puts c