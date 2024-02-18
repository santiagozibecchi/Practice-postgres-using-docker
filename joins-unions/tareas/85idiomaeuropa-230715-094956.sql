-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;
Select * from "language";

SELECT COUNT(*) as total, "language" from (
	select countrylanguage."language", language.code from country country
	INNER JOIN countrylanguage countrylanguage ON countrylanguage.countrycode = country.code
	INNER JOIN language language ON language.code = countrylanguage.languagecode
	where country.continent = 5 AND countrylanguage.isofficial = true
) as euroLanguages
GROUP BY "language"
ORDER BY total desc
LIMIT 1;

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)



SELECT name as country from (
	select countrylanguage."language", language.code, country."name" from country country
	INNER JOIN countrylanguage countrylanguage ON countrylanguage.countrycode = country.code
	INNER JOIN language language ON language.code = countrylanguage.languagecode
	where country.continent = 5 AND countrylanguage.isofficial = true AND language.code = 135
) as euroLanguages
GROUP BY name;