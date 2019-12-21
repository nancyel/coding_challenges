# "https://www.hackerrank.com/challenges/birthday-cake-candles/problem"

# initial >> terminated due to timeout (the code below may not be quick and efficient enough to pass the test cases)
def birthdayCakeCandles(ar)
    ar.select {|x| x == ar.max }.count
end


# second attempt >> passed!
def birthdayCakeCandles(ar)
  count = 0;
  max_num = ar.max;
  ar.each do |x|
    x == max_num ? count += 1 : next
  end
  count
end
