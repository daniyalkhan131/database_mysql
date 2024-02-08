SELECT * FROM training.smartphones;

SELECT model,'smartphone' AS 'type' FROM training.smartphones; -- giving constant value

SELECT DISTINCT (brand_name) AS 'All brands'
FROM training.smartphones;

SELECT * FROM training.smartphones
WHERE brand_name = 'apple';

select * from training.smartphones
where brand_name like 'o__o';

select * from training.smartphones
where brand_name like 'a%e';

UPDATE training.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek'; -- setting/and change safe update to not as otherwise primary key is needed

-- agg. functions max, min, count, sum, avg, std, variance
SELECT STD(screen_size) FROM training.smartphones; -- standard deviation

SELECT VARIANCE(screen_size) FROM training.smartphones; -- variance

-- scalar fucntion
-- abs,round, ceil, floor, 

select brand_name,count(*)
from training.smartphones
group by brand_name
having count(*)>50;

-- 1. Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity
select count(*),avg(price), max(rating), avg(screen_size), avg(battery_capacity)
from training.smartphones
group by brand_name;

-- 2. Group smartphones by whether they have an NFC and get the average price and rating
select has_nfc,avg(price),avg(rating)
from training.smartphones
group by has_nfc;

-- 3. Group smartphones by the extended memory available and get the average price
select extended_memory_available,avg(price) as price
from training.smartphones
group by extended_memory_available;

-- 4. Group smartphones by the brand and processor brand and get the count of models and the average primary camera resolution (rear)
select count(*), avg(primary_camera_rear)
from training.smartphones
group by brand_name, processor_brand;

-- 5. find top 5 most costly phone brands
select brand_name
from training.smartphones
group by brand_name
order by max(price) desc
limit 5;
-- 6. which brand makes the smallest screen smartphones
-- 7. Avg priGampüsx1040 graphy.com avg price of non 5g phones
-- 8. Group  brand, and find the brand with the highest number of models that have both NFC and an IR blaster.

-- 9. Find all samsung 5g enabled smartphones and find out the avg price for NFC and Non -NFC phones
-- 10. find the phone name, price of the costliest phone