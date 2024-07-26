-- Active: 1707938630862@@localhost@5432@mibasededatos
 /*Ejercicio 5 */
--1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto)
CREATE TABLE public.Clientes (id SERIAL, nombre TEXT);
--2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes"
INSERT INTO public.Clientes (nombre) VALUES ('John');
--3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes"
UPDATE public.Clientes
SET nombre = 'John Doe'
WHERE id = 1;
--4. Elimina el cliente con id=1 de la tabla "Clientes"
DELETE FROM public.Clientes WHERE id = 1;
--5. Lee todos los clientes de la tabla "Clientes"
SELECT * FROM public.Clientes;
--6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero)
CREATE TABLE public.Pedidos (id SERIAL, cliente_id INT);
--7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos"
INSERT INTO public.Pedidos (cliente_id) VALUES (1);
--8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos"
UPDATE public.Pedidos
SET id = 2
WHERE id = 1;
--9. Elimina el pedido con id=1 de la tabla "Pedidos"
DELETE FROM public.Pedidos WHERE id = 1;
--EN EL APARTADO ANTERIOR LO HEMOS BORRADO ASI QUE PARA QUE FUESE CORRECTO Y NO HUBIERA ERROR, HABRÍA QUE CAMBIAR EL FILTRO DEL WHERE POR id= 2
--10. Lee todos los pedidos de la tabla "Pedidos"
SELECT * FROM Pedidos;
--11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto)
CREATE TABLE public.Productos (id SERIAL, nombre TEXT);
--12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos"
INSERT INTO public.Productos (nombre) VALUES ('Camisa');
--13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos"
UPDATE Public.Productos
SET nombre = 'Pantalón'
WHERE id = 1;
--14. Elimina el producto con id=1 de la tabla "Productos"
DELETE FROM public.Productos WHERE id = 1;
--15. Lee todos los productos de la tabla "Productos"
SELECT * FROM public.Productos;
--16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero)
CREATE TABLE public.DetallesPedido (pedido_id INT, producto_id INT);
--17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido"
INSERT INTO public.DetallesPedido (pedido_id,producto_id) VALUES (1,1);
--18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido"
UPDATE public.DetallesPedido
SET pedido_id = 2
WHERE pedido_id = 1;
--19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido"
DELETE FROM public.DetallesPedido WHERE pedido_id = 1;
--EN EL APARTADO ANTERIOR LO HEMOS BORRADO ASI QUE PARA QUE FUESE CORRECTO Y NO HUBIERA ERROR, HABRÍA QUE CAMBIAR EL FILTRO DEL WHERE POR pedido_id= 2
--20. Lee todos los detalles de pedido de la tabla "DetallesPedido"
SELECT * FROM public.DetallesPedido;
--21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join
SELECT * FROM public.Clientes C
INNER JOIN Public.Productos P
ON C.id=P.id;
--22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join
SELECT * FROM public.Clientes C
LEFT JOIN public.Productos P
ON C.id=P.id;
--23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join
SELECT * FROM public.Clientes C
INNER JOIN Public.Productos P
ON C.id=P.id
INNER JOIN public.DetallesPedido D
ON P.id = D.pedido_id;
--24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join
SELECT * FROM public.Clientes C
LEFT JOIN public.Productos P
ON C.id=P.id
LEFT JOIN public.DetallesPedido D
ON P.id = D.pedido_id;