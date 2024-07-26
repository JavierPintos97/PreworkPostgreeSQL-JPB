/*Ejercicio 4
Nivel de dificultad: Experto */
/*4.1) Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos")*/
CREATE TABLE public.Pedidos (id SERIAL, PRIMARY KEY, id_usuario INT, id_producto INT
FOREIGN KEY(id_usuario) REFERENCES public.Usuarios (id),
FOREIGN KEY (id_producto) REFERENCES public.Productos(id) );
--4.2) Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos
--Utilizo de id_usuario el 1,3,7 porque debido a los inserts/deletes me ha ido corriendo los id`s
INSERT INTO public.Pedidos  (id_usuario,id_producto) VALUES(1,1);
INSERT INTO public.Pedidos  (id_usuario,id_producto) VALUES(3,2);
INSERT INTO public.Pedidos  (id_usuario,id_producto) VALUES(7,3);
/*4.3) Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE) */

--Tengo duda a la hora de plantear el coalesce ..revisando el enunciado asi qué planteo dos soluciones
--FORMA1
SELECT U.nombre, P.nombre, PE.id_usuario, PE.id_producto,
COALESCE (id_usuario,id_producto) AS ID_Pedido
FROM public.Pedidos PE
LEFT JOIN public.Usuarios U
ON PE.id_usuario = U.id
LEFT JOIN public.Productos P
on PE.id_producto = P.id;
--FORMA 2
SELECT U.nombre, P.nombre, PE.id_usuario, PE.id_producto,
COALESCE (U.nombre) AS Nombre_pedido
FROM public.Pedidos PE
LEFT JOIN public.Usuarios U
ON PE.id_usuario = U.id
LEFT JOIN public.Productos P
on PE.id_producto = P.id;
/*4.4) Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN)*/
SELECT U.nombre, PE.id_usuario, PE.id_producto
FROM public.pedidos PE
LEFT JOIN public.Usuarios U
on PE.id_usuario = U.id;
/*4.5) Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE public.Pedidos ADD COLUMN Cantidad INT;

UPDATE public.Pedidos
SET Cantidad = 5
WHERE id = 1;

UPDATE public.Pedidos
SET Cantidad = 35
WHERE id = 2;

UPDATE public.Pedidos
SET Cantidad = 12
WHERE id = 3;