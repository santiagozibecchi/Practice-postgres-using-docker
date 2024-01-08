No es más que una query que se ejecuta dentro de otra query:
Suelen ser altamente ineficientes porque si la tabla tuviera 1m de registros
el sub query se ejecutaría en la misma cantidad

SELECT * FROM Tabla_A WHERE (Sub Query Tabla B)

La solucion frente a esta inificiencia es crear una vista materializada o crearse una tabla temporal o bien extraer los resultados y trabajarlos