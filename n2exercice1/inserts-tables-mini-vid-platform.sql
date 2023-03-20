------
-- Datos dummy para el modelo tipo mini video platform
------


------
-- Usuarios
------
INSERT INTO `youtube`.`usuarios` (`id_usuario`, `email`, `password`, `nombre_usuario`, `fecha_nacimiento`, `sexo`, `país`, `cp`) VALUES 
    (1, 'mpascual@mail.com', '322321', 'Pascu', '1992-09-22', 'm', 'España', '30422'),
    (2, 'laraValen@gmail.com', 'password456', 'lara', '1995-03-10', 'f', 'España', '24590'),
    (3, 'alex_33@gmail.com', '34892_aa', 'Alexus', '1995-03-10', 'm', 'España', '03412'),
    (4, 'jhonroberts@gmail.com', 'onepassword', 'jhonbert', '1995-03-10', 'm', 'Canadá', 'Av3 34'),
    (5, 'laravalen@gmail.com', 'p34aess99', 'lara', '1995-03-10', 'f', 'Andorra', '24590'),
    (6, 'valeria_gb@gmail.com', 'passvalexc', 'ValeriTech', '1995-03-10', 'f', 'Italia', '332221'),
    (7, 'egamez@gmail.com', '83-daee-b', 'Ezequiel', '1995-03-10', 'm', 'España', '08343'),
    (8, 'jaimelc@gmail.com', 'lwdee1234', 'Chef_jaime', '1995-03-10', 'm', 'Andorra', '24590'),
    (9, 'saralops@gmail.com', 'imenrsk_3t3', 'salops', '1995-03-10', 'f', 'Francia', '444333'),
    (10, 'victorsici@gmail.com', 'password876', 'in_victus', '1995-03-10', 'm', 'Italia', '2334');


------
-- Canales
------
INSERT INTO `youtube`.`canales` (`id_usuario`, `nombre`, `descripción`, `fecha_creación`) VALUES 
    (1, 'Final Games', 'Todo relacionado con videojuegos', '2022-10-03'),
    (2, 'TechTuts', 'Canal con tutoriales técnicos sobre tecnología', '2021-01-01'),
    (3, 'Cocinando con Jaime', 'Canal de cocina con Jaime Oliver', '2020-05-15'),
    (4, 'The Fitness Hub', 'A fitness channel with workout videos', '2019-11-01'),
    (5, 'Tus mascotas', 'Descubre los mejores cuidados para tus mascotas', '2022-02-14'),
    (6, 'Gaming Central', 'Reviews sobre las novedades del mundo gamimg', '2018-09-30');


------
-- Suscripciones
------
INSERT INTO `youtube`.`suscripciones` (`usuarios_id_usuario`, `canales_id_usuario`) VALUES 
    (1, 2),
    (3, 6),
    (4, 1);


------
-- Videos
------
INSERT INTO `youtube`.`videos` (`id_video`, `título`, `descripción`, `tamaño`, `nombre`, `duración`, `thumbnail`,`estado`,`reproducciones`, `likes`, `dislikes`, `fecha_publicación`, `id_usuario`) VALUES 
    (1, 'Receta de pasta con salsa de tomate', 'Aprende a cocinar una deliciosa pasta con una salsa de tomate y albahaca fresca', 43.3, 'receta_122.mp4', 34.3, 'default_thumbnail.png', 'PUBLICO', '455', '46', '2', '2021-03-23', 8),
    (2, 'Mejores juegos de aventuras', '¡Descubre los mejores juegos de aventuras para jugar en tu tiempo libre!', 97.3, 'best_games_2021.mp4', 15.4, 'default_thumbnail.png', 'PUBLICO', '1220', '148', '12', '2021-07-09', 1),
    (3, 'Funny Cat Videos Compilation', 'Get ready for some hilarious cat antics in this compilation video', 86.0, 'catscats.mp4', 12.1, 'default_thumbnail.png', 'PUBLICO', '650', '300', '3', '2022-02-21', 9),
    (4, 'Gameplay Walkthrough: Cyberpunk 2077', 'Join us as we explore this futuristic world',72.0, 'ciber_ver2.mp4', 36.7, 'default_thumbnail.png', 'PUBLICO', '2170', '600', '65', '2022-06-30', 6),
    (5, 'Funny Cat Videos Compilation', 'Get ready for some hilarious cat antics in this compilation video', 86.0, 'catscats.mp4', 12.1, 'default_thumbnail.png', 'PUBLICO', '650', '300', '3', '2022-11-22', 3),
    (6, 'Nuevas funcionalidades del modelo sample1', 'El sample1 aparece con interesantes novedades.', 74.1, 'newtech.mp4', 12.3, 'default_thumbnail.png', 'PUBLICO', '435', '32', '1', '2023-02-14', 4);


------
-- Etiquetas
------
INSERT INTO `youtube`.`etiquetas` (`id_etiqueta`, `nombre`) VALUES
    (1, 'gaming'),
    (2, 'entertainment'),
    (3, 'music'),
    (4, 'technologies');


------
-- Video_etiqueta
------
INSERT INTO `youtube`.`video_etiqueta` (`etiquetas_id_etiqueta`, `videos_id_video`) VALUES
    (1, 1),
    (2, 4),
    (3, 6),
    (4, 3);


------
-- Valoración video
------
INSERT INTO `youtube`.`usuario_valoración_video` (`id_usuario`, `id_video`, `valoración`, `fecha_valoración`) VALUES 
    (1, 2, 'like', '2022-10-12'),
    (3, 4, 'like', '2023-01-05'),
    (4, 1, 'like', '2023-02-18');


------
-- Comentarios
------
INSERT INTO `youtube`.`comentarios` (`id_comentario`, `id_usuario`, `id_video`, `comentario`, `fecha`) VALUES 
    (1, 1, 1, 'Comentario 1', '2023-01-02'),
    (2, 2, 2, 'Comentario 2', '2023-01-22'),
    (3, 6, 4, 'Comentario 3', '2023-02-18');


------
-- Usuarios_valoración_comentarios
------
INSERT INTO `youtube`.`usuarios_valoración_comentarios` (`id_usuario`, `id_comentario`, `valoración`, `fecha`) VALUES 
    (1, 1, 'LIKE', '2023-01-02'),
    (2, 2, 'LIKE', '2023-01-22'),
    (3, 3, 'LIKE', '2023-02-18');



------
-- Lista_reproducción
------
INSERT INTO `youtube`.`lista_reproducción` (`id_lista`, `nombre`, `fecha_creación`, `es_privada`, `id_usuario`) VALUES
    (1, 'risas y demás', '2022-04-17', 1, 1),
    (2, 'juegos multiplayer', '2022-09-24', 0, 3),
    (3, 'Tutoriales programación', '2022-09-23', 1, 4);


------
-- Lista_reproducción_has_videos
------
INSERT INTO `youtube`.`lista_tiene_videos` (`lista_reproducción_id_lista`, `videos_id_video`) VALUES
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5);

