-- HAVING
select
    COUNT(*),
    country
from
    users
GROUP BY
    country
HAVING
    count(*) > 5
order by
    COUNT(*) desc
    
    
SELECT * from users

select 
	count(*),
	country
from users
GROUP by country
HAVING count(*) BETWEEN 4 and 5
order by country desc;
