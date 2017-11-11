-- Christan de Luna
-- Semester Project: Queries

-- Query 1:
-- Display a list of artworks and their medium whose artists are of Spanish descent, namely Salvador Dali and Pablo Picasso.
SELECT artwork_name "Artwork Name",
       artist_name "Artist Name",
       medium "Medium of Art"
FROM artwork
WHERE artist_name = 'Salvador Dali' OR artist_name = 'Pablo Picasso'
ORDER BY 1;

-- Query 2:
-- Display each museum and describe its fee in three levels: high, medium, and low.
SELECT museum_name "Museum Name",
       (CASE WHEN fee > 18 THEN 'High'
             WHEN fee BETWEEN 12 AND 18 THEN 'Medium'
             ELSE 'Low'
        END) AS "Fee Level"
FROM museum
ORDER BY 1;

-- Query 3:
-- Display each museum and its minimum fee, where it's less than 15.
SELECT museum_name "Museum Name",
       MIN(fee) "Fee"
FROM museum
GROUP BY museum_name
HAVING MIN(fee) <= 15
ORDER BY 2;

-- Query 4:
-- Display the artwork's name, artist's name, origin, and movement from both the ARTWORK and ARTIST table.
SELECT aw.artwork_name "Artwork Name",
       at.artist_name "Artist Name",
       at.origin "Origin",
       at.movement "Movement"
FROM artwork aw
JOIN artist at
    ON aw.artwork_id = at.artist_id
ORDER BY 1;

-- Query 5:
-- Display what museum and its locations the painting 'Guernica' is originally in display.
SELECT museum_name "Museum Name",
       city "City",
       country "Country"
FROM museum
WHERE museum_id =
    (SELECT museum_id
     FROM artwork
     WHERE artwork_name = 'Guernica')
ORDER BY 1;

-- Query 6:
-- Display all dates that are in the 1900s in 'YYYY' format from the MUSEUM and ARTIST tables.
SELECT TO_CHAR(founded_date, 'YYYY') "Dates"
FROM museum
WHERE TO_CHAR(founded_date, 'YYYY') > '1900'
UNION
SELECT TO_CHAR(date_of_birth, 'YYYY')
FROM artist
WHERE TO_CHAR(date_of_birth, 'YYYY') > '1900'
ORDER BY 1;

-- Query 7:
-- Display all artists' name and the number of days since their death.
SELECT artist_name "Artist Name",
       ROUND((SYSDATE - date_of_birth) / 365) "Number of days since death"
FROM artist
ORDER BY 2;

-- Query 8:
-- Display all museum names, their fees, and their founded dates in an appropriate format.
SELECT museum_name "Museum Name",
       TO_CHAR(fee, 'fmL9,999') "Fee in local currency",
       TO_CHAR(founded_date, 'fmMonth Ddth, YYYY') "Formatted founded date"
FROM museum
ORDER BY 1;

-- Query 9:
-- Display any museums that may not contain an artwork whose medium is not oil-based painting.
SELECT museum_name "Museum Name",
       city "City",
       country "Country"
FROM museum
WHERE museum_id IN
    (SELECT museum_id
     FROM artwork
     WHERE UPPER(medium) NOT LIKE UPPER('oil%'))
ORDER BY 1;

-- Query 10
--
SAVEPOINT insert_null_value;

INSERT INTO artwork
    VALUES (6, 'The Daylight', 'Anonymous', 'Acrylic', 2006, 1);
INSERT INTO artist
    VALUES (6, 'Anonymous', NULL, TO_DATE('20-08-1995', 'DD-MM-YYYY'), NULL);
INSERT INTO artwork_artist
    VALUES (6, 6);

INSERT INTO artwork
    VALUES (7, 'The Moonlight', 'Anonymous', NULL, 2006, 1);
INSERT INTO artist
    VALUES (7, 'Anonymous', 'Philippines', TO_DATE('20-08-1995', 'DD-MM-YYYY'), NULL);
INSERT INTO artwork_artist
    VALUES (7, 7);

ROLLBACK TO insert_null_value;

SELECT aw.artwork_name "Artwork Name",
       aw.medium "Medium of Artwork",
       at.origin "Origin of Artist"
FROM artist at
FULL OUTER JOIN artwork aw
    ON at.artist_id = aw.artwork_id
ORDER BY 1;
