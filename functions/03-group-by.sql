-- GROUP BY
select
	COUNT(*),
    followers
from
    users
where
    followers BETWEEN 4500 and 4700
GROUP by followers
order by followers asc;