-- Christan de Luna
-- 11/29/2017

DROP TABLE shelterlocation;
DROP SEQUENCE animal_seq;

-- exam3p1
CREATE SEQUENCE animal_seq
    START WITH 5
    INCREMENT BY 5
    MAXVALUE 100
    CYCLE;

-- exam3p2
CREATE TABLE ShelterLocation (
    location_id NUMBER(3),
    street_address VARCHAR2(40),
    phone_number VARCHAR2(10),
    CONSTRAINT shelterlocation_locationid_pk PRIMARY KEY (location_id)
);

-- exam3p3
INSERT INTO shelterlocation
    VALUES(animal_seq.NEXTVAL, '155 Pleasant Hill Road', '4045291111');

INSERT INTO shelterlocation
    VALUES(animal_seq.NEXTVAL, '3030 Old Peachtree Rd NE', '6785258812');

INSERT INTO shelterlocation
    VALUES(animal_seq.NEXTVAL, '1837 Sugarloaf Parkway', NULL);

-- exam3p4
SELECT *
FROM shelterlocation;

-- exam3p5
ALTER TABLE shelterlocation
MODIFY (street_address NOT NULL);

-- exam3p6
ALTER TABLE animal
ADD location_id NUMBER(3);

-- exam3p7
ALTER TABLE animal
ADD CONSTRAINT animal_locationid_fk FOREIGN KEY (location_id)
    REFERENCES shelterlocation(location_id);

-- exam3p8
UPDATE animal
SET location_id = 5
WHERE animal_name = 'Midnight';

-- exam3p9
UPDATE animal
SET location_id = 15
WHERE animal_age >= 5;

-- exam3p10
SELECT animal_id,
       animal_name,
       animal_age,
       location_id
FROM animal
WHERE location_id IS NOT NULL;

COMMIT;
