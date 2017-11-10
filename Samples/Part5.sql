COL job_id HEADING 'Job|Category' FORMAT A15
COL "ename" HEADING 'Employee|Name' FORMAT A20
COL salary HEADING 'Salary' FORMAT $99,999.99
-- SQL statement
SELECT job_id, last_name || ' ' || first_name AS "ename", salary
FROM employees
ORDER BY 1, 2;
