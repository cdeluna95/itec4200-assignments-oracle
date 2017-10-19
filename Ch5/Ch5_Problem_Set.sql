-- Christan de Luna
-- 9/19/2017

-- ch5p1
SELECT last_name || ' earns ' ||
       TO_CHAR(salary, 'fm$99G000D00') || ' monthly but wants ' ||
       TO_CHAR(salary * 3, 'fm$99G000D00') AS "Dream Salaries"
FROM employees;

-- ch5p2
SELECT last_name,
       hire_date,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday'), 'fmDay, "the" Ddspth "of" Month, YYYY')
        AS "Review"
FROM employees;

-- ch5p3
SELECT last_name,
       hire_date,
       TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'D');

-- ch5p4
SELECT last_name,
       NVL(TO_CHAR(commission_pct), 'No Commission') AS "COMM"
FROM employees;

-- ch5p5
SELECT job_id,
    DECODE(job_id, 'AD_PRES', 'A',
                   'ST_MAN', 'B',
                   'IT_PROG', 'C',
                   'SA_REP', 'D',
                   'ST_CLERK', 'E',
           0)
    AS "GRADE"
FROM employees
ORDER BY 1;

-- ch5p6
SELECT job_id,
    CASE job_id WHEN 'AD_PRES' THEN 'A'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'SA_REP' THEN 'D'
                WHEN 'ST_CLERK' THEN 'E'
    ELSE '0' END AS "GRADE"
FROM employees
ORDER BY 1;

-- ch5p7
SELECT bldg_code AS "Building",
       room AS "Room",
    (CASE WHEN capacity >= 100 THEN 'Large'
          WHEN capacity BETWEEN 30 AND 99 THEN 'Medium'
          ELSE 'Small'
     END) AS "Capacity"
FROM location;

-- ch5p8
SELECT call_id, course_name,
    DECODE(substr(call_id, -3, 1), '1', 'Freshman',
                                   '2', 'Sophomore',
                                   '3', 'Junior',
                                   '4', 'Senior',
           'Invalid Level')
    AS "LEVEL"
FROM course
ORDER BY 3, 1;

-- ch5p9
-- First, let's pretend the animal's arrival_date is their date of birth,
-- so let's write a special query that displays:
---- the animal's name
---- the animal's arrival date in a readable month and day format
---- and a series of conditional statements that if it's between two dates, it equals the appropriate sign
-- with appropriate aliases, making sure they're ordered by their signs.
SELECT animal_name AS "Name",
       TO_CHAR(arrival_date, 'fmMonth, DD') AS "Date",
    (CASE WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0120' AND '0218' THEN 'Aquarius'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0219' AND '0320' THEN 'Pisces'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0321' AND '0419' THEN 'Aries'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0420' AND '0520' THEN 'Taurus'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0521' AND '0620' THEN 'Gemini'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0621' AND '0722' THEN 'Cancer'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0723' AND '0822' THEN 'Leo'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0823' AND '0922' THEN 'Virgo'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '0923' AND '1022' THEN 'Libra'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '1023' AND '1121' THEN 'Scorpio'
          WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '1122' AND '1221' THEN 'Sagittarius'
          ELSE 'Capricorn' -- WHEN TO_CHAR(arrival_date, 'MMDD') BETWEEN '1222' AND '0119' THEN 'Capricorn'
     END) AS "Astrology Sign"
FROM animal
ORDER BY 3;
