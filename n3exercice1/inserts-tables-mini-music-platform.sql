-------
-- Datos dummy modelo relacional n3 mini music platform
-------


-------
-- Artista
-------
INSERT INTO `spotify`.`artistas` (`id_artista`, `nombre`, `imagen`) VALUES 
	(1, 'Santiago García', 'image1.png'),
    (2, 'Andrea Rodríguez', 'image2.png'),
    (3, 'Juan Pérez', 'image3.png'),
    (4, 'Manuel Sánchez', 'image4.png'),
    (5, 'Lucía Gómez', 'image5.png'),
    (6, 'José Martinez', 'image6.png'),
    (7, 'Ana López', 'image7.png'),
    (8, 'Alejandro Torres', 'image8.png'),
    (9, 'Marina Ramírez', 'image9.png'),
    (10, 'Carmen Fernández', 'image10.png');


-------
-- Artistas_relacionados
-------
INSERT INTO `spotify`.`artistas_relacionados` (`id_artista`, `id_artista_relacionado`) VALUES 
	(1, 3),
    (1, 4),
    (1, 6),
    (8, 2),
    (8, 9),
    (3, 1);


-------
-- Álbumes
-------
INSERT INTO `spotify`.`álbumes` (`id_álbum`, `título`, `año_publicación`, `portada`, `artista_id`) VALUES 
	(1, 'Zik and Rap', '2022-01-01', 'example/zikandrap.jpg', 1),
	(2, 'Historias de un Artista', '2021-01-01', 'example/historiasdeunartista.jpg', 2),
	(3, 'Familia', '2020-01-01', 'example/familia.jpg', 3),
	(4, 'Tour de melodias', '2020-01-01', 'example/tourdemelodias.jpg', 4),
	(5, 'Árboles de cristal', '2020-01-01', 'example/arbolescristal.jpg', 5),
	(6, 'Caminante', '2020-01-01', 'example/caminante.jpg', 6),
	(7, 'Fantasía', '2019-01-01', 'example/fantasia.jpg', 7),
	(8, 'Oasis', '2019-01-01', 'example/oasis.jpg', 8),
	(9, 'Vibras', '2018-01-01', 'example/vibras.jpg', 9),
	(10, 'Hip hip! hop!', '2017-01-01', 'example/hiphiphop.jpg', 10);


-------
-- Canciones
-------
INSERT INTO `spotify`.`canciones` (`id_canción`, `título`, `duración`, `reproducciones`, `álbum_id_álbum`) VALUES 
	(1, 'Gato y ratón', '3:47', 2000000, 1),
	(2, 'Saltamontes', '3:33', 1800000, 2),
	(3, 'Zienaga', '3:36', 1500000, 3),
	(4, 'Hasta la Raíz', '3:31', 1300000, 4),
	(5, 'Vivir', '4:14', 1200000, 5),
	(6, 'El Perdón', '3:27', 1100000, 6),
	(7, 'Me Gusta', '2:57', 1000000, 7),
	(8, 'Paraíso', '3:03', 900000, 8),
	(9, 'Sonido de guitarras', '3:35', 800000, 9),
	(10, 'Me Niego', '3:40', 700000, 10);


-------
-- Usuarios
-------
INSERT INTO `spotify`.`usuarios` (`id_usuario`, `email`, `password`, `nombre_usuario`, `fecha_nacimiento`, `sexo`, `país`, `cp`) VALUES 
	(1, 'john.doe@example.com', 'password123', 'John Doe', '1990-01-01', 'M', 'Estados Unidos', '10001'),
	(2, 'jane.doe@example.com', 'password456', 'Jane Doe', '1995-03-14', 'F', 'Canada', 'V5K 0A1'),
	(3, 'james.smith@example.com', 'password789', 'James Smith', '1985-05-21', 'M', 'Inglaterra', 'EC1A 1BB'),
	(4, 'emily.wong@example.com', 'passwordabc', 'Emily Wong', '1998-09-07', 'F', 'Australia', '3000'),
	(5, 'juan.perez@example.com', 'contraseña123', 'Juan Pérez', '1992-12-31', 'M', 'Mexico', '06400'),
	(6, 'maria.garcia@example.com', 'contraseña456', 'María García', '1988-07-15', 'F', 'España', '28001'),
	(7, 'alexander.mueller@example.com', 'passwort123', 'Alexander Müller', '1996-02-28', 'M', 'Alemania', '10117'),
	(8, 'sara.andersson@example.com', 'lösenord123', 'Sara Andersson', '1991-11-11', 'F', 'Suecia', '111 57'),
	(9, 'ana.martinez@example.com', 'unpass123', 'Ana Martínez', '1994-04-05', 'F', 'España', '04519'),
	(10, 'robertohidalgo@example.com', 'muyseguro123', 'Roberto Hidalgo', '1997-08-05', 'M', 'España', '04519');


-------
-- Tarjetas crédito
-------
INSERT INTO `spotify`.`tarjetas_crédito` (`id_tarjeta`, `número_tarjeta`, `caducidad`, `código_seguridad`) VALUES 
	(1, '1234567890123456', '2024-12-31', '123'),
	(2, '9876543210987654', '2025-06-30', '456'),
	(3, '1111222233334444', '2023-09-30', '789'),
	(4, '5555666677778888', '2026-03-31', '234'),
	(5, '4444333322221111', '2023-12-31', '567'),
	(6, '9999888877776666', '2024-08-31', '890'),
	(7, '2222111133334444', '2022-11-30', '123'),
	(8, '7777666655554444', '2025-05-31', '456'),
	(9, '8888777766665555', '2023-10-31', '789'),
	(10, '3333222211110000', '2026-01-31', '234');


