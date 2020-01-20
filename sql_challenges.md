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
