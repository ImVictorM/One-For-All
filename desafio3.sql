SELECT
  `user`.full_name AS usuario,
  COUNT(played_history.user_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(music.seconds) / 60, 2) AS total_minutos
FROM SpotifyClone.`user` AS `user`
INNER JOIN SpotifyClone.played_history AS played_history
	ON played_history.user_id = `user`.id
INNER JOIN SpotifyClone.music AS music
	ON music.id = played_history.music_id
GROUP BY `user`.full_name
ORDER BY `user`.full_name ASC;
