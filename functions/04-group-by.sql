select
    count(*),
    SUBSTRING(email, (POSITION('@' in email) + 1), LENGTH(email)) as domian
from
    users
GROUP BY domian
HAVING count(*) > 1
ORDER BY domian desc