-- Christan de Luna
-- 10/30/2017

-- ch10p1
DROP TABLE my_employee;

CREATE TABLE my_employee (
    id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
    last_name VARCHAR2(25),
    first_name VARCHAR2(25),
    userid  VARCHAR2(8),
    salary  NUMBER(9,2));

-- ch10p2
INSERT INTO my_employee
    VALUES (1, 'Parsons', 'Randolph', 'rparsons', 1895);

-- ch10p3
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
    VALUES (2, 'Danes', 'Barbara', 'bdanes', 1860);

-- ch10p4
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
    VALUES (&id, '&last_name', '&first_name', '&userid', &salary);
    
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
    VALUES (&id, '&last_name', '&first_name', '&userid', &salary);
    
-- ch10p5
UPDATE my_employee
SET last_name = 'Patel', userid = 'bpatel'
WHERE id = 2;

-- ch10p6
UPDATE my_employee
SET salary = 2000
WHERE salary < 1900;

-- ch10p7
DELETE FROM my_employee
WHERE id = 3;

-- ch10p8
COMMIT;

-- ch10p9
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
    VALUES (5, 'Ropeburn', 'Alice', 'aropebur', 1550);
    -- arepoburn exceeds VARCHAR2(8)
    
-- ch10p10
SAVEPOINT insert_id_of_5;

-- ch10p11
DELETE from my_employee;

-- ch10p12
ROLLBACK TO insert_id_of_5;

-- ch10p13
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
    VALUES (&&id,
            '&&last_name',
            '&&first_name',
            LOWER(SUBSTR('&&first_name', 0, 1) || SUBSTR('&&last_name', 0, 7)),
            &&salary);
UNDEFINE id
UNDEFINE last_name
UNDEFINE first_name
UNDEFINE salary
