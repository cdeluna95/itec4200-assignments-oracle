-- Christan de Luna
-- Semester Project: Report

SET PAGESIZE 25
SET LINESIZE 80
SET FEEDBACK OFF
TTITLE 'Semester Project - Report|Art Galleries Database'
BTITLE 'By - Christan de Luna'
BREAK ON artwork_id SKIP 1
COL artwork_id HEADING 'Artwork ID' FORMAT 99
COL artwork_name HEADING 'Artwork Name' FORMAT A30
COL artist_name HEADING 'Artist Name' FORMAT A20

-- SQL Statement
-- Selects each artwork ID, name, and their artist.
SELECT artwork_id,
       artwork_name,
       artist_name
FROM artwork
ORDER BY 1;
