-- Christan de Luna
-- 9/26/2017

-- ch6p1
SELECT job_id "Job",
       TO_CHAR(MAX(salary), '$999,999') "Maximum",
       TO_CHAR(MIN(salary), '$999,999') "Minimum",
       TO_CHAR(SUM(salary), '$999,999') "Total",
       COUNT(job_id) "Number"
FROM employees
GROUP BY job_id
ORDER BY 1;

-- ch6p2
SELECT department_id "Department",
       MAX(salary) - MIN(salary) "Difference"
FROM employees
GROUP BY department_id
HAVING MAX(salary) - MIN(salary) != 0
ORDER BY 1;

-- ch6p3
SELECT manager_id "Manager",
       MIN(salary) "Small Sal"
FROM employees
GROUP BY manager_id
HAVING manager_id IS NOT NULL OR MIN(salary) < 1000
ORDER BY 2 DESC;

-- ch6p4
SELECT c_sec_day "Days",
       COUNT(c_sec_day) "Number of classes"
FROM course_section
GROUP BY c_sec_day;

-- ch6p5
SELECT c_sec_day "Days",
       TO_CHAR(c_sec_time, 'HH:MI a.m.') "Time",
       COUNT(c_sec_day) "Number of classes"
FROM course_section
GROUP BY c_sec_day, c_sec_time
ORDER BY 1;

-- ch6p6
SELECT (CASE
            WHEN c_sec_day = 'MTWRF' THEN 'Every day of the week'
            WHEN c_sec_day = 'MWF' THEN 'Mon - Wed - Fri'
            ELSE 'Tues - Thurs'
        END) AS "Days",
       TO_CHAR(c_sec_time, 'fmHH:fmMI a.m.') "Time",
       COUNT(c_sec_day) "Number of classes"
FROM course_section
GROUP BY c_sec_day, c_sec_time
ORDER BY 1;

-- ch6p7
-- Let's write a simple query that displays:
---- the animal's sex
---- the number of males and females
-- with appropriate aliases and meaningful sex names.
-- Let's find out how many they male and female animals there are in the shelter!
SELECT (CASE
            WHEN animal_sex = 'M' THEN 'Boys'
            WHEN animal_sex = 'F' THEN 'Girls'
            ELSE 'Other'
        END) AS "Sex",
       COUNT(animal_age) "Number of sexes"
FROM animal
GROUP BY animal_sex;
