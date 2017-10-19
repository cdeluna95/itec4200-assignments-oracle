-- Christan de Luna
-- 9/7/2017

-- ch4p1
SELECT SYSDATE AS "Date"
FROM DUAL;

-- ch4p2
SELECT employee_id,
       last_name,
       salary,
       salary + (salary * 15.5 / 100) AS "New Salary"
FROM employees
WHERE salary IS NOT NULL;

-- ch4p3
SELECT employee_id,
       last_name,
       salary,
       salary + (salary * 15.5 / 100) AS "New Salary",
       (salary + (salary * 15.5 / 100)) - salary AS "Increase"
FROM employees
WHERE salary IS NOT NULL; 

-- ch4p4
SELECT INITCAP(last_name) AS "Name",
       LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE 'J%'
      OR last_name LIKE 'A%'
      OR last_name LIKE 'M%'
ORDER BY 1;

-- ch4p5
SELECT INITCAP(last_name) AS "Name",
       LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE UPPER('&start_letter%')
ORDER BY 1;

-- ch4p6
SELECT last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS_WORKED"
FROM employees
ORDER BY 2;

-- ch4p7
SELECT last_name,
       LPAD(salary, 15, '$') AS "SALARY"
FROM employees;

-- ch4p8
SELECT RPAD(last_name, 8) || ' ' ||
       RPAD(' ', salary / 1000 + 1, '*')
       AS "EMPLOYEES_AND_THEIR_SALARIES"
FROM employees
ORDER BY salary DESC;

-- ch4p9
SELECT last_name,
       TRUNC((SYSDATE - hire_date) / 7) AS "TENURE"
FROM employees
WHERE department_id = 90
ORDER BY 2 DESC;

-- ch4p10
-- Write a query that displays:
---- the animal's name
---- the month and year formatted into a real date
---- and the number of years since their arrival date
-- with appropriate aliases, making sure they're ordered by the date of the animal's arrival.
SELECT animal_name AS "Animal Name",
       TO_CHAR(arrival_date, 'Month YYYY') AS "Month and Year of Arrival",
       ROUND((SYSDATE - arrival_date) / 365) AS "Number of Years Since Arrival"
FROM animal
ORDER BY arrival_date;
