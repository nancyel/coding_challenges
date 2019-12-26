# https://www.hackerrank.com/challenges/compare-the-triplets/problem

def compareTriplets(a, b)
  alice = 0
  bob = 0

  a.length.times do |i|
    if a[i] > b[i]
        alice += 1
    elsif a[i] < b[i]
        bob += 1
    end
  end

  [alice, bob]
end
