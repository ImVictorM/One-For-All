SELECT
	COUNT(played_history.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.played_history
INNER JOIN SpotifyClone.`user`
	ON `user`.id = played_history.user_id
WHERE `user`.full_name LIKE 'Barbara Liskov';
