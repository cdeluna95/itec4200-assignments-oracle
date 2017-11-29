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

-- p4
CREATE TABLE GRADE (
    student_id NUMBER(6,0),
    section_id NUMBER(6,0),
    letter_grade CHAR NOT NULL,
    term_id NUMBER(6,0) NOT NULL,
    CONSTRAINT grade_studentid_sectionid_pk PRIMARY KEY (student_id, section_id),
    CONSTRAINT grade_student_id_fk FOREIGN KEY (student_id)
        REFERENCES STUDENT,
    CONSTRAINT grade_section_id_fk FOREIGN KEY(section_id)
      REFERENCES COURSE_SECTION,
    CONSTRAINT grade_term_id_fk FOREIGN KEY (term_id)
        REFERENCES TERM,
    CONSTRAINT chk_letter_grade
        CHECK(letter_grade IN ('A', 'B', 'C', 'D', 'W', 'F'))
);

-- p5
ALTER TABLE GRADE
ADD grade_id NUMBER(8);

CREATE SEQUENCE GRADE_SEQ
    INCREMENT BY 2
    START WITH 100;

INSERT INTO grade
    VALUES (1, 10, 'B', 3, grade_seq.NEXTVAL);

INSERT INTO grade
    VALUES (6, 11, 'A', 5, grade_seq.NEXTVAL);


-- Old problems
-- Before 11/27/2017

-- p3
INSERT INTO breed
    VALUES (2, 'Airdale Terrier', 'dog');
    
INSERT INTO breed
    VALUES (3, 'Akita', 'dog');
    
INSERT INTO breed
    VALUES (4, 'American Eskimo', 'dog');
    
INSERT INTO breed
    VALUES (5, 'Pitbull', 'dog');

INSERT INTO breed
    VALUES (6, 'Australian Shepard', 'dog');

INSERT INTO breed
    VALUES (8, 'Bassett Hound', 'dog');
    
INSERT INTO breed
    VALUES (10, 'Beagle', 'dog');
    
INSERT INTO breed
    VALUES (12, 'Collie', 'dog');
    
INSERT INTO breed
    VALUES (14, 'Dalmation', 'dog');

INSERT INTO breed
    VALUES (15, 'Siamese', 'dog');
    
INSERT INTO breed
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
    VALUES (1, 'Precious', 2, 13, 'F', '28-SEP-07', 13, 12);
    
INSERT INTO animal
    VALUES (2, 'Rocky', 4, 22, 'M', '12-DEC-07', 121, 2);
    
INSERT INTO animal
    VALUES (3, 'Daisy', 6, 18, 'F', '02-JAN-08', 1, 15);

SELECT *
FROM animal;

SELECT animal_name "Animal Name",
       vol_first || ' ' || vol_last "Volunteer Name",
       breed_name "Breed Name"
FROM animal a 
JOIN volunteer v
    ON a.vol_id = v.vol_id
JOIN breed b
    ON a.breed_id = b.breed_id;