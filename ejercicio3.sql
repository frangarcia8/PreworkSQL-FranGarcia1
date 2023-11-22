/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS Productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	precio INT NOT NULL
	)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO productos (nombre,precio)
VALUES 
	('Televisor',299),
	('Ordenador',657),
	('Móvil',155),
	('Disco Duro',99),
	('Cable HDMI',26),
	('Monitor TV',199),
	('Teclado',35)
	

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE productos
SET precio = 399
WHERE id = 1

/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM productos
WHERE id = 4


/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/

ALTER TABLE usuarios
ADD COLUMN productos_id INT, 
ADD CONSTRAINT FK_productos_id FOREIGN KEY (productos_id) REFERENCES productos(id)
	
SELECT u.nombre, p.nombre FROM usuarios u
JOIN productos p 
ON u.productos_id = p.id