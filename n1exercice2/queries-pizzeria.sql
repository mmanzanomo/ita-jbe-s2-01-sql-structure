-- Lista el número de bebidas vendidas en una determinada localidad.
SELECT count(p.id_producto) as número_productos
FROM productos p
INNER JOIN establecimientos e ON e.id_establecimiento = p.fk_establecimientos
INNER JOIN direcciones d ON d.id_direccion = e.fk_direcciones
INNER JOIN localidades l ON l.id_localidad = d.fk_localidades
WHERE l.nombre = 'Barcelona' AND p.tipo = 'BEBIDA';


-- Lista cuantos pedidos ha realizado un determinado empleado.alter
SELECT *
FROM pedidos p INNER JOIN empleados e ON p.fk_empleado_repartidor = e.id_empleado
WHERE e.id_empleado = 2;

