-- Write a SQL script that lists all bands 
--with Glam rock as their main style, ranked by their longevity
SELECT
    band_name,
    CASE
        WHEN split IS NOT NULL AND formed IS NOT NULL THEN 2022 - YEAR(formed)
        WHEN split IS NOT NULL THEN 2022 - YEAR(split)
        ELSE 0
    END AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock'
ORDER BY lifespan DESC;
