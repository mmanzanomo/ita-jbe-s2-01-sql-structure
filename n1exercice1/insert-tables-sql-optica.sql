---------
-- Some insert statements with dummy data.
---------


---------
-- TABLE 'empleados'
---------
INSERT INTO `optica`.`empleados` VALUES
	(NULL, 'Joan Vilaclara'),
	(NULL, 'Miriam Masia'),
	(NULL, 'Alberto Gómez'),
	(NULL, 'Ana Arnau'),
	(NULL, 'Elena Cobo')
;


---------
-- TABLE 'direcciones'
---------
-- ID CALLE NUMERO PISO PUERTA CIUDAD CP PAIS
INSERT INTO `optica`.`direcciones` VALUES
	(NULL, 'Industria', '2', 'Bajo', 'A', 'Lugo', '1322',  'España'),
	(NULL, 'Carrer del Comte d\'Urgell', '10', 'S/N', NULL, 'Barcelona', '08011',  'España'),
	(NULL, 'Calle de Alcalá', '101', '1º', '2ª', 'Madrid', '28014',  'España'),
	(NULL, 'Calle Larios', '46', '4º', '2ª', 'Málaga', '29005',  'España'),
	(NULL, 'Gran Vía', '532', '2º', '2ª', 'Barcelona', '08121',  'España'),
	(NULL, 'Plaza Mayo', '43', '1º', '3ª', 'Barcelona', '08010',  'España')
;


---------
-- TABLE 'proveedores'
---------
-- id, nif, nombre, fax, telefono, direccion_id
INSERT INTO optica.proveedores VALUES 
	(NULL, 'A73217363', 'Gafa pasta, SL', NULL, '659090321', 1),
	(NULL, 'B00923486', 'Crital Cubo, SA', '903243287', '956436641', 2),
	(NULL, 'L75583729', 'Visión de pasta', '912209450', '938421098', 3),
	(NULL, 'P83949003', 'Oculab, SL', '903492983', '932222987', 4)
;


---------
-- TABLE 'clientes'
---------
-- id, nombre, telefono, email, fecha_registro, direccion_id, recomendado_por
INSERT INTO optica.clientes VALUES
	(NULL, 'Juan García', '687956544', 'jgarcia@mail.com', '2022-03-22 12:22:00', 3, NULL),
	(NULL, 'Marta Martínez', '634694411', 'm.martinez@mail.com', '2022-03-26 12:22:00', 2, NULL),
	(NULL, 'Pablo López', '654770238', 'pablolo@mail.com', '2022-03-29 16:41:00', 4, NULL),
	(NULL, 'Ana Fernández', '611679161', 'anafer@mail.com', '2022-04-02 11:16:00', 5, 2),
	(NULL, 'Miguel González', '678001276', 'mgonzalez@mail.com', '2022-04-06 12:52:00', 6, 3)
;


---------
-- TABLE 'marcas'
---------
-- id, nombre, proveedor_id
INSERT INTO optica.marcas VALUES 
	(NULL, 'Sunshine', 1),
	(NULL, 'Blue sky', 2),
	(NULL, 'Original eyes', 3),
	(NULL, 'Ray Sun', 4)
;  


---------
-- TABLE 'gafas'
---------
-- id, modelo, montura, color_montura, color_cristales, pedido_id, precio, graduacion_izq, graduacion_der, marca_id
INSERT INTO optica.gafas VALUES
	(NULL, 'R66', 'flotante', 'rojo', 'azul', 121.23, '0.41', '1.22', 1),
	(NULL, 'Forest', 'pasta', 'negro', 'transparente', 212.45, '1.6', '1.05', 2),
	(NULL, '21A', 'metalica', 'azul', 'negro claro', 78.45, '0.6', '0.5', 3),
	(NULL, '21A', 'metalica', 'blanco', 'negro claro', 78.45, '0.6', '0.5', 4),
	(NULL, '21A', 'metalica', 'blanco', 'transparente', 76.80, '0.7', '0.5', 3),
	(NULL, 'Sea', 'pasta', 'blanco', 'azul claro', 178.56, '1.6', '1.2', 4)
;


---------
-- TABLE 'pedidos'
---------
-- id, cliente_id, empleado_id, gafas_id, fecha_pedido
 INSERT INTO optica.pedidos VALUES
	(NULL, 5, 2, 4, '2021-11-26'),
	(NULL, 1, 2, 3, '2022-06-21'),
	(NULL, 2, 4, 4, '2022-07-02'),
	(NULL, 3, 4, 3, '2022-08-22'),
	(NULL, 4, 3, 5, '2022-09-30'),
	(NULL, 5, 2, 4, '2022-09-21'),
	(NULL, 5, 2, 4, '2023-01-19')
;

