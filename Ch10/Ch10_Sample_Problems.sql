-- Sequence: Auto-increment
-- Surrogate key: automatic number, e.g., GGC Student ID

CREATE SEQUENCE
departments_dept_id_seq
INCREMENT BY 10
START WITH 280;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (departments_dept_id_seq.NEXTVAL, 'Development',  121, 3200);

INSERT INTO departments (department_id, department_name)
VALUES (departments_dept_id_seq.NEXTVAL,  'MIS');

INSERT INTO departments
VALUES (departments_dept_id_seq.NEXTVAL,  'Research', 101, 1000);

SELECT departments_dept_id_seq.CURRVAL FROM dual;

SELECT * FROM departments;

CREATE TABLE manager (
    mgr_id NUMBER(4),
    mgr_name VARCHAR2(20),
    salary NUMBER(7,2),
CONSTRAINT manager_mgr_id_PK PRIMARY KEY(mgr_id));

INSERT INTO manager
	SELECT employee_id, last_name, salary
	FROM employees
	WHERE job_id  LIKE '%MGR%' OR job_id LIKE '%MAN%';

UPDATE manager
SET salary = 9000
WHERE mgr_id = 145;

DELETE FROM manager
WHERE mgr_id = 205;

DELETE from departments
WHERE department_id = 10;

INSERT INTO manager VALUES
(4455, 'CINDERELLA', 5000);
SELECT * FROM manager;
SAVEPOINT Save1;
INSERT INTO manager VALUES
(4456, 'SNOW WHITE', 6000);
SELECT * FROM manager;
ROLLBACK TO Save1;
SELECT * FROM manager;

SELECT * FROM manager;

COMMIT;
ROLLBACK;
