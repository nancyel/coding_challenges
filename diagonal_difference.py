# https://www.hackerrank.com/challenges/diagonal-difference/problem
# Given a square matrix, calculate the absolute difference between the sums of its diagonals.

def diagonalDifference(arr):
    size = len(arr)
    left_to_right_sum = 0
    right_to_left_sum = 0

    for i in range(size):
        left_to_right_sum += arr[i][i]
        right_to_left_sum += arr[-i-1][i]

    return abs(left_to_right_sum - right_to_left_sum)


# print(diagonalDifference([[11, 2, 4], [4, 5, 6], [10, 8, -12]]))
