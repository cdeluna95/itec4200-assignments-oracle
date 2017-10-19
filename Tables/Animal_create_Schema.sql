-- script to create ANIMAL HOUSE RESCUE database
-- revised 4/28/2015 LP

--Drop tables to allow for multiple runs

DROP TABLE animal;
DROP TABLE wishlist;
DROP TABLE breed;
DROP TABLE volunteer;
DROP TABLE adopter;

--Create tables

CREATE TABLE adopter
(adopter_id NUMBER(4),
adopter_first VARCHAR(20),
adopter_last VARCHAR(20),
adopter_street VARCHAR(40),
adopter_city VARCHAR(20),
adopter_state CHAR(2),
adopter_zip VARCHAR(10),
adopter_phone VARCHAR(10), 
CONSTRAINT adopter_adopter_id_pk PRIMARY KEY (adopter_id)
);

INSERT INTO adopter VALUES
(0001, 'Roger', 'Matthews', '223 Island Dr.', 'Memphis', 'TN', '38103', '9015295585');

INSERT INTO adopter VALUES
(0012, 'Don', 'Clayton', '858 Harbor Isle', 'Memphis', 'TN', '38103', '9015298512');

INSERT INTO adopter VALUES
(0018, 'Janet', 'Satcher', '326 Stonewall St.', 'Memphis', 'TN', '38112', '9015258667');

INSERT INTO adopter VALUES
(0021, 'Emily', 'St. Andry', '61 River Mist Lane', 'Memphis', 'TN', '38103', '9015293408');

INSERT INTO adopter VALUES
(0025, 'Michael', 'McVicker', '74 Poplar Pike', 'Germantown', 'TN', '38138', '9015256132');

INSERT INTO adopter VALUES
(0031, 'Jessie', 'Sarpy', '1460 Woodbend', 'Memphis', 'TN', '38103', '9015290678');

INSERT INTO adopter VALUES
(0035, 'Terry', 'Cohenn', '2121 Westfair Dr.', 'Germantown', 'TN', '38138', '9015254430');

INSERT INTO adopter VALUES
(0036, 'Joseph', 'Rikard', '580 Fairwoods', 'Colliverville', 'TN', '38107', '9015287356');

INSERT INTO adopter VALUES
(0158, 'Amanda', 'Cooper', '2925 Cross Avenue', 'Memphis', 'TN', '38103', '9015294431');

INSERT INTO adopter VALUES
(0187, 'James', 'Longlois', '87 Lower Woods Circle', 'Germantown', 'TN', '38138', '9015250663');

INSERT INTO adopter VALUES
(0198, 'Suzanne', 'Ingram', '1150 River Falls', 'Memphis', 'TN', '38120', '9015298302');


CREATE TABLE volunteer 
(vol_id NUMBER(4),
vol_first VARCHAR(20),
vol_last VARCHAR(20),
vol_street VARCHAR(40),
vol_city VARCHAR(20),
vol_state CHAR(2),
vol_zip VARCHAR(10),
vol_phone VARCHAR(10),
vol_DOB DATE, 
CONSTRAINT volunteer_vol_id_pk PRIMARY KEY (vol_id)
);


INSERT INTO volunteer VALUES
(0001, 'Mimi', 'Jannik', '810 Shelby Dr.', 'Memphis', 'TN', '38103', '9015295520', '12-DEC-1989');

INSERT INTO volunteer VALUES
(0013, 'Jim', 'Maurice', '2516 Harbor Isle', 'Memphis', 'TN', '38103', '9015298534', '30-JAN-1972');

INSERT INTO volunteer VALUES
(0018, 'Catherine', 'Johnson', '765 Moss Terrace', 'Memphis', 'TN', '38112', '9015258123', '23-FEB-1956');

INSERT INTO volunteer VALUES
(0121, 'Abraham', 'Clark', '3829 Union St.', 'Memphis', 'TN', '38103', '9015293444', '07-SEP-1969');

INSERT INTO volunteer VALUES
(0231, 'Janice', 'LeBlanc', '768 Fairwoods', 'Germantown', 'TN', '38138', '9015256789', '14-MAR-1988');

