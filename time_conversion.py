# https://www.hackerrank.com/challenges/time-conversion/problem


def timeConversion(s):
    time_arr = s.split(":")
    hour = int(time_arr[0])
    night_or_day = time_arr[-1][-2:]

    if hour < 12 and night_or_day == 'PM':
      hour += 12
    elif hour == 12 and night_or_day == 'AM':
      hour = 0

    time_arr[0] = str(hour).rjust(2, '0')
    time_arr[-1] = time_arr[-1][:-2]
    return ':'.join(time_arr)
