SELECT
    *
from
    country
where
    code = 'NLD';
    

    
delete from
    country
where
    code = 'NLD'
    and code2 = 'NA';
    
alter table
    country
add
    PRIMARY KEY (code);
    


SELECT
    *
from
    country;
    
-- Validaciones

alter table country add CHECK (
	surfacearea >= 0
);