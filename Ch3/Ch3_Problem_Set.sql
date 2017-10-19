-- Christan de Luna
-- 8/29/2017

-- ch3p1
SELECT last_name AS "Employee",
       salary AS "Salary"
FROM employees
WHERE salary NOT BETWEEN 2000 AND 9500
ORDER BY salary DESC;

-- ch3p2
SELECT s_last AS "Student",
       s_dob AS "Date of Birth" 
FROM student
WHERE s_dob BETWEEN '01-MAY-85' AND '30-SEP-85'
ORDER BY 1;

-- ch3p3
SELECT bldg_code, room, capacity
FROM location
WHERE capacity > 30 AND room LIKE '1%'
ORDER BY 3;

-- ch3p4
SELECT last_name AS "Name",
       job_id AS "Job Title"
FROM employees
WHERE job_id LIKE '%_M%' AND commission_pct IS NULL
ORDER BY 1;

-- ch3p5
SELECT call_id AS "Call ID",
       course_name AS "Course Name"
FROM course
WHERE course_name LIKE '%C++'
ORDER BY 1;

-- ch3p6
SELECT s_first || ' ' || s_mi || '. ' || s_last AS "Full Name",
       s_dob AS "Date of Birth",
       ROUND((MONTHS_BETWEEN(SYSDATE, s_dob) / 12), 2) AS "Age"
FROM student
WHERE s_dob LIKE '%86'
ORDER BY 2;

-- ch3p7
SELECT last_name || ', ' || job_id AS "Employees",
       salary AS "Salary"
FROM employees
WHERE salary BETWEEN &sal_first AND &sal_second
ORDER BY last_name;

-- ch3p8
SET VERIFY ON
SELECT department_id, &&col_name
FROM departments
WHERE department_id > &dep_id
ORDER BY &col_name;
UNDEFINE col_name
UNDEFINE col_alias

-- ch3p9
-- Write a script that:
---- displays the arrival date,
---- concatenates information regarding the animal's name, sex, and weight,
---- and enables the user to input a certain column name—ideally the animal_id or animal_age
-- from the animal table and order it by that same column name.
SET VERIFY ON
SELECT arrival_date AS "Arrival Date",
       animal_name || ', ' || animal_sex || ', ' || animal_weight || ' lbs' AS "Animal Information",
       &col_animal_name AS "&col_animal_alias" -- Ideally, have user search for animal_id or animal_age
FROM animal
ORDER BY &col_animal_name; -- Also ideally ordered by animal_id or animal_age
UNDEFINE col_anim_name
UNDEFINE col_anim_alias
