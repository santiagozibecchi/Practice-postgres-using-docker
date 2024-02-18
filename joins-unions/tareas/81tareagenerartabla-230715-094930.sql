

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

select a.name as country, b.name as continent from country a, continent b
where a.continent = b.code
order by b.name ASC;



select a.name as country, b.name as continent from country a 
inner JOIN continent b on a.continent = b.code
order by a.name asc;

select * from country;
select * from continent;


-- clausula - UNION	
select * from continent where name like '%America%'
UNION
select * from continent where code in (3,5)
order by name ASC;


alter SEQUENCE continent_code_seq RESTART with 9;



select a.name as country, a.continent as continentCode, b.name as continentName
from country a
FULL OUTER JOIN continent b ON a.continent = b.code
order by a.name DESC;

select a.name as country, a.continent as continentCode, b.name as continentName
from country a
RIGHT JOIN  continent b ON a.continent = b.code
where a.continent is null
order by a.name DESC;

select b."name" as continent from country a
RIGHT JOIN continent b on a.continent = b.code
where a.continent is null;

(select COUNT(*) as contador, b.name from country a
inner join continent b ON a.continent = b.code
GROUP by b.name)

UNION

(select 0 as contador, b.name from country a
RIGHT join continent b ON a.continent = b.code
where a.continent is null
GROUP by b.name)
order by contador asc;


select * from country;
select * from continent;

(select COUNT(*) as total, b.name as continent from country a
INNER JOIN continent b ON b.code = a.continent
where b."name" not LIKE '%America%'
GROUP BY b.name)
UNION
(select COUNT(*) as total, 'America' from country a
INNER JOIN continent b ON b.code = a.continent
where b."name" LIKE '%America%')
ORDER BY total asc;


select * from country;
select * from city;

select COUNT(*) as "Total de cuidades", a.name as "Nombre del pais" from country a
INNER JOIN city b ON a.code = b.countrycode
GROUP BY a.name
ORDER BY "Total de cuidades" desc
limit 1;


-- Teniendo en cuenta la relacion con la tabla language

select * from language;
select * from country;
select * from continent;
select * from countrylanguage;

select b."name", d.name as continent from countrylanguage a 
INNER JOIN language b ON b.code = a.languagecode
INNER JOIN country c ON a.countrycode = c.code
INNER JOIN continent d ON c.continent = d.code
where a.isofficial = true;


SELECT COUNT(*) as total, continent from (
	select b."name", d.name as continent from countrylanguage a 
	INNER JOIN language b ON b.code = a.languagecode
	INNER JOIN country c ON a.countrycode = c.code
	INNER JOIN continent d ON c.continent = d.code
	where a.isofficial = true
) as languageByContinent
GROUP BY continent
ORDER BY total DESC;