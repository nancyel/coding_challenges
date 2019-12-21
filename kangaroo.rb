# https://www.hackerrank.com/challenges/kangaroo/problem

def kangaroo(x1, v1, x2, v2)
  # edge case:
  if v1 == v2 && x1 != x2
    return 'NO'
  end

  # least common multiple
  jump = (x2 - x1) / (v1 - v2)

  # check for 2 conditions: is jump a postivie integer?
  if jump.abs % 1 == 0 && jump > 0
    kangaroo_1 = x1 + (v1 * jump)
    kangaroo_2 = x2 + (v2 * jump)
    # check if the kangaroos end up at the same location at the same time
    if x1 + (v1 * jump) == x2 + (v2 * jump)
      'YES'
    else
      'NO'
    end
  else
    'NO'
  end
end
