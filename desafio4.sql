SELECT 
	`user`.full_name AS usuario,
  IF(
		MAX(YEAR(played_date))  >= 2021,
      'Usuário ativo',
      'Usuário inativo'
	) AS status_usuario
FROM SpotifyClone.`user` AS `user`
INNER JOIN SpotifyClone.played_history AS played_history
	ON played_history.user_id = `user`.id
GROUP BY usuario
ORDER BY usuario;
