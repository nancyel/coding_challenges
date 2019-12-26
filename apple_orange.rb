# https://www.hackerrank.com/challenges/apple-and-orange/problem

def countApplesAndOranges(s, t, a, b, apples, oranges)
  puts apples.map { |apple| a + apple }
    .select { |apple| apple >= s && apple <= t }
    .count

  puts oranges.map { |orange| b + orange }
    .select { |orange| orange >= s && orange <= t }
    .count
end
