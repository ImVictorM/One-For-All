-- ref https://stackoverflow.com/questions/606234/select-count-from-multiple-tables
SELECT (
	SELECT COUNT(*)
	FROM SpotifyClone.music
) AS cancoes,
(
	SELECT COUNT(*)
	FROM SpotifyClone.artist
) AS artistas,
(
	SELECT COUNT(*)
	FROM SpotifyClone.album
) AS albuns;
