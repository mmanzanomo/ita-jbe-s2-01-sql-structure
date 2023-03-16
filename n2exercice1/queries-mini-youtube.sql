-- Lista los usuarios que tienen creado un canal.
SELECT u.nombre_usuario, c.nombre  FROM usuarios u 
INNER JOIN canales c ON c.id_canal = u.fk_canal
WHERE fk_canal IS NOT NULL;

-- Lista los videos que se encuentran en una lista de reproducción específica.
SELECT v.título, l.nombre as lista_reproducción FROM  lista_reproducción l 
INNER JOIN lista_reproducción_has_videos lv ON l.id_lista = lv.lista_reproducción_id_lista
INNER JOIN videos v ON lv.videos_id_video = v.id_video
WHERE id_lista = 1;
