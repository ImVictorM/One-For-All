-- ref https://database.guide/4-functions-to-format-a-number-to-2-decimal-places-in-sql-server/

SELECT
	CAST(MIN(plan.price) AS DECIMAL(3, 2)) AS faturamento_minimo,
  CAST(MAX(plan.price) AS DECIMAL(3, 2)) AS faturamento_maximo,
  CAST(AVG(plan.price) AS DECIMAL(3, 2)) AS faturamento_medio,
	CAST(SUM(plan.price) AS DECIMAL(4, 2)) AS faturamento_total
FROM SpotifyClone.plan AS plan
INNER JOIN SpotifyClone.`user` AS `user`
	ON `user`.plan_id = plan.id;
