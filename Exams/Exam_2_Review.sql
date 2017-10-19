-- Christan de Luna
-- Exam 1 Review

-- p1
SELECT bldg_code,
       room,
       term_desc,
       call_id,
       sec_num,
       c_sec_day,
       TO_CHAR(c_sec_time, 'HH:MI a.m.') "TIME"
FROM location l
JOIN course_section cs
    ON l.loc_id = cs.loc_id
JOIN term t
    ON cs.term_id = t.term_id
JOIN course c 
    ON cs.course_id = c.course_id
ORDER BY 1, 2;

-- p2
SELECT s_first "FIRST",
       s_last "LAST",
       TO_CHAR(s_dob, 'MM/DD/YYYY') "BIRTHDATE"
FROM student
WHERE s_class IN
    (SELECT s_class
     FROM student
     WHERE s_first = 'Sarah')
AND s_first != 'Sarah';

-- p3
SELECT s_last || ', ' || s_first "Student",
       c_sec_id "Section",
       NVL2(grade, '**', '--') "Grade report"
FROM enrollment e
JOIN student s
    ON e.s_id = s.s_id
ORDER BY 1;

-- p4
SELECT DISTINCT s.s_id,
                s.s_last || ', ' || s.s_first "Student Name"
FROM student s
JOIN enrollment e
    ON s.s_id = e.s_id
WHERE e.c_sec_id IN
    (SELECT e.c_sec_id
     FROM course_section cs
     JOIN enrollment e
        ON cs.c_sec_id = e.c_sec_id
     JOIN student s
        ON s.s_id = e.s_id
     WHERE s.s_id = 2)
AND s.s_id != 2
ORDER BY 1;

-- p5
SELECT COUNT(last_name) "High Earners"
FROM employees
WHERE salary >
    (SELECT AVG(salary)
     FROM employees);

-- p6-1
SELECT animal_name "NAME",
       animal_age || ' years' "AGE",
       animal_weight || ' lbs' "WEIGHT",
       (CASE WHEN animal_weight BETWEEN 0 AND 15 THEN 'CITY'
             WHEN animal_weight BETWEEN 16 AND 40 THEN 'SUBURB'
             ELSE 'RURAL'
        END) "Ideal Residence"
FROM animal
ORDER BY animal_weight;

-- p6-3
SELECT animal_name,
       animal_weight,
       animal_id,
       (CASE WHEN animal_id BETWEEN 0 AND 10 THEN TO_CHAR((animal_weight / 4.5 * animal_id), '99,99.99')
             WHEN animal_id BETWEEN 11 AND 5 THEN TO_CHAR((animal_weight / 5 * animal_id), '99,99.99')
             WHEN animal_id BETWEEN 16 AND 83 THEN TO_CHAR((animal_weight / 5.5 * animal_id), '99,99.99')
        END) "Pounds of Food Per Week"
FROM animal
ORDER BY 4;

-- p7
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
