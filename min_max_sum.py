# https://www.hackerrank.com/challenges/mini-max-sum/problem

def miniMaxSum(arr):
    def tap(x, f):
        f(x)
        return x

    arr.sort()
    without_min_sum = sum(tap(arr, lambda x: x.pop(0)))
    without_max_sum = sum(tap(arr, lambda x: x.pop()))
    return [without_max_sum, without_min_sum]


# print(miniMaxSum([1, 2, 3, 4, 5]))
