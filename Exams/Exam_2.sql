-- sqlp1
SELECT first_name || ' ' || last_name "Employee Name",
       TO_CHAR(salary, '$999,999') "Salary",
       TO_CHAR(hire_date, 'fmMonth Ddth, YYYY') "Hire Date",
       (CASE
          WHEN salary < 5000 THEN 'Level 1'
          WHEN salary BETWEEN 5000 AND 10000 THEN 'Level 2'
          ELSE 'Level 3'
        END) AS "Level",
       city || ', ' || state_province "Location"
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id
WHERE TO_CHAR(hire_date, 'YYYY')
    IN (1980, 1984, 1988, 1992, 1996, 2000, 2004)
    -- Terrible method for databases in production, but this will do for now
ORDER BY hire_date;

-- sqlp2
SELECT DISTINCT s_last "Student",
       (CASE
            WHEN s_last = 'Miller' AND f_last = 'Cox' THEN '1'
            WHEN s_last = 'Mobley' AND f_last = 'Blanchard' THEN '2'
            ELSE '0'
        END) "8 in Pin",
        -- When you run out of time :(
       f_first || ' ' || f_last "Faculty Advisor"
FROM student s
JOIN faculty f
    ON s.f_id = f.f_id
WHERE s_last NOT IN
    ('Black', 'Connoly', 'Umato') -- Also gross
ORDER BY 1;
