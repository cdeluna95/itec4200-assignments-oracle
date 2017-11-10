-- Christan de Luna
-- 11/04/2017

-- ch9p1
SELECT department_id
FROM employees
MINUS
SELECT department_id
FROM employees
WHERE job_id = 'ST_CLERK';

-- ch9p2
SELECT country_id, country_name
FROM countries
MINUS
SELECT c.country_id, c.country_name
FROM countries c
JOIN locations l
    ON c.country_id = l.country_id
JOIN departments d
    ON d.location_id = l.location_id;
    
-- ch9p3
SELECT DISTINCT job_id, department_id
FROM employees
WHERE department_id = 10
UNION ALL
SELECT DISTINCT job_id, department_id
FROM employees
WHERE department_id = 50
UNION ALL
SELECT DISTINCT job_id, department_id
FROM employees
WHERE department_id = 20;

-- ch9p4
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- ch9p5
SELECT last_name, department_id, TO_CHAR(NULL)
FROM employees
UNION
SELECT TO_CHAR(NULL), department_id, department_name
FROM departments;

-- ch9p6
-- Find all animals whose breed_id values are common from both tables using set operators.
SELECT animal_id "Animal ID",
       breed_id "Breed ID",
       animal_name "Name"
FROM animal
WHERE breed_id IN 
    (SELECT breed_id
     FROM animal
     INTERSECT
     SELECT breed_id
     FROM breed)
ORDER BY 1;
