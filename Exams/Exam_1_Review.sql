-- Christan de Luna
-- Exam 1 Review

-- p1
SELECT employee_id AS "Employee ID",
       last_name AS "Last Name",
       salary AS "Current Salary",
       ROUND(salary + (salary * 15 / 100)) AS "New Salary",
       ROUND(salary + (salary * 15 / 100)) - salary AS "Increase"
FROM employees
WHERE ROUND(salary + (salary * 15 / 100)) BETWEEN &sal_low AND &sal_high
ORDER by 4 DESC;

-- p2
SELECT s_last || ', ' || s_first || LPAD(ROUND((SYSDATE - s_dob) / 365), 22, '*') AS "Student Name and Age",
       s_pin AS "Pin",
       REVERSE(TO_CHAR(s_pin)) AS "Coded Pin"
FROM student
ORDER BY s_last;

-- p3
SELECT s_id AS "Student Number",
       c_sec_id AS "Section",
       NVL(grade, '--') AS "Grade"
FROM enrollment
WHERE grade IS NULL OR grade != 'C'
ORDER BY 3;

-- p4
SELECT last_name || ', ' || first_name AS "Employee",
       hire_date AS "Date Hired",
       NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Wednesday') AS "6 Month Review"
FROM employees
WHERE hire_date >= '01-JAN-00'
ORDER BY 3;

-- p5
SELECT c_sec_id AS "SECTION ID",
       sec_num AS "NUMBER",
       c_sec_day AS "DAYS",
       TO_CHAR(c_sec_time, 'HH:MI a.m.') AS "TIME"
FROM course_section
WHERE c_sec_day LIKE '%M%'
ORDER BY c_sec_day, c_sec_time;
