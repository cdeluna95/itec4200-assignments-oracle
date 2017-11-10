-- Christan de Luna
-- 11/10/2017

-- ch12p1
CREATE OR REPLACE VIEW EMPLOYEES_VU AS
    SELECT employee_id,
           last_name "EMPLOYEE",
           department_id
    FROM employees;

-- ch12p2
SELECT *
FROM employees_vu;

-- ch12p3
SELECT employee,
       department_id
FROM employees_vu;

-- ch12p4
CREATE VIEW DEPT50 AS
    SELECT employee_id "EMPNO",
           last_name "EMPLOYEE",
           department_id "DEPTNO"
    FROM employees
    WHERE department_id = 50
WITH CHECK OPTION CONSTRAINT dept50_ck;

-- ch12p5
DESC dept50;

SELECT *
FROM dept50;

-- ch12p6
UPDATE dept50
SET deptno = 80
WHERE employee = 'Matos';

-- ch12p7
CREATE SEQUENCE DEPT11_SEQ
    INCREMENT BY 10
    START WITH 300
    MAXVALUE 1000;
    
-- ch12p8
CREATE TABLE dept11 (
    d_num   NUMBER(7),
    d_name VARCHAR2(25),
    CONSTRAINT dept11_d_num_pk PRIMARY KEY (d_num));
    
INSERT INTO dept11
    SELECT  department_id, department_name
    FROM    departments;

INSERT INTO dept11
    VALUES (dept11_seq.NEXTVAL, 'Education');

INSERT INTO dept11
    VALUES (dept11_seq.NEXTVAL, 'Administration');
    
SELECT *
FROM dept11;

-- ch12p9
CREATE INDEX dept11_dname_idx
    ON dept11(d_name);
    
-- ch12p10
CREATE SYNONYM emp12
    FOR employees;
