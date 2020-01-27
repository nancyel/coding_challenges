1.

**Prompt**: Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-3/problem

```sql
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2)=0;
```


2.

**Prompt**: Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N - N' from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-4/problem

```sql
SELECT COUNT(CITY)-COUNT(DISTINCT CITY) FROM STATION;
```

3.

**Prompt**: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-5/problem?h_r=next-challenge&h_v=zen

```sql
SELECT CITY, CHAR_LENGTH(CITY) FROM STATION ORDER BY CHAR_LENGTH(CITY), CITY LIMIT 1;
SELECT CITY, CHAR_LENGTH(CITY) FROM STATION ORDER BY CHAR_LENGTH(CITY) DESC, CITY LIMIT 1;

```


4.
**Prompt**: Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-6/problem?h_r=next-challenge&h_v=zen

```sql
SELECT DISTINCT CITY FROM STATION
    WHERE CITY LIKE 'a%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'i%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%';

-- OR
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiou]';
```


5.
**Prompt**: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-7/problem?h_r=next-challenge&h_v=zen

```sql
-- SUBSTR(string, start, length)

SELECT DISTINCT CITY FROM STATION
    WHERE LOWER(SUBSTR(CITY, LENGTH(CITY), LENGTH(CITY))) IN ('a', 'e', 'i', 'o', 'u');
```


6.
**Prompt**: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-8/problem

```sql
SELECT DISTINCT CITY FROM STATION
    WHERE (CITY LIKE 'a%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'i%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%')
    AND (CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u');
```


7.
**Prompt**: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-9/problem

```sql
SELECT DISTINCT CITY FROM STATION
    WHERE NOT CITY RLIKE '^[aeiouAEIOU].*$';
```
> RLIKE: Returns true if the subject matches the specified pattern. Similar to LIKE, but RLIKE supports more complex matching conditions.
> .* means "0 or more of any character". A "dot" indicates any character; * means "0 or more instances of the preceding regex token"



8.
**Prompt**: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-10/problem

```sql
SELECT DISTINCT CITY FROM STATION
    WHERE NOT CITY RLIKE '[aeiou]$';
```


9.
**Prompt**: Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

**Source**: https://www.hackerrank.com/challenges/more-than-75-marks/problem

```sql
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY SUBSTR(NAME, LENGTH(NAME)-2, 3), ID;
```


10.
**Prompt**: Generate the following two result sets:

- Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
- Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: `There are a total of [occupation_count] [occupation]s.` where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.


**Source**: https://www.hackerrank.com/challenges/the-pads/problem

```sql
SELECT CONCAT(NAME, '(', LEFT(OCCUPATION, 1), ')') FROM OCCUPATIONS ORDER BY NAME;
SELECT CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', LOWER(OCCUPATION), 's.') FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION), OCCUPATION;
```

11.
**Prompt**: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

**Source**: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

```sql
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM CITY JOIN COUNTRY WHERE COUNTRYCODE = COUNTRY.CODE GROUP BY COUNTRY.CONTINENT;
```


12.
**Prompt**: Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order. Write a query to help Eve.

**Source**: https://www.hackerrank.com/challenges/the-report/problem

```sql
SELECT IF(Grade < 8, NULL, Name), Grade, Marks FROM Students
    JOIN Grades WHERE (Marks BETWEEN Min_Mark AND Max_Mark)
    ORDER BY Grade DESC, Name, Marks;
```
> IF(arg1, arg2, arg3) = CASE WHEN arg1 THEN arg2 ELSE arg3 END


13.
**Prompt**: Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

**Source**: https://www.hackerrank.com/challenges/full-score/problem

```sql
SELECT h.hacker_id, h.name
    FROM Submissions as s
    JOIN Hackers as h
        ON s.hacker_id = h.hacker_id
    JOIN Challenges as c
        ON s.challenge_id = c.challenge_id
    JOIN Difficulty as d
        ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY h.hacker_id, h.name
    HAVING COUNT(*)>1
    ORDER BY COUNT(*) DESC, hacker_id;
```
> Join 3 tables based on matching conditions; filter rows by score = full score; further filter by count > 1; format ordering as specified


14.
**Prompt**: Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table: Equilateral, Isosceles, Scalene, Not a Triangle.

**Source**: https://www.hackerrank.com/challenges/what-type-of-triangle/problem

