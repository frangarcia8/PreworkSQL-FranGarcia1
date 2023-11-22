/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS Pedidos (
	id SERIAL PRIMARY KEY,
	id_usuarios INT NOT NULL,
	CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	id_producto INT NOT NULL,
	CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id)
	)

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/

INSERT INTO pedidos (id_usuario, id_producto)
VALUES 
	(3,6),
	(3,1),
	(5,2),
	(5,1),
	(7,3)

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

CORREGIR? */

SELECT DISTINCT (u.nombre), pr.nombre, u.id
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.id_usuario
LEFT JOIN productos pr ON pr.id = p.id_producto
WHERE COALESCE (p.id_producto, 0) = 0
OR p.id_producto IS NOT NULL
ORDER BY u.id ASC;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/

SELECT u.nombre FROM usuarios u 
LEFT JOIN pedidos p ON p.id_usuario = u.id

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE pedidos
ADD COLUMN cantidad INT

UPDATE pedidos
SET cantidad = 
  CASE
    WHEN id = 1 THEN 2
    WHEN id = 2 THEN 3
    WHEN id = 3 THEN 4
    WHEN id = 4 THEN 5
    WHEN id = 5 THEN 6
    ELSE cantidad 
  END
WHERE
  id IN (1, 2, 3, 4, 5);