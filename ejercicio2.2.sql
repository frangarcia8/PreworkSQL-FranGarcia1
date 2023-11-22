/*1.Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS Ciudades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	pais VARCHAR (255))

/* 2. Inserta al menos tres registros en la tabla "Ciudades".*/

INSERT INTO Ciudades (nombre,pais)
VALUES 
	('París','Francia'),
	('Madrid','España'),
	('Roma','Italia'),
	('Berlín','Alemania'),
	('Bruselas','Bélgica')
	 

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/

ALTER TABLE usuarios
ADD COLUMN ciudades_id INT,
ADD CONSTRAINT FK_ciudades_id FOREIGN KEY (ciudades_id) REFERENCES ciudades(id)


/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT u.nombre, c.nombre AS ciudad, c.pais FROM usuarios u
LEFT JOIN ciudades c
ON u.ciudades_id = c.id


/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/

SELECT u.nombre, c.nombre AS ciudad FROM usuarios u
JOIN ciudades c
ON u.ciudades_id = c.id
