-- Christan de Luna
-- 11/29/2017

-- exam3p1
SELECT breed_id "Identification Number",
       breed_name "Dog Breed"
FROM wishlist
NATURAL JOIN breed
WHERE breed_type = 'dog'
    AND wish_id IN (2, 3, 10, 5)
UNION
SELECT breed_id "Identification Number",
       breed_name "Dog Breed"
FROM breed
NATURAL JOIN wishlist
WHERE breed_type = 'dog'
ORDER BY 2;
