-------
-- Consultas de ejemplo de la mini bbdd tipo spotify
-------

-- Lista los usuarios que son suscriptores
SELECT u.nombre_usuario FROM usuarios_premium up 
INNER JOIN usuarios u ON u.id_usuario = up.id_usuario;

-- Lista las canciones de una playlist, no inactiva, específica
SELECT C.título FROM canciones c
INNER JOIN playlist_tiene_canciones plc ON plc.id_canción = c.id_canción
INNER JOIN playlist p ON p.id_playlist = plc.id_playlist
WHERE p.fecha_inactiva IS NULL;

-- Lista los álbumes que han sido marcados por algún usuario como favorito
SELECT a.título FROM álbumes a INNER JOIN álbumes_favoritos_usuarios f 
ON a.id_álbum = f.id_álbum;

