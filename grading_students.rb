# https://www.hackerrank.com/challenges/grading/problem

def gradingStudents(grades)
  grades.map do |n|
    # diff between n and the next multiple of 5
    diff = 5 - (n % 5)
    if n < 38
      n
    elsif diff < 3
      n += diff
    elsif diff >= 3
      n
    end
  end
end
