-- sqlp1
SELECT animal_name AS "Animal Name",
       animal_age AS "Animal Age",
       &&col_name AS "&&col_alias"
FROM animal
WHERE &col_name = UPPER('&val')
ORDER BY &col_name, animal_age;
UNDEFINE col_name
UNDEFINE col_alias

-- sqlp2
SELECT last_name || ', ' ||
        first_name || ' ' ||
        ROUND((MONTHS_BETWEEN(SYSDATE, hire_date) / 12)) AS "Employee employed",
       salary AS "Base",
       salary + (salary * NVL(commission_pct, 12)) AS "Annual Salary",
       TO_CHAR(hire_date, 'Month DD, YYYY') AS "Employment Date",
       ROUND((SYSDATE - hire_date) / 365) AS "Years"
FROM employees
WHERE ROUND((SYSDATE - hire_date) / 365) >= 25;
ORDER BY 1;