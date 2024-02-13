-- CREACION DE INDICES

-- los indices unicos son más rapidos que los indices donde podemos tener mas de un registro


select * from country where continent = 'Africa';

-- UNIQUE => Ningun valor de campo se repite
create UNIQUE index "unique_country_name" on country (
	name
);

create index "country_continent" on country (
	continent
);