/*1.Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE Mibasededatos

/*2.Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS public.usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255), 
	edad INT)

/*3.Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO usuarios(nombre,edad)
VALUES 
	('Fran', 31),
	('María', 23)

/*4.Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE usuarios
SET edad = 28
WHERE id = 1

/*5.Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM usuarios
WHERE id = 1




