------
-- SQL queries
------
-- Lista el total de facturas de un cliente en un período determinado.
SELECT * FROM optica.pedidos WHERE cliente_id = 5
AND fecha_pedido BETWEEN '2022-06-01' AND '2023-06-01';


-- Lista los diferentes modelos de gafas que ha vendido un empleado durante un año.
SELECT g.modelo, p.fecha_pedido FROM pedidos p 
INNER JOIN detalle_pedidos d ON p.id_pedido = d.pedidos_id_pedido 
INNER JOIN gafas g ON d.gafas_id_gafas = g.id_gafas 
WHERE p.empleado_id = 2 AND
p.fecha_pedido BETWEEN '2022-01-01' AND '2022-12-31';


-- Lista los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT pr.id_proveedor, pr.nombre, m.nombre, g.modelo FROM proveedores pr 
INNER JOIN marcas m ON pr.id_proveedor = m.proveedor_id
INNER JOIN gafas g ON m.id_marca = g.marca_id 
INNER JOIN detalle_pedidos d ON g.id_gafas = d.gafas_id_gafas
INNER JOIN pedidos p ON d.pedidos_id_pedido = p.id_pedido;
