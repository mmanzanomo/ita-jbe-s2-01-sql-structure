------
-- SQL queries
------
-- Lista el total de facturas de un cliente en un período determinado.
SELECT * FROM optica.pedidos WHERE cliente_id = 5
AND fecha_pedido BETWEEN '2022-06-01' AND '2023-06-01';


-- Lista los diferentes modelos de gafas que ha vendido un empleado durante un año.
SELECT g.modelo, p.fecha_pedido FROM pedidos p INNER JOIN gafas g
ON p.gafas_id = g.id_gafas 
WHERE p.empleado_id = 2 AND
p.fecha_pedido BETWEEN '2022-01-01' AND '2022-12-31';


-- Lista los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT pr.id_proveedor, pr.nombre, m.nombre, g.modelo FROM pedidos p 
INNER JOIN gafas g ON p.gafas_id = g.id_gafas
INNER JOIN marcas m ON g.marca_id = m.id_marca
INNER JOIN proveedores pr ON m.proveedor_id = pr.id_proveedor;
