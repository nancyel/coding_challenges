# https://www.hackerrank.com/challenges/time-conversion/problem

def timeConversion(s)
  time_arr = s.split(":")
  hour = time_arr[0].to_i
  night_or_day = time_arr[-1][-2..-1]

  if hour < 12 && night_or_day == 'PM'
    hour += 12
  elsif hour == 12 && night_or_day == 'AM'
    hour = 0
  end

  time_arr[0] = hour.to_s.rjust(2, '0')  # 0-padding
  time_arr[-1] = time_arr[-1][0..-3]  # remove 'AM' or 'PM'
  time_arr.join(":")
end
