SELECT * FROM training.smartphones;

SELECT model,'smartphone' AS 'type' FROM training.smartphones; -- giving constant value

SELECT DISTINCT (brand_name) AS 'All brands'
FROM training.smartphones;

SELECT * FROM training.smartphones
WHERE brand_name = 'apple';

UPDATE training.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek'; -- setting/and change safe update to not as otherwise primary key is needed

-- agg. functions max, min, count, sum, avg, std, variance
SELECT STD(screen_size) FROM training.smartphones; -- standard deviation

SELECT VARIANCE(screen_size) FROM training.smartphones; -- variance

-- scalar fucntion
-- abs,round, ceil, floor, 