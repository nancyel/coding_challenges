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
**Prompt**: 

**Source**:

```sql
```


15.
**Prompt**:

**Source**:

```sql
```


16.
**Prompt**:

**Source**:

```sql
```
