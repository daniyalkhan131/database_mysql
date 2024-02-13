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
select brand_name, round(avg(price)) as 'avg_price'
from training.smartphones
group by brand_name
order by avg_price desc
limit 5;
-- 6. which brand makes the smallest screen smartphones
select brand_name
from training.smartphones
where screen_size=(select min(screen_size)
					from training.smartphones);

select brand_name, round(avg(screen_size)) as 'avg_size'
from training.smartphones
group by brand_name
order by avg_size asc
limit 1;
-- 7. Avg price of 5g phones vs avg price of non 5g phones
select has_5g, round(avg(price)) as 'avg_price'
from training.smartphones 
group by has_5g;

-- 8. Group  brand, and find the brand with the highest number of models that have both NFC and an IR blaster.
select brand_name, count(*) as 'count'
from training.smartphones
where has_nfc='true' and has_ir_blaster='true'
group by brand_name
order by count desc 
limit 1;
-- 9. Find all samsung 5g enabled smartphones and find out the avg price for NFC and Non -NFC phones
select has_nfc, avg(price) as 'avg_price'
from training.smartphones
where brand_name='samsung' and has_5g='True'
group by has_nfc;
-- 10. find the phone name, price of the costliest phone
select model, price
from training.smartphones 
order by price
limit 1;

-- 1. find the avg rating of smartphone brands which have more than 20 phones
select brand_name, avg(rating) as 'avg_rating', count(*) as 'count'
from training.smartphones
group by brand_name
having count(*)>20
order by avg_rating desc;

-- 2. Find the top 3 brands with the highest avg ram that have a refresh rate of at least 90 Hz and fast charging available and dont consider brands which have less than 10 phones
select brand_name, avg(ram_capacity) as 'avg_ram'
from training.smartphones
where refresh_rate >=90 and fast_charging_available=1
group by brand_name
having count(*)>10
order by avg_ram desc
limit 3;
-- 3. find the avg price of all the phone brands with avg rating > 70 and num phones more than 10 among all 5g enabled phones
select brand_name,avg(price) as 'avg_price'
from training.smartphones
where has_5g='true'
group by brand_name
having avg(rating)>70 and count(*);