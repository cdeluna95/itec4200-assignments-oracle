SELECT MAX(last_name), MIN(first_name)
FROM employees;

SELECT COUNT(employee_id)
FROM employees;

SELECT department_id, job_id, TO_CHAR(SUM(salary), '$9999,999') "Average Salary"
FROM employees
GROUP BY department_id, job_id
HAVING SUM(salary) >= 50000
ORDER BY 1, 2;

SELECT job_id, TO_CHAR(SUM(salary), '$999,999') "Payroll"
FROM employees
WHERE job_id != 'SA_MAN'
GROUP BY job_id
HAVING SUM(salary) > 5000
ORDER BY 2;

SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) > 1;
