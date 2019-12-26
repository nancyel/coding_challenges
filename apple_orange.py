# https://www.hackerrank.com/challenges/apple-and-orange/problem

def countApplesAndOranges(s, t, a, b, apples, oranges):
    apples = map(lambda x: a + x, apples)
    oranges = map(lambda x: b + x, oranges)
    apple_count = len(list(filter(lambda x: x >= s and x <= t, apples)))
    orange_count = len(list(filter(lambda x: x >= s and x <= t, oranges)))
    
    print(apple_count)
    print(orange_count)
