SELECT
	music.title AS nome,
  COUNT(played_history.music_id) AS reproducoes
FROM SpotifyClone.music AS music
INNER JOIN SpotifyClone.played_history AS played_history
	ON played_history.music_id = music.id
INNER JOIN SpotifyClone.`user` AS `user`
	ON `user`.id = played_history.user_id
INNER JOIN SpotifyClone.plan AS plan
	ON plan.id = `user`.plan_id
WHERE plan.`type` IN ('gratuito', 'pessoal')
GROUP BY nome
ORDER BY nome ASC;