INSERT INTO volunteer VALUES
(0037, 'Geralyn', 'Bouquet', '332 Blanchard', 'Memphis', 'TN', '38103', '9015290222', '25-NOV-1959');

INSERT INTO volunteer VALUES
(0452, 'Gwen', 'Claiborne', '1302 Lakeshore Dr.', 'Germantown', 'TN', '38138', '9015251000', '22-JUN-1973');

INSERT INTO volunteer VALUES
(0438, 'Joseph', 'Silvia', '131 West Court', 'Colliverville', 'TN', '38107', '9015286532', '02-FEB-1979');

INSERT INTO volunteer VALUES
(0209, 'Patrice', 'Ferrier', '564 Hope Avenue', 'Memphis', 'TN', '38103', '9015294991', '15-APR-1945');

INSERT INTO volunteer VALUES
(0117, 'Carol', 'Knotts', '879 Julia Circle', 'Germantown', 'TN', '38138', '9015250533', '16-JUL-1939');

INSERT INTO volunteer VALUES
(0019, 'Ron', 'Kingsley', '1120 Washington Ave.', 'Memphis', 'TN', '38120', '9015298210', '26-OCT-1990');


CREATE TABLE breed
(breed_id NUMBER(4),
breed_name VARCHAR(30),
breed_type VARCHAR(20),
CONSTRAINT breed_breed_id_pk PRIMARY KEY (breed_id)
);

INSERT INTO breed VALUES
(02, 'Airedale Terrier', 'dog');

INSERT INTO breed VALUES
(03, 'Akita', 'dog');

INSERT INTO breed VALUES
(04, 'American Eskimo', 'dog');

INSERT INTO breed VALUES
(05, 'Pitbull', 'dog');

INSERT INTO breed VALUES
(06, 'Australian Shepard', 'dog');

INSERT INTO breed VALUES
(08, 'Bassett Hound', 'dog');

INSERT INTO breed VALUES
(10, 'Beagle', 'dog');

INSERT INTO breed VALUES
(12, 'Collie', 'dog');

INSERT INTO breed VALUES
(14, 'Dalmation', 'dog');

INSERT INTO breed VALUES
(15, 'Siamese', 'cat');

INSERT INTO breed VALUES
(18, 'Chartreaux', 'cat');

INSERT INTO breed VALUES
(23, 'British Shorthair', 'cat');

INSERT INTO breed VALUES
(29, 'Russian Blue', 'cat');

INSERT INTO breed VALUES
(38, 'Persian', 'cat');

INSERT INTO breed VALUES
(44, 'Bombay', 'cat');

INSERT INTO breed VALUES
(56, 'Egyptian', 'cat');

INSERT INTO breed VALUES
(57, 'Sphynx', 'cat');

INSERT INTO breed VALUES
(67, 'canary', 'bird');

INSERT INTO breed VALUES
(79, 'South American parrot','bird');

INSERT INTO breed VALUES
(83, 'love bird', 'bird');

CREATE TABLE wishlist
(wish_id NUMBER(4),
breed_id NUMBER(4),
desired_age NUMBER(2),
desired_sex CHAR(1),
adopter_id NUMBER(4),
CONSTRAINT wishlist_wish_id_pk PRIMARY KEY (wish_id),
CONSTRAINT wishlist_adopter_id_fk FOREIGN KEY (adopter_id) REFERENCES adopter,
CONSTRAINT wishlist_desired_breed_fk FOREIGN KEY (breed_id)
   REFERENCES breed
);

INSERT INTO wishlist VALUES
(1, 3, 1, 'm', 198);

INSERT INTO wishlist VALUES
(2, 5, 1, 'm', 18);

INSERT INTO wishlist VALUES
(3, 23, 2, 'f', 187);

INSERT INTO wishlist VALUES
(4, 67, 2, 'f', 36);

INSERT INTO wishlist VALUES
(5, 2, 1, 'm', 198);

INSERT INTO wishlist VALUES
(6, 2, 3, 'm', 12);

INSERT INTO wishlist VALUES
(7, 38, 4, 'm', 18);

INSERT INTO wishlist VALUES
(8, 29, 3, 'm', 35);

INSERT INTO wishlist VALUES
(9, 79, 1, 'f', 25);

INSERT INTO wishlist VALUES
(10, 2, 2, 'f', 21);

