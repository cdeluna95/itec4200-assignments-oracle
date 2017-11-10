-- Sample Report
-- Created in class

COL job title HEADING 'Job|Category' FORMAT A15
COL "ename" HEADING 'Employee|Name' FORMAT A20
COL salary HEADING 'Salary' FORMAT $99,999.99

SET PAGESIZE 22
SET LINESIZE 70
SET FEEDBACK OFF
--SET PAUSE ON
TTITLE ‘Employee|Report’
BTITLE ‘Confidential’
BREAK ON job_id SKIP 1

-- SQL statement
SELECT job_id, last_name || ' ' || first_name AS "ename", salary
FROM employees
ORDER BY 1, 2;

SET FEEDBACK ON
SET PAGESIZE 24
SET LINESIZE 80
--SET PAUSE OFF
CLEAR COL
CLEAR BREAKS
TTITLE OFF
BTITLE OFF