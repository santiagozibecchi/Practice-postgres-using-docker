-- Actulizar hire_date de todos los emplados sumando el año actual:
select
    NOW(),
    CURRENT_DATE,
    CURRENT_TIME,
    date_part('hour', now()) as hours,
    date_part('minutes', now()) as minutes,
    date_part('days', now()) as days,
    date_part('seconds', now()) as seconds,
    date_part('hour', now()) as hours;
    
    
select * from employees 
where hire_date > date('1998-01-05')
order by hire_date DESC;


select 
max(hire_date) as mas_nuevo,
min(hire_date) as primer_empleado
from employees;

-- BETWEEN => es inclusivo
select * from employees 
where hire_date BETWEEN '1999-01-01' and '2000-01-01'
order by hire_date DESC;



-- INTERVALOS

select
    max(hire_date),
    max(hire_date) + INTERVAL '1 days' as days,
    max(hire_date) + INTERVAL '1 month' as month,
    max(hire_date) + INTERVAL '1 year' as years,
    date_part('year', now()),
    MAKE_INTERVAL(YEARS := date_part('year', now()) :: INTEGER),
    
    max(hire_date) + MAKE_INTERVAL(YEARS := 23) as mas_23
from
    employees;

-- DIFERENCIA ENTRE FECHAS Y ACTUALIZACIONES

SELECT
    hire_date,
    MAKE_INTERVAL(YEARS := 2024 - EXTRACT( YEARS from hire_date)::INTEGER) as manual,
    MAKE_INTERVAL(YEARS := date_part('years', CURRENT_DATE)::INTEGER - EXTRACT( YEARS from hire_date)::INTEGER) as computed
from
    employees
order BY hire_date asc;

-- Actualizar la fecha
-- Primero verficar la data antes de mandar directamente al update
select 
	hire_date,
	hire_date + INTERVAL '24 years' as fecha_actualizada
from employees
order by hire_date desc;

UPDATE employees
set hire_date = hire_date + INTERVAL '24 years';