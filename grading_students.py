# https://www.hackerrank.com/challenges/grading/problem

def gradingStudents(grades):
    diff = lambda x: 5 - (x % 5)
    g = lambda x: x + 5 - (x % 5)
    rounded_grades = []

    for grade in grades:
        if grade < 38:
            rounded_grades.append(grade)
        elif diff(grade) < 3:
            rounded_grades.append(g(grade))
        elif diff(grade) >= 3:
            rounded_grades.append(grade)

    return rounded_grades
