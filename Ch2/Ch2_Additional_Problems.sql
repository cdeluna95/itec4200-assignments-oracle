--ch2p1
SELECT animal_name || ' is ' || animal_age || ' years old.' AS "Animal Name: Age",
       animal_name || '''s ' || 'arrival date was: ' || arrival_date AS "Animal Arrival Date" 
FROM Animal;

--ch2p2
SELECT animal_name || ' is ' || animal_age || ' year(s) old.' AS "Animal's Age and Sex",
       NVL(vol_id, 0) AS "0 indicates needed volunteer"
FROM Animal
ORDER BY NVL(vol_id, 0);
