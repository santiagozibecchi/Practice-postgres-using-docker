

insert into
    continent (name)
select
    DISTINCT continent
from
    country
ORDER BY
    continent ASC;
    
select * from continent;

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);

select * from country_bk;

INSERT into
	country_bk
select * from country;

alter table country drop CONSTRAINT country_continent_check;


select a.name, a.continent,
(select "code" from continent b where b.name = a.continent )
from country a;


update country a 
set continent = (select "code" from continent b where b.name = a.continent );

select * from country;

-- Cambiar el tipo de dato de contient

alter table country 
alter COLUMN continent TYPE int4
-- casteo a continent
USING continent::integer;

-- alternativas:
alter table country 
alter COLUMN continent TYPE int4
-- casteo a continent
USING continent/1;
