-- SERIAL - IDENTITY

create table "users" (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR
);

create table "users2" (
	user_id INTEGER GENERATED by DEFAULT as IDENTITY PRIMARY KEY,
	username VARCHAR
);

create table "users3" (
	user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username VARCHAR
);

create table "users4" (
	user_id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT by 2),
	username VARCHAR
);


-- CLAVE PRIMARIA COMPUESTA
create TABLE userDual (
	id1 int, 
	id2 int,
	-- la combinacion de ambos o todos los campos que coloquemos seran la nueva clave primaria
	-- la combinacion jamas se va a repetir
	PRIMARY Key (id1, id2)
);

-- UUIDs - Identificadores unicos

CREATE EXTENSION if not EXISTS "uuid-ossp";

select gen_random_uuid(), uuid_generate_v4();

CREATE TABLE user5(
	user_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	username VARCHAR
);