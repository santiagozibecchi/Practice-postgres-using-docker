alter TABLE
    city
add
    CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);


INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');
		
		
		
alter TABLE
    countrylanguage
add
    CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);
    
    
    select * from country;
    select * from countrylanguage;
    SELECT * from city;