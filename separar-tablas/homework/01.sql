

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
select DISTINCT language from countrylanguage;


-- Actualizar todos los registros
insert INTO
	"language" (name)
select DISTINCT language from countrylanguage order by "language" asc; 

select * from language;

select
    a.language,
    (
        select
            code
        FROM
            "language" l
        where
            a.language = l.name
    )
FROM
    countrylanguage a;
    

UPDATE countrylanguage a
set languagecode = (select code from "language" l where a.language = l.name);


-- Cambiar tipo de dato en countrylanguage - languagecode por int4
SELECT * from countrylanguage;

alter table countrylanguage
alter COLUMN languagecode TYPE int4
USING languagecode::integer


-- Crear el forening key y constraints de no nulo el language_code

alter table
    countrylanguage
add
    CONSTRAINT fk_country_language FOREIGN KEY(languagecode) REFERENCES "language";




-- Revisar lo creado