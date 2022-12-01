SELECT 
	music.title AS cancao,
  COUNT(played_history.music_id) AS reproducoes
FROM SpotifyClone.played_history AS played_history
INNER JOIN SpotifyClone.music AS music
	ON music.id = played_history.music_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
