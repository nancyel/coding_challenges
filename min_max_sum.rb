# https://www.hackerrank.com/challenges/mini-max-sum/problem

def miniMaxSum(arr)
    sorted_arr = arr.sort
    without_min_sum = sorted_arr.drop(1).sum
    without_max_sum = sorted_arr.tap(&:pop).sum
    [without_max_sum, without_min_sum]
end

# miniMaxSum([7, 69, 2, 221, 8974])