```sql
SELECT IF(A+B>C AND B+C>A AND C+A>B, IF(A=B AND B=C, 'Equilateral', IF(A=B OR B=C OR C=A, 'Isosceles', 'Scalene')), 'Not A Triangle') FROM TRIANGLES;
```
> Nested IF(condition, output if true, otherwise) statements


15.
**Prompt**: You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N. Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

**Source**: https://www.hackerrank.com/challenges/binary-search-tree-1/problem

```sql
SELECT N, IF(P IS NULL, 'Root', IF(BST.N IN (SELECT P FROM BST), 'Inner', 'Leaf')) FROM BST ORDER BY N;
```
> Find root node first; then check if values in N appear in values in P. Note the syntax in second IF statement.



16.
**Prompt**: Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

**Source**: https://www.hackerrank.com/challenges/the-blunder/problem

```sql
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary, '0', ''))) FROM EMPLOYEES;
```
> REPLACE(amount, from, to)


17.
**Prompt**: Amber's conglomerate corporation just acquired some new companies. write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

**Source**: https://www.hackerrank.com/challenges/the-company/problem

```sql
SELECT c.company_code, c.founder, COUNT(DISTINCT lm.lead_manager_code), COUNT(DISTINCT sm.senior_manager_code), COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code) FROM Company c
    JOIN Lead_Manager lm ON c.company_code = lm.company_code
    JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
    JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
    JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
```

18.
**Prompt**: We define an employee's total earnings to be their monthly <salary * months> worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

**Source**: https://www.hackerrank.com/challenges/earnings-of-employees/problem

```sql
SELECT salary*months as earnings, COUNT(*)
    FROM Employee
    GROUP BY earnings
    ORDER BY earnings DESC
    LIMIT 1;
```


19.
**Prompt**: Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-18/problem

```sql
SELECT ROUND((ABS(MIN(LAT_N)-MAX(LAT_N)) + ABS(MIN(LONG_W)-MAX(LONG_W))), 4) FROM STATION;
```
> Manhattan distance between two points (x1, y1) and (x2, y2): |x1 - x2| + |y1 - y2|
> Find the max and min value of each column; find the difference btw max and min; then round the result to 4 dec places



20.
**Prompt**: Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION. Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-19/problem

```sql
SELECT ROUND((SQRT(POWER((MIN(LAT_N)-MAX(LAT_N)), 2) + POWER((MIN(LONG_W)-MAX(LONG_W)), 2))), 4) FROM STATION;
```
> Euclidean distance: √(x1 - x2)² + (y1 - y2)²


21.
**Prompt**: A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

**Source**: https://www.hackerrank.com/challenges/weather-observation-station-20/problem

```sql
SET @count := (SELECT COUNT(1) from STATION);
SET @row_id := 0;

SELECT ROUND(AVG(LAT_N), 4) AS median FROM (SELECT LAT_N FROM STATION ORDER BY LAT_N) AS LAT_N
    WHERE (SELECT @row_id := @row_id + 1) BETWEEN @count / 2.0 AND @count / 2.0 + 1;
```
<!--
1. Set two variables to count # of total rows and the first index value
2. Write a subquery (with an alias) that sorts LAT_N column in ascending order
3. Increment counter for every row using where clause
4. Find median value by averaging the two values (if row total = even) or the middle one (if row total = odd)
5. Round to 4 dec places
-->


22.
**Prompt**: Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

**Source**: https://www.hackerrank.com/challenges/challenges/problem

```sql
SELECT h.hacker_id, h.name, count(c.challenge_id) as challenges_created
    FROM Hackers AS h JOIN Challenges AS c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
    HAVING challenges_created = (SELECT COUNT(c1.challenge_id) as c_max
           FROM Challenges AS c1
           GROUP BY c1.hacker_id
           ORDER BY c_max DESC
           LIMIT 1) OR

    challenges_created NOT IN (SELECT COUNT(c2.challenge_id)
                FROM Challenges AS c2
                GROUP BY c2.hacker_id
                HAVING c2.hacker_id != h.hacker_id
               )

    ORDER BY challenges_created DESC, h.hacker_id;
```
> Use HAVING clause to filter the challenges_created column by 2 criteria: either the value is the maximum # of total challenges, or the value is unique.
