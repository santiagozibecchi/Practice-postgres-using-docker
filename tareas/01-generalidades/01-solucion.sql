-- 1. Ver todos los registros

select * from users

-- 2. Ver el registro cuyo id sea igual a 10

select name from users where id = 10

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)

select name from users where name like 'Jim %'


-- 4. Todos los registros cuyo segundo nombre es Alexander

select name from users where name like '% Alexander'


-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
-- 'Clyde Frazier' to 'Fernando Herrera'
SELECT * from users where id = 1
update users set name = 'Fernando Herrera' WHERE id = 1


-- 6. Borrar el último registro de la tabla

select count(*) from users
-- mas especifico
select MAX(id) from users

delete from users where id = (select count(*) from users)

-- Extras
select
    id,
    upper(name) as upper_name,
    lower(name) as lower_name,
    LENGTH(name) as LENGTH,
    '*' || id || '-' || name as BARCODE,
    concat(id, '-',name) as contatenacion,
    name
from
    users

-- Substring y Position
select
    name,
    (SUBSTRING(name, 0, (POSITION(' ' in name)))) as first_name,
    (SUBSTRING(name, (POSITION(' ' in name)+1), LENGTH(name))) as last_name,
--     Demanda mas poder de computo: la computadora hace lo que le decimos que haga, no lo que nosotros queremos que haga...
    TRIM(SUBSTRING(name, (POSITION(' ' in name)+1), LENGTH(name))) as trim_last_name
from
    users


    -- Tarea: Actualizar todos los registros con su first_name y last_name
    -- Es importante verificar anteriormente utilizando select para verificar como luce la informacion
UPDATE
    users
set
    first_name = SUBSTRING(name, 0, (POSITION(' ' in name))),
    last_name = SUBSTRING(name, (POSITION(' ' in name) + 1), LENGTH(name))