INSERT INTO wishlist VALUES
(11, 18, 1, 'f', 158);

INSERT INTO wishlist VALUES
(12, 15, 0, 'f', 36);

INSERT INTO wishlist VALUES
(13, 10, 1, 'm', 187);

INSERT INTO wishlist VALUES
(14, 10, 3, 'f', 35);

INSERT INTO wishlist VALUES
(15, 15, 1, 'f', 1);

INSERT INTO wishlist VALUES
(16, 57, 5, 'm', 31);

INSERT INTO wishlist VALUES
(17, 29, 1, 'f', 25);

CREATE TABLE Animal
(animal_id NUMBER(4),
 animal_name VARCHAR(20),
 animal_age NUMBER(2),
 animal_weight NUMBER(4),
 animal_sex CHAR(1),
 arrival_date DATE,
 vol_id NUMBER(4),
 breed_id NUMBER(4),
 CONSTRAINT animal_animal_id_pk PRIMARY KEY (animal_id),
 CONSTRAINT animal_vol_id_fk FOREIGN KEY (vol_id) REFERENCES volunteer,
 CONSTRAINT animal_breed_id_fk FOREIGN KEY (breed_id) REFERENCES breed
);

INSERT INTO animal VALUES
(1, 'Precious', 2, 13, 'F', '28-SEP-2007', 13, 5);

INSERT INTO animal VALUES
(2, 'Rocky', 4, 22, 'M', '12-DEC-2007', 121, 2);

INSERT INTO animal VALUES
(3, 'Daisy', 6, 18, 'F', '2-JAN-2008', 452, 6);

INSERT INTO animal VALUES
(4, 'Max', 1, 45, 'M', '12-FEB-2008', 18, 4);

INSERT INTO animal VALUES
(5, 'Frisco', 3, 15, 'M', '22-JAN-2008', 231, 10);

INSERT INTO animal VALUES
(6, 'Dakota', 1, 34, 'F', '10-OCT-2007', 1, 8); 

INSERT INTO animal VALUES
(7, 'Sophie', 2, 22, 'F', '14-NOV-2007', 37, 12);

INSERT INTO animal VALUES
(8, 'Coco', 3, 37, 'M', '25-SEP-2007', 438, 14);

INSERT INTO animal VALUES
(9, 'Sasha', 1, 25, 'M', '10-OCT-2007', NULL, 3);

INSERT INTO animal VALUES
(10, 'Duke', 6, 51, 'M', '5-JAN-2008', 19, 14);

INSERT INTO animal VALUES
(11, 'Rascal',1, 40, 'M', '22-FEB-2008', NULL , 10);

INSERT INTO animal VALUES
(12, 'Pepi', 2, 17, 'F', '29-FEB-2008', NULL , 2);

INSERT INTO animal VALUES
(13, 'Peanut', 2, 60, 'M', '4-MAR-2008', 117, 5);

INSERT INTO animal VALUES
(14, 'Ginger', 3, 24, 'F', '15-MAR-2008', NULL, 10);

INSERT INTO animal VALUES
(15, 'Tigger', 2, 12, 'M', '12-DEC-2007', 13, 15); 

INSERT INTO animal VALUES
(16, 'Shadow', 1, 6, 'F', '8-FEB-2008', NULL , 29);

INSERT INTO animal VALUES
(17, 'Midnight', 4, 14, 'M', '24-MAR-2008', 19, 38);    

INSERT INTO animal VALUES
(18, 'Samantha', 3, 8, 'F', '15-NOV-2007', 117, 18);

INSERT INTO animal VALUES
(19, 'Snowball', 1, 10, 'M', '5-SEP-2007', 209, 57);

INSERT INTO animal VALUES
(20, 'Mystic', 3, 7, 'F', '8-MAR-2008', 18, 44);

INSERT INTO animal VALUES
(21, 'Tweety', 5, 2, 'F', '2-NOV-2007', NULL, 67);

INSERT INTO animal VALUES
(22, 'Lovey', 2, 3, 'M', '18-JAN-2008', 231, 83);
INSERT INTO animal VALUES
(23, 'Romeo', 3, 15, 'M', '24-DEC-2007', 117, 15);

COMMIT;





