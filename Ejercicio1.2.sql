/*5.Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/

CREATE TABLE IF NOT EXISTS pedidos(
	id SERIAL PRIMARY KEY,
	producto VARCHAR(255) NOT NULL,
	cantidad INT NOT NULL,
	cliente_id INT NOT NULL,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/

INSERT INTO public.pedidos (producto, cantidad, cliente_id)
VALUES ('Camiseta', 2, 2)

/*7Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE public.pedidos
SET cantidad = 3
WHERE id = 2

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM public.pedidos
WHERE id = 2
