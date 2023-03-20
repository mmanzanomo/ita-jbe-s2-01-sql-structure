-- Lista el número de bebidas vendidas en una determinada localidad.
SELECT count(p.id_producto) as número_productos
FROM productos p
INNER JOIN establecimientos e ON e.id_establecimiento = p.id_establecimientos
INNER JOIN direcciones d ON d.id_direccion = e.id_direccion
INNER JOIN localidades l ON l.id_localidad = d.id_localidad
WHERE l.nombre = 'Barcelona' AND p.tipo = 'BEBIDA';


-- Lista cuantos pedidos ha realizado un determinado empleado.
SELECT *
FROM pedidos p INNER JOIN empleados e ON p.id_empleado_repartidor = e.id_empleado
WHERE e.id_empleado = 2;

