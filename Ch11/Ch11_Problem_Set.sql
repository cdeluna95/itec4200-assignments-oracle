-- Christan de Luna
-- 10/26/2017

-- DROP statements
DROP TABLE artwork;
DROP TABLE museum;


-- CREATE statements
CREATE TABLE MUSEUM (
    museum_id NUMBER(6),
    museum_name VARCHAR2(30) NOT NULL,
    fee NUMBER(8,2),
    phone_num VARCHAR2(10),
    city VARCHAR2(20),
    country VARCHAR2(40),
    founded_date DATE,
    CONSTRAINT museum_museum_id_pk PRIMARY KEY (museum_id)
);

CREATE TABLE ARTWORK (
    artwork_id NUMBER(6),
    artwork_name VARCHAR2(30) NOT NULL,
    artist_name VARCHAR(30) NOT NULL,
    medium VARCHAR(30),
    year NUMBER(4),
    museum_id NUMBER(6),
    CONSTRAINT artwork_artwork_id_pk PRIMARY KEY (artwork_id),
    CONSTRAINT artwork_museum_id_fk FOREIGN KEY (museum_id)
        REFERENCES museum(museum_id)
);


-- INSERT into MUSEUM
INSERT INTO museum VALUES
(1, 'High Museum of Art', 17, '4047334400', 'Atlanta', 'United States of America', TO_DATE('05-OCT-1905', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(2, 'Louvre', 24, '140205050', 'Paris', 'France', TO_DATE('10-AUG-1793', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(3, 'Metropolitan Museum of Art', 18, '8006623397', 'New York City', 'United States of America', TO_DATE('13-APR-1870', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(4, 'British Museum', 12, '2073238299', 'London', 'England', TO_DATE('07-JUN-1753', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(5, 'Vatican Museums', 6, '0669884676', 'Vatican City', 'Vatican City', TO_DATE('14-JAN-1506', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(6, 'Museo Reina Sofia', 14, '917741000', 'Madrid', 'Spain', TO_DATE('10-SEP-1992', 'DD-MM-YYYY'));

INSERT INTO museum VALUES
(7, 'Museum of Modern Art', 19, '2127089400', 'New York City', 'United States of America', TO_DATE('07-NOV-1929', 'DD-MM-YYYY'));


-- INSERT into ARTWORK
INSERT INTO artwork VALUES
(1, 'The Persistence of Memory', 'Salvador Dali', 'Oil on canvas', 1931, 7);

INSERT INTO artwork VALUES
(2, 'Guernica', 'Pablo Picasso', 'Oil on canvas', 1937, 6);

INSERT INTO artwork VALUES
(3, 'Mona Lisa', 'Leonard da Vinci', 'Oil on poplar panel', 1503, 2);

INSERT INTO artwork VALUES
(4, 'The Creation of Adam', 'Michelangelo', 'Fresco', 1512, 5);

INSERT INTO artwork VALUES
(5, 'The Starry Night', 'Vincent van Gogh', 'Oil on canvas', 1889, 7);

COMMIT;
