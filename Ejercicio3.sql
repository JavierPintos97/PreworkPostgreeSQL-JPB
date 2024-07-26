/*Ejercicio 3
Nivel de dificultad: Difícil */
--Ejercicios 3
--3.1) Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico)
CREATE TABLE public.Productos (id SERIAL PRIMARY KEY, nombre varchar (35), precio FLOAT);
--3.2) Inserta al menos cinco registros en la tabla "Productos"
INSERT INTO public.Productos(nombre,precio) VALUES ('Deportivas', 99.50);
INSERT INTO public.Productos(nombre,precio) VALUES ('Gafas de sol', 107);
INSERT INTO public.Productos(nombre,precio) VALUES ('Calcetines', 11.25);
INSERT INTO public.Productos(nombre,precio) VALUES ('Bebida energética', 4.50);
INSERT INTO public.Productos(nombre,precio) VALUES ('Bici', 1000.99);
--3.3) Actualiza el precio de un producto en la tabla "Productos"
UPDATE public.Productos
SET precio = 9.75
WHERE id = 3;
--3.4) Elimina un producto de la tabla "Productos"
DELETE FROM public.Productos WHERE id = 4;
/*3.5) Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos") */
SELECT U.nombre, P.nombre
FROM public.Usuarios U
INNER JOIN public.Productos P
ON U.id = P.id;
