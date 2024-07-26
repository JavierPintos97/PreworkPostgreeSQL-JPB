/* Ejercicio 1
1.) Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),nombre (texto) y email (texto). */

CREATE TABLE IF NOT EXISTS public.Clientes (id SERIAL PRIMARY KEY, nombre VARCHAR(255), email VARCHAR(255));

/*1.2) Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com"*/

INSERT INTO public.Clientes(nombre,email ) VALUES ('Juan','juan@example.com');

/* 1.3) Actualizar el email del cliente con id=1 a "juan@gmail.com"*/
UPDATE public.Clientes
  SET email = 'juan@gmail.com'
  WHERE id = 1;

/* 1.4)  Eliminar el cliente con id=1 de la tabla "Clientes" */
DELETE FROM public.Clientes WHERE id = 1;

/* 1.5) Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero)*/
CREATE TABLE public.Pedidos(id SERIAL PRIMARY KEY, Cliente_id INT, producto VARCHAR(255), cantidad INT, FOREIGN KEY(Cliente_id) REFERENCES public.Clientes (id));
/* 1.6) Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2 */
--Al haber borrado en el apartado 1.4) el registro con id = 1 y ser serial pk, obligatoriamente habrá que hacer el cruce con el siguiente registro con id = 2, es imposible tener el cliente_id = 1 porque ya no existe. Por lo que he utilizado el del siguiente registro
INSERT INTO public.Pedidos (Cliente_id,producto,cantidad) VALUES (2,'Camiseta',2);
--Lo que he echo después para que se quedará como en el enunciado, (aunque no es para nada una buena best practice), he updateado el id de la tabla pedidos para que cuadre. (En la corrección indicarme si hay algún metódo mejor)
UPDATE public.Pedidos
SET id = 1
WHERE id = 2;
/* 1.7) Actualizar la cantidad del pedido con id=1 a 3 */
UPDATE public.Pedidos 
SET cantidad = 3
WHERE id = 1;

/* 1.8) Eliminar el pedido con id=1 de la tabla "Pedidos"*/
DELETE FROM public.Pedidos WHERE id = 1;

/* 1.9) Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal) */
CREATE TABLE IF NOT EXISTS public.Productos(id SERIAL PRIMARY KEY, nombre VARCHAR(255),precio FLOAT);
/* 1.10) Insertar varios productos en la tabla "Productos" con diferentes valores */
INSERT INTO public.Productos (nombre,precio) VALUES ('Altramuces', 12.69);
INSERT INTO public.Productos (nombre,precio) VALUES ('Kikos', 8.55);
INSERT INTO public.Productos (nombre,precio) VALUES ('Pesicola', 32.10);
INSERT INTO public.Productos (nombre,precio) VALUES ('Sushi de burgos', 52.37);

/* 1.11) Consultar todos los clientes de la tabla "Clientes"*/
SELECT * FROM public.Clientes;

/* 1.12) Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes */
--FORMA 1
SELECT * FROM public.Pedidos P
LEFT JOIN public.Clientes C
ON P.Cliente_id = C.id;
--FORMA 2
SELECT P.id,P.producto, P.cantidad,C.nombre
FROM public.Pedidos P
LEFT JOIN public.clientes C
ON P.Cliente_id = C.id;
/* 1.13) Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50 */
SELECT * FROM public.Productos WHERE precio > 50;
/* 1.14) Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5 */
SELECT * FROM public.Pedidos WHERE cantidad >= 5;
/* 1.15) Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A" */
SELECT * FROM public.Clientes WHERE nombre LIKE 'A%';

/* 1.16) Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente */
--FORMA 1
SELECT C.nombre,P.cantidad
FROM public.Clientes C
INNER JOIN public.Pedidos P
ON C.id = P.Cliente_id;
--FORMA 2 (+ COMPLEJA)
SELECT SUM(cantidad) as Pedidos_totales,C.nombre
FROM public.Pedidos P
INNER JOIN public.Clientes C
ON P.Cliente_id = C.id
GROUP BY P.cliente_id, C.nombre;

/* 1.17) Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto */
SELECT P.producto,P.cantidad FROM public.Pedidos P ;
/* 1.18) Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha */
ALTER TABLE public.Pedidos ADD Fecha Date;
/* 1.19) Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto" */
ALTER TABLE public.Pedidos 
ADD FOREIGN KEY (pedidos) REFERENCES public.Productos(nombre);
/* 1.20)  Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa */

SELECT C.nombre, P.nombre, PE.cantidad
FROM public.Clientes C
INNER JOIN public.Productos P 
ON P.Cliente_id = C.id
INNER JOIN public.Pedidos PE
on PE.pedidos = P.nombre;