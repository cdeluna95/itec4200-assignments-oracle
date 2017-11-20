-- Christan de Luna
-- Semester Project: Queries

-- Get and run formatting in command line
SET LINESIZE 150
SET FEEDBACK OFF

-- Query 1:
-- Display a list of artworks, their artists, and
-- their media whose artists are of Spanish descent,
-- namely Salvador Dali and Pablo Picasso.
SELECT aw.artwork_name "Artwork Name",
       aw.artist_name "Artist Name",
       at.origin "Origin",
       aw.medium "Medium of Art"
FROM artwork aw
JOIN artist at
    ON aw.artwork_id = at.artist_id
WHERE aw.artist_name LIKE '%Dali'
    OR aw.artist_name LIKE '%Picasso'
    OR at.origin = 'Spain'
ORDER BY 1;

-- Query 2:
-- Display each museum, city,
-- and describe its fee in three levels:
-- high, medium, and low.
SELECT museum_name "Museum Name",
       city "City",
       (CASE WHEN fee > 18 THEN 'High'
             WHEN fee BETWEEN 12 AND 18 THEN 'Medium'
             ELSE 'Low'
        END) AS "Fee Level"
FROM museum
ORDER BY 3;

-- Query 3:
-- Display each museum and its minimum fee,
-- where it's less than 15.
SELECT museum_name "Museum Name",
       MIN(fee) "Fee"
FROM museum
GROUP BY museum_name
HAVING MIN(fee) <= 15
ORDER BY 2;

-- Query 4:
-- Display the artwork's name, artist's name, origin, and movement
-- from both the ARTWORK and ARTIST tables.
SELECT aw.artwork_name "Artwork Name",
       at.artist_name "Artist Name",
       at.origin "Origin",
       at.movement "Movement"
FROM artwork aw
JOIN artist at
    ON aw.artwork_id = at.artist_id
ORDER BY 1;

-- Query 5:
-- Display what museum and its locations
-- the painting 'Guernica' is originally in display.
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
-- Display all dates later in the 1900s in 'YYYY' format
-- from the MUSEUM and ARTIST tables.
SELECT TO_CHAR(founded_date, 'YYYY') "Dates"
FROM museum
WHERE TO_CHAR(founded_date, 'YYYY') > '1900'
UNION
SELECT TO_CHAR(date_of_birth, 'YYYY')
FROM artist
WHERE TO_CHAR(date_of_birth, 'YYYY') > '1900'
ORDER BY 1;

-- Query 7:
-- Display all artists' names
-- and how long it's been in years and months
-- since their birth.
SELECT artist_name "Artist Name",
       ROUND((SYSDATE - date_of_birth) / 365) "Number of years since birth",
       TRUNC(MONTHS_BETWEEN(SYSDATE, date_of_birth)) "Number of months since birth"
FROM artist
ORDER BY 2;

-- Query 8:
-- Display all museum names, their fees in US dollars,
-- and their founded dates in an appropriate format.
SELECT museum_name "Museum Name",
       TO_CHAR(fee, 'fmL9,999') "Fee in converted US dollars",
       TO_CHAR(founded_date, 'fmMonth Ddth, YYYY') "Formatted founded date"
FROM museum
ORDER BY 1;

-- Query 9:
-- Display any museums that may contain an artwork
-- whose medium is an oil-based painting.
SELECT museum_name "Museum Name",
       city "City",
       country "Country"
FROM museum
WHERE museum_id IN
    (SELECT museum_id
     FROM artwork
     WHERE medium LIKE 'Oil%')
ORDER BY 1;

-- Query 10
-- Find a list of artwork
-- that may not exist in some museums
-- and vice versa using a FULL OUTER JOIN.
SELECT m.museum_name "Museum Name",
       aw.museum_id "Museum ID",
       aw.artwork_name "Artwork Name"
FROM museum m
FULL OUTER JOIN artwork aw
    ON m.museum_id = aw.museum_id
ORDER BY 1;
