-- Christan de Luna
-- 10/4/2017

-- ch7p1
SELECT DISTINCT e.job_id,
       d.location_id,
       l.state_province
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id
ORDER BY 1;

-- ch7p2
SELECT e.last_name "Employee",
       e.job_id "Job Title",
       d.department_name "Department"
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE job_id = 'IT_PROG'
ORDER BY 1;

-- ch7p3
SELECT DISTINCT j.grade_level "Grade",
       d.department_name "Department",
       TO_CHAR(e.salary, '$99,999') "Salary"
FROM employees e
JOIN job_grades j
    ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
JOIN departments d
    ON e.department_id = d.department_id
WHERE department_name LIKE 'S%'
ORDER BY 1, 2, 3 DESC;

-- ch7p4
SELECT DISTINCT m.first_name || ' ' || m.last_name "Upper Management",
       (CASE j.job_id WHEN 'AD_VP' THEN 'VICE PRESIDENT'
                    WHEN 'AD_PRES' THEN 'PRESIDENT'
                    ELSE 'OTHER'
        END) "Job Title"
FROM employees m
JOIN employees j
    ON m.job_id = j.job_id
WHERE j.job_id = 'AD_VP' OR j.job_id = 'AD_PRES'
ORDER BY 1;

-- ch7p5
SELECT l.city "City",
       c.country_name "Country"
FROM locations l
RIGHT OUTER JOIN countries c
    ON l.country_id = c.country_id;

-- ch7p6
SELECT f.f_last "FACULTY",
       c.sec_num "Section",
       c.loc_id "LOC ID",
       l.bldg_code "BUILDING"
FROM faculty f
JOIN course_section c
    ON f.f_id = c.f_id
JOIN location l
    ON c.loc_id = l.loc_id
WHERE bldg_code = 'BUS'
ORDER BY 1, 2, 3;

-- ch7p7
SELECT e.last_name "Employee",
       TO_CHAR(e.hire_date, 'MM/DD/YY') "Emp Hired",
       m.last_name "Manager",
       TO_CHAR(m.hire_date, 'MM/DD/YY') "Manager Hired"
FROM employees e
JOIN employees m
    ON (m.employee_id = e.manager_id)
WHERE TO_CHAR(e.hire_date, 'YYYY') = '2000'
    AND TO_CHAR(m.hire_date, 'YYYY') = '2000'
    AND e.hire_date < m.hire_date;
      
-- ch8p8
-- Let's write a query that displays:
---- the animal's name
---- the animal's breed
-- with appropriate aliases, allowing the user to input a number based on their age, ordered by their name and breed.
SELECT a.animal_name "Animal Name",
       b.breed_name "Breed"
FROM animal a
JOIN breed b
    ON a.breed_id = b.breed_id
WHERE animal_age = &val;
ORDER BY 1, 2;

-- Additional problems

-- p1
SELECT a.animal_name "Animal Name",
       b.breed_name "Breed",
       v.vol_last "Volunteer Name",
       v.vol_phone "Phone"
FROM animal a
JOIN volunteer v
ON a.vol_id = v.vol_id
JOIN breed b
ON b.breed_id = a.breed_id
ORDER by animal_name;

-- p2
SELECT e.last_name,
       e.hire_date,
       m.last_name,
       m.hire_date
FROM employees e JOIN employees m
ON (m.employee_id = e.manager_id)
WHERE TO_CHAR(e.hire_date, 'YYYY') = '2000'
      AND TO_CHAR(m.hire_date, 'YYYY') = '2000'
      AND e.hire_date < m.hire_date;