-------
-- Paypal
-------
INSERT INTO `spotify`.`paypal` (`id_paypal`, `nombre_usuario`) VALUES 
	(1, 'john.doe@example.com'),
	(2, 'jane.doe@example.com'),
	(3, 'james.smith@example.com'),
	(4, 'emily.wong@example.com'),
	(5, 'juan.perez@example.com');
	

-------
-- Usuarios premium
-------
INSERT INTO `spotify`.`usuarios_premium` (`id_usuario`, `id_tarjeta`, `id_paypal`) VALUES 
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, NULL),
	(4, NULL, 3),
	(5, 4, 4),
	(6, null, 5),
	(7, 5, null);


-------
-- Suscripciones
-------
INSERT INTO `spotify`.`suscripciones` (`id_suscripción`, `fecha_inicio`, `fecha_renovación`, `método_pago`, `id_usuario`) VALUES 
	(1, '2022-01-01', '2022-02-01', 'paypal', 3),
	(2, '2022-02-15', '2022-03-15', 'paypal', 4),
	(3, '2022-03-31', '2022-04-30', 'tarjeta_credito', 1),
	(4, '2022-06-15', '2022-07-15', 'paypal', 2),
	(5, '2022-03-07', '2022-04-08', 'tarjeta_credito', 2),
	(6, '2022-08-12', '2022-09-13', 'paypal', 3),
	(7, '2022-04-26', '2022-05-27', 'paypal', 5);


-------
-- Pagos
-------
INSERT INTO `spotify`.`pagos` (`número_orden`, `fecha`, `id_usuario`, `id_suscripción`, `total`) VALUES 
	(1, '2022-01-01', 1, 3, 6.50),
	(2, '2022-02-15', 4, 2, 6.50),
	(3, '2022-03-31', 3, 1, 6.50),
	(4, '2022-06-15', 2, 4, 6.50),
	(5, '2022-03-07', 2, 5, 6.50),
	(6, '2022-08-12', 3, 6, 6.50),
	(7, '2022-04-26', 5, 7, 6.50);


-------
-- Playlist
-------
INSERT INTO `spotify`.`playlist` (`id_playlist`, `título`, `número_canciones`, `fecha_creación`, `fecha_inactiva`, `fk_usuario`) VALUES 
	(1, 'Summer Hits', 20, '2022-06-01', NULL, 1),
	(2, 'Road Trip', 15, '2021-08-15', NULL, 2),
	(3, 'Chillout', 12, '2022-01-01', '2022-02-28', 1),
	(4, 'Throwback Classics', 25, '2021-03-10', NULL, 2),
	(5, 'Workout Mix', 18, '2022-02-15', NULL, 3),
	(6, 'Study Tunes', 10, '2021-09-01', '2022-12-31', 3);


-------
-- Playlist tiene canciones
-------
INSERT INTO `spotify`.`playlist_tiene_canciones` (`id_playlist`, `id_canción`) VALUES 
	(1, 2),
	(1, 4),
	(1, 6),
	(1, 7),
	(1, 8),
	(2, 1),
	(2, 3),
	(2, 2),
	(2, 6),
	(3, 7),
	(3, 10),
	(4, 9),
	(4, 5),
	(5, 5),
	(5, 6),
	(6, 10),
	(6, 8);


-------
-- Playlist compartidas
-------
INSERT INTO `spotify`.`playlist_compartidas` (`id_playlist`, `id_usuario`, `id_canción`, `fecha`) VALUES 
	(1, 3, 10, '2022-07-18'),
	(1, 6, 1, '2022-09-23'),
	(5, 8, 9, '2022-03-12'),
	(5, 2, 3, '2022-10-11'),
	(4, 1, 10, '2021-12-10');


-------
-- Usuarios siguen artistas
-------
INSERT INTO `spotify`.`usuarios_siguen_artistas` (`id_usuario`, `id_artista`) VALUES 
	(2, 4),
	(2, 6),
	(2, 9),
	(4, 4),
	(4, 3),
	(6, 4),
	(6, 10),
	(1, 2),
	(1, 5),
	(8, 9),
	(8, 6);


-------
-- Álbumes favoritos de los usuarios
-------
INSERT INTO `spotify`.`álbumes_favoritos_usuarios` (`id_usuario`, `id_álbum`) VALUES 
	(2, 4),
	(2, 6),
	(2, 9),
	(4, 4),
	(4, 3),
	(6, 4),
	(6, 10),
	(1, 2),
	(1, 5),
	(8, 9),
	(8, 6);


-------
-- Canciones favoritas de usuarios
-------
INSERT INTO `spotify`.`canciones_favoritas_usuarios` (`id_usuario`, `id_canción`) VALUES 
	(2, 4),
	(2, 6),
	(2, 9),
	(4, 4),
	(4, 3),
	(6, 4),
	(6, 10),
	(1, 2),
	(1, 5),
	(8, 9),
	(8, 6);


