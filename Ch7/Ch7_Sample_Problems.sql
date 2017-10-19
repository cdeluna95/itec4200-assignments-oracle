SELECT department_name, postal_code, city, state_province
FROM departments NATURAL JOIN locations;

SELECT d.department_name, l.postal_code, l.city, location_id
FROM departments d NATURAL JOIN locations l;

SELECT d.department_name, l.postal_code, l.city, location_id
FROM departments d JOIN locations l
USING(location_id);

SELECT e.last_name, e.salary, jg.grade_level
FROM employees e JOIN job_grades jg
ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal
ORDER BY 3;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.last_name, e.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

SELECT last_name, department_name
FROM employees
CROSS JOIN departments;
