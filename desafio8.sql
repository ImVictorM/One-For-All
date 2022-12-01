SELECT
	artist.artistic_name AS artista,
  alb.title AS album
FROM SpotifyClone.artist AS artist
INNER JOIN SpotifyClone.album AS alb
	ON alb.artist_id = artist.id
WHERE artist.artistic_name LIKE 'Elis Regina'
ORDER BY album ASC;
