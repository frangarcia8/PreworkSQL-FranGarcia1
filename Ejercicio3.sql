/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/

CREATE TABLE IF NOT EXISTS productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio DECIMAL
)

/*10.Insertar varios productos en la tabla "Productos" con diferentes valores.*/

INSERT INTO public.productos (nombre, precio)
VALUES ('calcetines', 7.95)

/*11.Consultar todos los clientes de la tabla "Clientes".*/

SELECT * FROM public.clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/

SELECT * FROM public.pedidos 
LEFT JOIN public.clientes  
ON public.clientes.id = public.pedidos.cliente_id

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

SELECT * FROM public.productos 
WHERE precio > 50 

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */

SELECT * FROM public.pedidos 
WHERE cantidad >= 5

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/

SELECT * FROM public.clientes 
WHERE nombre LIKE 'A%'

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/

SELECT 
c.id as id, 
c.nombre as nombre, 
p.cantidad as cantidad
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id = p.cliente_id

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. 

SE REFIERE A ESO*/

SELECT p.producto as producto, p.cantidad as cantidad
FROM public.pedidos p

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE public.pedidos  
ADD COLUMN fecha DATE

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".

CORREGIR*/ 

ALTER TABLE public.pedidos
ADD CONSTRAINT FK_producto
FOREIGN KEY (producto) REFERENCES productos(nombre)

/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/

