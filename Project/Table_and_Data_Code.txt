-- Christan de Luna
-- Semester Project: Table and Data

-- DROP statements
DROP TABLE artwork_artist;
DROP TABLE museum_artist;
DROP TABLE artist;
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

CREATE TABLE ARTIST (
    artist_id NUMBER(6),
    artist_name VARCHAR(30) NOT NULL,
    origin VARCHAR(40),
    date_of_birth DATE,
    movement VARCHAR(30),
    CONSTRAINT artist_artist_id_pk PRIMARY KEY (artist_id)
);

CREATE TABLE MUSEUM_ARTIST (
    museum_id NUMBER(6),
    artist_id NUMBER(6),
--    CONSTRAINT museum_artist_pk PRIMARY KEY (museum_id, artist_id),
    CONSTRAINT museum_artist_museum_id FOREIGN KEY (museum_id)
        REFERENCES museum(museum_id),
    CONSTRAINT museum_artist_artist_id FOREIGN KEY (artist_id)
        REFERENCES artist(artist_id)
);

CREATE TABLE ARTWORK_ARTIST (
    artwork_id NUMBER(6),
    artist_id NUMBER(6),
--    CONSTRAINT artwork_artist_pk PRIMARY KEY (artwork_id, artist_id),
    CONSTRAINT artwork_artist_artwork_id FOREIGN KEY (artwork_id)
        REFERENCES artwork(artwork_id),
    CONSTRAINT artwork_artist_artist_id FOREIGN KEY (artist_id)
        REFERENCES artist(artist_id)
);


-- INSERT into MUSEUM
INSERT INTO museum
    VALUES (1, 'High Museum of Art', 17, '4047334400', 'Atlanta', 'United States of America', TO_DATE('05-OCT-1905', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (2, 'Louvre', 24, '140205050', 'Paris', 'France', TO_DATE('10-AUG-1793', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (3, 'Metropolitan Museum of Art', 18, '8006623397', 'New York City', 'United States of America', TO_DATE('13-APR-1870', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (4, 'British Museum', 12, '2073238299', 'London', 'England', TO_DATE('07-JUN-1753', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (5, 'Vatican Museums', 8, '0669884676', 'Vatican City', 'Vatican City', TO_DATE('14-JAN-1506', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (6, 'Museo Reina Sofia', 14, '917741000', 'Madrid', 'Spain', TO_DATE('10-SEP-1992', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (7, 'Museum of Modern Art', 19, '2127089400', 'New York City', 'United States of America', TO_DATE('07-NOV-1929', 'DD-MM-YYYY'));

INSERT INTO museum
    VALUES (8, 'Art Institute of Chicago', 15, '3124433600', 'Chicago', 'United States of America', TO_DATE('22-NOV-1879', 'DD-MM-YYYY'));


-- INSERT into ARTWORK
INSERT INTO artwork
    VALUES (1, 'The Persistence of Memory', 'Salvador Dali', 'Oil on canvas', 1931, 7);

INSERT INTO artwork
    VALUES (2, 'Guernica', 'Pablo Picasso', 'Oil on canvas', 1937, 6);

INSERT INTO artwork
    VALUES (3, 'Mona Lisa', 'Leonardo da Vinci', 'Oil on poplar panel', 1503, 2);

INSERT INTO artwork
    VALUES (4, 'The Creation of Adam', 'Michelangelo', 'Fresco', 1512, NULL);

INSERT INTO artwork
    VALUES (5, 'The Starry Night', 'Vincent van Gogh', 'Oil on canvas', 1889, 7);

INSERT INTO artwork
    VALUES (6, 'Interchange', 'William de Kooning', 'Oil on canvas', 1955, 8);

INSERT INTO artwork
    VALUES (7, 'Moscow Courtyard', 'Vasily Polenov', NULL, 1878, NULL);
    
INSERT INTO artwork
    VALUES (8, 'Number 17A', 'Jackson Pollock', 'Oil on fiberboard', 1948, 7);


-- INSERT into ARTIST
INSERT INTO artist
    VALUES (1, 'Salvador Dali', 'Spain', TO_DATE('11-05-1904', 'DD-MM-YYYY'), 'Surrealism');
    
INSERT INTO artist
    VALUES (2, 'Pablo Picasso', 'Spain', TO_DATE('08-10-1881', 'DD-MM-YYYY'), 'Surrealism');
    
INSERT INTO artist
    VALUES (3, 'Leonardo da Vinci', 'Italy', TO_DATE('15-04-1452', 'DD-MM-YYYY'), 'High Renaissance');
    
INSERT INTO artist
    VALUES (4, 'Michelangelo', 'Italy', TO_DATE('11-05-1904', 'DD-MM-YYYY'), 'High Renaissance');
    
INSERT INTO artist
    VALUES (5, 'Vincent van Gogh', 'Netherlands', TO_DATE('30-03-1853', 'DD-MM-YYYY'), 'Post-Impressionism');

INSERT INTO artist
    VALUES (6, 'William de Kooning', 'Netherlands', TO_DATE('24-04-1904', 'DD-MM-YYYY'), 'Abstract Expressionism');

INSERT INTO artist
    VALUES (7, 'Vasily Polenov', 'Russia', TO_DATE('01-06-1844', 'DD-MM-YYYY'), NULL);

INSERT INTO artist
    VALUES (8, 'Jackson Pollock', 'United States of America', TO_DATE('28-01-1912', 'DD-MM-YYYY'), 'Abstract Expressionism');


-- INSERT into MUSEUM_ARTIST
INSERT INTO museum_artist
    VALUES (1, NULL);
    
INSERT INTO museum_artist
    VALUES (2, 3);
    
INSERT INTO museum_artist
    VALUES (3, NULL);
    
INSERT INTO museum_artist
    VALUES (4, NULL);
    
INSERT INTO museum_artist
    VALUES (5, NULL);
    
INSERT INTO museum_artist
    VALUES (6, 2);
    
INSERT INTO museum_artist
    VALUES (7, 1);

INSERT INTO museum_artist
    VALUES (8, 6);


-- INSERT into ARTWORK_ARTIST
INSERT INTO artwork_artist
    VALUES (1, 1);
    
INSERT INTO artwork_artist
    VALUES (2, 2);
    
INSERT INTO artwork_artist
    VALUES (3, 3);
    
INSERT INTO artwork_artist
    VALUES (4, 4);
    
INSERT INTO artwork_artist
    VALUES (5, 5);

INSERT INTO artwork_artist
    VALUES (6, 6);

INSERT INTO artwork_artist
    VALUES (7, 7);

INSERT INTO artwork_artist
    VALUES (8, 8);


-- Save script
COMMIT;
