/*1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255)NOT NULL
	)

/*2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/

INSERT INTO clientes (nombre)
VALUES ('Jhon')

/*3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/

UPDATE clientes
SET nombre = 'Jhon Doe'
WHERE id = 1;


/*4. Elimina el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM clientes
WHERE id = 1

/*5. Lee todos los clientes de la tabla "Clientes".*/

SELECT * FROM public.clientes
ORDER BY id ASC 

/*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).*/

CREATE TABLE IF NOT EXISTS pedidos5 (
	id SERIAL PRIMARY KEY,
	cliente_id INT NOT NULL)

/*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/

INSERT INTO pedidos5 (cliente_id)
VALUES
	(1)


/*8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/

UPDATE pedidos5 
SET cliente_id = 2
WHERE id = 1

/*9. Elimina el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM pedidos5 
WHERE id = 1

/*10. Lee todos los pedidos de la tabla "Pedidos".*/

SELECT * FROM public.pedidos5
ORDER BY id ASC 

/*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE IF NOT EXISTS productos5 (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL)

/*12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/

INSERT INTO productos5 (nombre)
VALUES ('Camisa')

/*13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/

UPDATE productos5 
SET nombre = 'Pantalón'
WHERE id = 1

/*14. Elimina el producto con id=1 de la tabla "Productos".*/

DELETE FROM productos5
WHERE id = 1

/*15. Lee todos los productos de la tabla "Productos".*/

SELECT * FROM public.productos5
ORDER BY id ASC 

/*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero).*/

CREATE TABLE IF NOT EXISTS detallespedido (
	pedido_id INT,
	producto_id INT
	

/*17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido".*/

INSERT INTO detallespedido (pedido_id, producto_id)
VALUES (1,1)

/*18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido".*/

UPDATE detallespedido 
SET producto_id = 2
WHERE producto_id = 1


/*19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/

DELETE FROM detallespedido
WHERE pedido_id = 1

/*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/

SELECT * FROM public.detallespedido

/*21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join.*/

ALTER TABLE pedidos5 
ADD CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id)

SELECT * FROM clientes c
JOIN pedidos5 p ON p.cliente_id = c.id


/*22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join.*/

SELECT * FROM clientes c
LEFT JOIN pedidos5 p ON p.cliente_id = c.id

/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join.*/

ALTER TABLE detallespedido
ADD CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos5(id)

SELECT * FROM productos5 p
JOIN detallespedido dp ON dp.producto_id = p.id

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join.*/

SELECT * FROM productos5 p
LEFT JOIN detallespedido dp ON dp.producto_id = p.id


/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes".*/

ALTER TABLE clientes
ADD COLUMN telefono VARCHAR (255)


/*26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero.*/

ALTER TABLE clientes
ALTER COLUMN telefono TYPE INTEGER USING telefono::integer;

/*27. Elimina la columna "telefono" de la tabla "Clientes".*/

ALTER TABLE clientes
DROP COLUMN telefono

/*28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/

ALTER TABLE clientes
RENAME TO usuarios5;

/*29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".*/

ALTER TABLE usuarios5
RENAME COLUMN nombre TO nombre_completo;

/*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/

ALTER TABLE usuarios5
ALTER COLUMN id SET DATA TYPE SERIAL;

ALTER TABLE usuarios5
ADD PRIMARY KEY (id);


