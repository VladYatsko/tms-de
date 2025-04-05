-- Discount group analysis
SELECT
	CASE
		WHEN discount_percent BETWEEN 1 AND 20 THEN '1-20%'
		WHEN discount_percent BETWEEN 21 AND 50 THEN '21-50%'
		WHEN discount_percent BETWEEN 51 AND 80 THEN '51-80%'
		WHEN discount_percent BETWEEN 81 AND 100 THEN '81-100%'
	END AS discount_group,
	COUNT(*) AS num_of_codes,
	MIN(discount_percent) AS min_discount,
	MAX(discount_percent) AS max_discount,
	COUNT(CASE WHEN max_uses IS NOT NULL THEN 1 END) AS num_of_limited_uses
FROM
	promocodes
GROUP BY
	discount_group;

-- analysis by valid to
SELECT
	CASE
		WHEN CURRENT_TIMESTAMP BETWEEN valid_from AND valid_to THEN 'Active'
		WHEN CURRENT_TIMESTAMP > valid_to THEN 'Expired'
		ELSE 'Not started'
	END AS validity_group,
	COUNT(*) AS num_of_codes,
	ROUND(AVG(discount_percent), 1) AS avg_discount,
	COUNT(CASE WHEN max_uses IS NOT NULL THEN 1 END) AS num_of_limited_uses
FROM
	promocodes
GROUP BY
	validity_group;