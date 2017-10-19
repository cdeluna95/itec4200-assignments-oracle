-- Christan de Luna
-- 10/5/2017

-- ch8p1
SELECT s_first || ' ' || s_last "Enrolled Student"
FROM student
WHERE s_id
    IN (SELECT s_id FROM enrollment)
ORDER BY s_id;

-- ch8p2
SELECT employee_id,
       last_name,
       salary
FROM employees
WHERE salary >
    (SELECT AVG(salary)
     FROM employees) AND
     department_id IN
        (SELECT department_id
         FROM departments
         WHERE location_id IN
            (SELECT location_id
             FROM locations
             WHERE city LIKE '%San Francisco'))
ORDER BY 3 DESC;

-- ch8p3
SELECT last_name,
       department_id,
       salary
FROM employees main
WHERE salary =
    (SELECT AVG(salary)
     FROM employees sub
     WHERE main.department_id = sub.department_id)
ORDER BY 1;

-- ch8p4
SELECT last_name,
       job_id,
       salary "TOTAL SAL"
FROM employees
WHERE job_id = 'SA_REP' AND job_id > ANY
    (SELECT job_id
     FROM employees
     WHERE job_id LIKE '%MAN' OR job_id LIKE '%MGR')
ORDER BY 3;

-- ch8p5
SELECT last_name,
       hire_date
FROM employees
WHERE department_id IN
    (SELECT department_id
     FROM employees
     WHERE UPPER(last_name) = UPPER('&enter_name')) AND
        UPPER(last_name) != UPPER('&enter_name')
ORDER BY 1;

-- ch8p6
SELECT department_id,
       last_name,
       job_id
FROM employees
WHERE department_id IN
    (SELECT department_id
     FROM departments
     WHERE department_name = 'Executive');
     
-- ch8p7
-- Let's write a query that displays:
---- the animal's name
---- the animal's age
-- with appropriate aliases, where their arrival date is not within the year of 2008, ordered by their name.
SELECT animal_name "Name",
       animal_age "Age"
FROM animal
WHERE arrival_date NOT IN
    (SELECT arrival_date
     FROM animal
     WHERE TO_CHAR(arrival_date, 'YYYY') = '2008')
ORDER BY 1;
