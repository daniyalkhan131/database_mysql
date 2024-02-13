SELECT * FROM training.ipl;

select count(*) 
from training.ipl;

desc training.ipl;

-- find the top 5 batsman in IPL
select batter,sum(batsman_run) as 'total_runs'
from training.ipl
group by batter
order by total_runs desc 
limit 5;
-- find the 2nd highest 6 hitter in IPL
select batter, count(*)
from training.ipl
where batsman_run=6
group by batter
order by count(*) desc
limit 1,1;
-- Find top 10 batsman with centuries in IPL
--                     have to tell those batsman that as most 100's , those 10 we have to tell
select batter, count(*) as 'count'
from (select batter,id, sum(batsman_run) as 'runs_in_match'
from training.ipl
group by batter,id
having sum(batsman_run)>=100) as S
group by batter
order by count desc
limit 10;
-- find the top 5 batsman with highest strike rate who have played a min of 1000 balls
select batter, (sum(batsman_run)/count(batsman_run))*100 as 'sr'
from training.ipl
group by batter
having count(batsman_run)>=1000
order by sr desc limit 5 ;