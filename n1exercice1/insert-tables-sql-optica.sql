---------
-- Some insert statements with dummy data.
---------


---------
-- TABLE 'empleados'
---------
INSERT INTO `optica`.`empleados` VALUES
	(1, 'Joan Vilaclara'),
	(2, 'Miriam Masia'),
	(3, 'Alberto Gómez'),
	(4, 'Ana Arnau'),
	(5, 'Elena Cobo')
;


---------
-- TABLE 'proveedores'
---------
INSERT INTO `optica`.`proveedores` VALUES 
	(1, 'A73217363', 'Gafa pasta, SL', NULL, '659090321'),
	(2, 'B00923486', 'Crital Cubo, SA', '903243287', '956436641'),
	(3, 'L75583729', 'Visión de pasta', '912209450', '938421098'),
	(4, 'P83949003', 'Oculab, SL', '903492983', '932222987')
;


---------
-- TABLE 'clientes'
---------
INSERT INTO `optica`.`clientes` VALUES
	(1, 'Juan García', '687956544', 'jgarcia@mail.com', '2022-03-22 12:22:00', NULL),
	(2, 'Marta Martínez', '634694411', 'm.martinez@mail.com', '2022-03-26 12:22:00', NULL),
	(3, 'Pablo López', '654770238', 'pablolo@mail.com', '2022-03-29 16:41:00', NULL),
	(4, 'Ana Fernández', '611679161', 'anafer@mail.com', '2022-04-02 11:16:00', 2),
	(5, 'Miguel González', '678001276', 'mgonzalez@mail.com', '2022-04-06 12:52:00', 3)
;


---------
-- TABLE 'direcciones'
---------
INSERT INTO `optica`.`direcciones` VALUES
	(1, 'Industria', '2', 'Bajo', 'A', 'Lugo', '1322',  'España', 1, NULL),
	(2, 'Carrer del Comte d\'Urgell', '10', 'S/N', NULL, 'Barcelona', '08011',  'España', 2, NULL),
	(3, 'Calle de Alcalá', '101', '1º', '2ª', 'Madrid', '28014',  'España', NULL, 1),
	(4, 'Calle Larios', '46', '4º', '2ª', 'Málaga', '29005',  'España', NULL, 2),
	(5, 'Gran Vía', '532', '2º', '2ª', 'Barcelona', '08121',  'España', NULL, 3),
	(6, 'Plaza Mayo', '43', '1º', '3ª', 'Barcelona', '08010',  'España', 3, NULL)
;


---------
-- TABLE 'marcas'
---------
INSERT INTO optica.marcas VALUES 
	(1, 'Sunshine', 1),
	(2, 'Blue sky', 2),
	(3, 'Original eyes', 3),
	(4, 'Ray Sun', 4)
;  


---------
-- TABLE 'gafas'
---------
INSERT INTO optica.gafas VALUES
	(1, 'R66', 'flotante', 'rojo', 'azul', 121.23, '0.41', '1.22', 1),
	(2, 'Forest', 'pasta', 'negro', 'transparente', 212.45, '1.6', '1.05', 2),
	(3, '21A', 'metalica', 'azul', 'negro claro', 78.45, '0.6', '0.5', 3),
	(4, '21A', 'metalica', 'blanco', 'negro claro', 78.45, '0.6', '0.5', 4),
	(5, '21A', 'metalica', 'blanco', 'transparente', 76.80, '0.7', '0.5', 3),
	(6, 'Sea', 'pasta', 'blanco', 'azul claro', 178.56, '1.6', '1.2', 4)
;


---------
-- TABLE 'pedidos'
---------
 INSERT INTO optica.pedidos VALUES
	(1, 5, 2, '2021-11-26'),
	(2, 1, 2, '2022-06-21'),
	(3, 2, 4, '2022-07-02'),
	(4, 3, 4, '2022-08-22'),
	(5, 4, 3, '2022-09-30'),
	(6, 5, 2, '2022-09-21'),
	(7, 5, 2, '2023-01-19')
;

INSERT INTO optica.detalle_pedidos VALUES
	(1, 5),
	(2, 1),
	(3, 2),
	(4, 3),
	(3, 4),
	(2, 5),
	(6, 5)
;

