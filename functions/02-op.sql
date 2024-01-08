select
    count(*),
    min(followers) as min_followers,
    max(followers) as max_followers,
    -- promedio
    ROUND(avg(followers)) as avg_followers
from
    users