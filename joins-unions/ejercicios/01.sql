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