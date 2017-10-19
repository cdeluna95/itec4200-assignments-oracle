-- Christan de Luna
-- 8/24/2017

-- ch2p1
SELECT DISTINCT s_class AS "Classification"
FROM student;

-- ch2p2
SELECT employee_id AS "Emp#",
       last_name || ', ' || first_name AS "Employee",
       job_id AS "Job Title",
       hire_date AS "Date Hired"
FROM employees;

-- ch2p3
SELECT f_first || ' ' || 
       f_mi || '. ' ||
       f_last || ': ' ||
       f_phone
       AS "Faculty Name: Phone"
FROM faculty;

-- ch2p4
SELECT last_name || q'+'s full salary is: +' AS "Employee",
       (salary + NVL(commission_pct * 1000, 0)) AS "Full Salary"
FROM employees;

-- ch2p5
SELECT employee_id AS "Employee ID",
       start_date AS "Start Date",
       end_date AS "End_date",
       end_date - start_date AS "Days of employment"
FROM job_history
ORDER BY "Days of employment";

-- ch2p6
-- Output a query that creatively describes the animal's name, age, weight, sex, and arrival date, which is sorted by the date of the animal's arrival.
SELECT animal_name || ', who is a cute ' ||
       animal_age || '-year old ' ||
       animal_sex || ', weighs ' ||
       animal_weight || ' lbs, and will arrive at your home at ' ||
       arrival_date || '!'
       AS "Cute description of animal"
FROM animal
ORDER BY arrival_date;
