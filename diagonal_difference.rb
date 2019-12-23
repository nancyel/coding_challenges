# https://www.hackerrank.com/challenges/diagonal-difference/problem
# Given a square matrix, calculate the absolute difference between the sums of its diagonals.

def diagonalDifference(arr)
    size = arr.length
    left_to_right_sum = 0
    right_to_left_sum = 0

    size.times do |i|
        left_to_right_sum += arr[i][i]
        right_to_left_sum += arr[-i-1][i]
    end

    (left_to_right_sum - right_to_left_sum).abs
end
