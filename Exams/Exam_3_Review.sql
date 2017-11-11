-- Christan de Luna
-- 11/10/2017

-- p1
UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 206),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 206)
WHERE employee_id = 110;

COMMIT;

-- p2
SELECT employee_id, last_name
FROM employees
MINUS
SELECT employee_id, last_name
FROM job_history
NATURAL JOIN employees
NATURAL JOIN job_history;

-- p3
INSERT INTO animal
    VALUES (2, 'Airdale Terrier', 'dog');
    
INSERT INTO animal
    VALUES (3, 'Akita', 'dog');
    
INSERT INTO animal
    VALUES (4, 'American Eskimo', 'dog');
    
INSERT INTO animal
    VALUES (5, 'Pitbull', 'dog');

INSERT INTO animal
    VALUES (6, 'Australian Shepard', 'dog');

INSERT INTO animal
    VALUES (8, 'Bassett Hound', 'dog');
    
INSERT INTO animal
    VALUES (10, 'Beagle', 'dog');
    
INSERT INTO animal
    VALUES (12, 'Collie', 'dog');
    
INSERT INTO animal
    VALUES (14, 'Dalmation', 'dog');

INSERT INTO animal
    VALUES (15, 'Siamese', 'dog');
    
INSERT INTO animal
    VALUES (18, 'Chartreaux', 'dog');

SELECT *
FROM breed;

-- p4
INSERT INTO volunteer
    VALUES (1, 'Mimi', 'Jannick', '810 Shelby Dr.', 'Memphis', 'TN', 38103, 9015295520, '12-DEC-89');

INSERT INTO volunteer
    VALUES (13, 'Jim', 'Maurice', '2516 Harbor Isle', 'Memphis', 'TN', 38103, 9015298534, '30-JAN-72');
    
INSERT INTO volunteer
    VALUES (18, 'Catherine', 'Johnson', '765 Moss Terrace', 'Memphis', 'TN', 38112, 9015258123, '23-FEB-56');

INSERT INTO volunteer
    VALUES (121, 'Abraham', 'Clark', '3829 Union St.', 'Memphis', 'TN', 38103, 9015293444, '07-SEP-69');

SELECT *
FROM volunteer;


INSERT INTO animal
    VALUES (1, 'Precious', 2, 13, 'F', '28-SEP-07');
    
INSERT INTO animal
    VALUES (2, 'Rocky', 4, 22, 'M', '12-DEC-07');
    
INSERT INTO animal
    VALUES (3, 'Daisy', 6, 18, 'F', '02-JAN-08');

SELECT *
FROM animal;

SELECT animal_name,
       vol_first || ' ' || vol_last,
       breed_name
FROM animal a 
JOIN volunteer v
    ON a.vol_id = v.vol_id
JOIN breed b
    ON a.breed_id = b.breed_id;
    
-- p5
SELECT DISTINCT s_id "Number",
                s_first || ' ' || s_last "Name"
FROM enrollment
NATURAL JOIN student
WHERE grade = 'A' OR grade = 'B'
UNION
SELECT employee_id,
       first_name || ' ' || last_name
FROM employees
WHERE employee_id IN
    (SELECT employee_id
     FROM departments) AND
     department_id IN
        (SELECT department_id
         FROM departments
         WHERE location_id IN
            (SELECT location_id
             FROM locations
             WHERE country_id IN
                (SELECT country_id
                 FROM countries
                 WHERE country_name = 'Germany')));

-- p6
CREATE TABLE GRADE (
    student_id NUMBER(6,0),
    section_id NUMBER(6,0),
    letter_grade CHAR NOT NULL,
    term_id NUMBER(6,0) NOT NULL,
    CONSTRAINT grade_studentid_sectionid_pk PRIMARY KEY (student_id, section_id)
);

CREATE TABLE STUDENT (
    student_id NUMBER(6,0) NOT NULL,
    CONSTRAINT student_student_id_fk FOREIGN KEY (student_id)
        REFERENCES grade(student_id)
);

CREATE TABLE COURSE_SECTION (
    section_id NUMBER(6,0) NOT NULL,
    CONSTRAINT coursesection_section_id_fk FOREIGN KEY (section_id)
        REFERENCES grade(section_id)
);

CREATE TABLE TERM (
    term_id NUMBER(6,0) NOT NULL,
    CONSTRAINT term_term_id_fk FOREIGN KEY (term_id)
        REFERENCES grade(term_id)
);

-- p7
ALTER TABLE GRADE
ADD grade_id NUMBER(8);

CREATE SEQUENCE GRADE_SEQ
    INCREMENT BY 2
    START WITH 100;

INSERT INTO grade
    VALUES (100, 10, 'B', 5);

INSERT INTO grade
    VALUES (102, 11, 'A', 10);

-- Sarah Miller
INSERT INTO student
    VALUES (100);

INSERT INTO course_section
    VALUES (10);

INSERT INTO term
    VALUES (5);

-- Michael Connoly
INSERT INTO student
    VALUES (102);

INSERT INTO course_section
    VALUES (11);

INSERT INTO term
    VALUES (10);
