-------
-- Datos dummy para el modelo pizzeria
-------

-------
-- Provincias
-------
INSERT INTO `pizzeria`.`provincias` (`id_provincia`,`nombre`) VALUES 
    (1,'Barcelona'),
    (2,'Girona'),
    (3,'Lleida'),
    (4,'Tarragona'),
    (5,'Zaragoza');


-------
-- Localidades
-------
INSERT INTO `pizzeria`.`localidades` (`id_localidad`, `nombre`, `fk_provincias`) VALUES 
    (1, 'Badalona', '1'),
    (2, 'Barcelona', '1'),
    (3, 'Figueras', '2'),
    (4, 'Vendrell', '3'),
    (5, 'Cambrils', '3'),
    (6, 'Blanes', '2');


-------
-- Direcciones
-------
INSERT INTO `pizzeria`.`direcciones` (`id_direccion`, `direccion`, `cp`, `fk_localidades`) VALUES 
    (1, 'Plaza del Sol, 43', '08012', '2'),
    (2, 'Carrer del Pintor Fortuny 7', '08001', '2'),
    (3, 'Carrer de la Marina 129', '08018', '2'),
    (4, 'Carrer del Mar, 53', '08918', '1'),
    (5, 'Carrer de la Font, 25', '08911', '1'),
    (6, 'Carrer de la Pau, 33', '43715', '4'),
    (7, 'Carrer de la plaça, 6', '17300', '6');


-------
-- Clientes
-------
INSERT INTO `pizzeria`.`clientes` (`id_cliente`, `nombre`, `apellidos`, `telefono`, `fk_direcciones`) VALUES 
    (1, 'María', 'García', '666555444', 1),
    (2, 'Juan', 'Rodríguez', '677888999', 3),
    (3, 'Ana', 'López', '699123456', 2),
    (4, 'Pablo', 'Pérez', '633987654', 6),
    (5, 'Carmen', 'Fernández', '688111222', 5),
    (6, 'David', 'González', '644333222', 3),
    (7, 'Laura', 'Martínez', '655777888', 4),
    (8, 'Carlos', 'Sánchez', '666888777', 1),
    (9, 'Rosa', 'Navarro', '699444555', 6),
    (10, 'Sergio', 'Ruiz', '677222333', 3);


-------
-- Categorías
-------
INSERT INTO `pizzeria`.`categorias` (`id_categoria`, `nombre`) VALUES
    (1, 'Margarita'),
    (2, 'Pepperoni'),
    (3, 'Hawaiana'),
    (4, 'Barbacoa'),
    (5, 'Napolitana'),
    (6, 'Vegetariana'),
    (7, 'Cuatro quesos'),
    (8, 'Carbonara');


-------
-- Establecimientos
-------
INSERT INTO `pizzeria`.`establecimientos` (`id_establecimiento`, `fk_direcciones`) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);


-------
-- Empleados
-------
INSERT INTO `pizzeria`.`empleados` (`id_empleado`, `nombre`, `apellidos`, `nif`, `telefono`, `es_repartidor`, `fk_establecimientos`) VALUES 
    (1, 'Ana', 'García García', '12345678Z', '123456789', 0, 1),
    (2, 'David', 'Rodríguez Fernández', '98765432A', '987654321', 1, 2),
    (3, 'María', 'Pérez Sánchez', '23456789B', '654321987', 0, 3),
    (4, 'Carlos', 'González González', '87654321C', '789654321', 1, 4);


-------
-- Productos
-------
INSERT INTO `pizzeria`.`productos` (`id_producto`, `tipo`, `nombre`, `descripcion`, `imagen`, `precio`, `fk_categorias`, `fk_establecimientos`) VALUES 
    (1, 'HAMBURGUESA', 'Hamburguesa Clásica', 'Sabrosa hamburguesa con carne de res, lechuga, tomate y cebolla', 'imagen_hamburguesa_clasica.png', 6.99, NULL, 1),
    (2, 'BEBIDA', 'Refresco de cola', 'Refresco de cola carbonatado', 'imagen_refresco_cola.png', 2.99, NULL, 1),
    (3, 'PIZZA', 'Pizza Cuatro Quesos', 'Exquisita pizza con mozzarella, parmesano, gorgonzola y queso de cabra', 'imagen_pizza_cuatro_quesos.png', 12.99, 1, 2),
    (4, 'BEBIDA', 'Agua mineral', 'Agua mineral natural en botella de 500ml', 'imagen_agua_mineral.png', 1.99, NULL, 2),
    (5, 'PIZZA', 'Pizza Hawaiana', 'Deliciosa pizza con jamón, piña y salsa de tomate', 'imagen_pizza_hawaiana.png', 10.99, NULL, 3),
    (6, 'HAMBURGUESA', 'Hamburguesa Vegetariana', 'Sabrosa hamburguesa con falafel, lechuga, tomate y cebolla', 'imagen_hamburguesa_vegetariana.png', 8.99, NULL, 3),
    (7, 'BEBIDA', 'Zumo de naranja', 'Zumo natural de naranja recién exprimido', 'imagen_zumo_naranja.png', 3.99, NULL, 3),
    (8, 'PIZZA', 'Pizza Pepperoni', 'Exquisita pizza con pepperoni, queso mozzarella y salsa de tomate', 'imagen_pizza_pepperoni.png', 11.99, 7, 4),
    (9, 'BEBIDA', 'Cerveza rubia', 'Cerveza rubia en lata de 330ml', 'imagen_cerveza_rubia.png', 4.99, NULL, 4);


-------
-- Pedidos
-------
INSERT INTO `pizzeria`.`pedidos` (`id_pedido`, `fecha_pedido`, `a_domicilio`, `precio_total`, `n_hamburguesas`, `n_bebidas`, `n_pizzas`, `hora_entrega`, `fk_clientes`, `fk_empleado_repartidor`) VALUES
    (1, '2023-01-16 19:00:00', 0, 22.50, 1, 0, 2, NULL, 2, NULL),
    (2, '2023-02-17 12:15:00', 1, 45.25, 0, 2, 3, '2023-02-17 13:00:00', 3, 2),
    (3, '2023-02-18 20:45:00', 1, 30.75, 0, 1, 2, '2023-02-18 21:30:00', 4, 3),
    (4, '2023-02-19 17:00:00', 0, 16.00, 2, 0, 1, NULL, 1, NULL),
    (5, '2023-03-20 19:30:00', 1, 55.00, 2, 1, 4, '2023-03-20 20:15:00', 5, 4),
    (6, '2023-03-21 13:00:00', 0, 12.75, 1, 0, 1, NULL, 3, NULL),
    (7, '2023-03-22 20:00:00', 1, 27.00, 0, 2, 1, '2023-03-22 20:45:00', 4, 2);


-------
-- Pedidos tiene productos
-------
INSERT INTO `pizzeria`.`detalle_pedido` (`id_detalle_pedido`, `fk_productos`, `fk_pedidos`) VALUES
    (1, 1, 1),
    (2, 3, 1),
    (3, 6, 1),
    (4, 6, 2),
    (5, 4, 2),
    (6, 5, 3),
    (7, 1, 3),
    (8, 6, 3),
    (9, 2, 4),
    (10, 1, 4),
    (11, 1, 4),
    (12, 2, 4),
    (13, 2, 5),
    (14, 1, 5),
    (15, 4, 6),
    (16, 2, 6),
    (17, 2, 6),
    (18, 4, 7),
    (19, 3, 7);

