SELECT
	artist.artistic_name AS artista,
  alb.title AS album,
  COUNT(`follows`.artist_id) AS seguidores
FROM SpotifyClone.artist AS artist
INNER JOIN SpotifyClone.album AS alb
	ON alb.artist_id = artist.id
INNER JOIN SpotifyClone.`follows` AS `follows`
	ON `follows`.artist_id = artist.id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;
