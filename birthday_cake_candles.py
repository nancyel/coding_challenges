# "https://www.hackerrank.com/challenges/birthday-cake-candles/problem"

def birthdayCakeCandles(ar):
    count = 0
    max_num = max(ar)
    for num in ar:
        if num == max_num:
            count += 1
        else:
            continue
    return count
