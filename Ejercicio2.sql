/*Ejercicio 2
Nivel de dificultad: Fácil*/
--2.1) Crea una base de datos llamada "MiBaseDeDatos"
CREATE DATABASE MiBaseDeDatos;
--2.2) Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, claveprimaria), "nombre" (texto) y "edad" (entero)
--DESDE LA QUERY TOOL DE NUESTRA NUEVA BBDD
CREATE TABLE public.Usuarios(id SERIAL PRIMARY KEY, nombre VARCHAR(50), edad INT);
--2.3) Inserta dos registros en la tabla "Usuarios"
INSERT INTO public.Usuarios (nombre,edad) VALUES ('Maria', 56);
INSERT INTO public.Usuarios (nombre,edad) VALUES ('Javier',60);
--2.4) Actualiza la edad de un usuario en la tabla "Usuarios"
UPDATE public.Usuarios 
SET edad = 44
WHERE id = '1';
--2.5) Elimina un usuario de la tabla "Usuarios"
DELETE FROM public.Usuarios WHERE id = 2;

/*Nivel de dificultad: Moderado */
--2.1) Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto)
CREATE TABLE Ciudades (id SERIAL PRIMARY KEY, nombre VARCHAR(50), pais VARCHAR(125));
--2.2 Inserta al menos tres registros en la tabla "Ciudades"
INSERT INTO public.Ciudades (nombre,pais) VALUES ('Madrid','España');
INSERT INTO public.Ciudades (nombre,pais) VALUES ('Milan','Italia');
INSERT INTO public.Ciudades (nombre,pais) VALUES ('Sao paolo','Brasil');
--2.3) Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades"
ALTER TABLE public.Usuarios
ADD FOREIGN KEY (id) REFERENCES public.Ciudades (id);
--2.4) Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN)
SELECT U.nombre, C.nombre, C.pais
FROM public.Usuarios U
LEFT JOIN public.Ciudades C
ON U.id = C.id;
--2.5) Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN)

SELECT * FROM public.Usuarios U
INNER JOIN public.ciudades C
ON U.id = C.id;