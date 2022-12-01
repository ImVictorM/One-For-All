-- ref https://stackoverflow.com/questions/4172195/mysql-like-multiple-values

SELECT
	music.title AS nome_musica,
  CASE
		WHEN music.title LIKE '%Bard%' THEN REPLACE(music.title, 'Bard', 'QA')
    WHEN music.title LIKE '%Amar%' THEN REPLACE(music.title, 'Amar', 'Code Review')
    WHEN music.title LIKE '%Pais%' THEN REPLACE(music.title, 'Pais', 'Pull Requests')
    WHEN music.title LIKE '%SOUL%' THEN REPLACE(music.title, 'SOUL', 'CODE')
    ELSE REPLACE(music.title, 'SUPERSTAR', 'SUPERDEV')
	END AS novo_nome
FROM SpotifyClone.music
WHERE music.title REGEXP 'Bard|Amar|Pais|SOUL|SUPERSTAR'
ORDER BY nome_musica DESC;
