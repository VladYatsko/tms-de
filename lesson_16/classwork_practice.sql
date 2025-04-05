-- practice task 1
SELECT
	CASE
		WHEN price < 50 THEN 'Under $50'
		WHEN price BETWEEN 50 AND 99 THEN '$50-$99'
		WHEN price BETWEEN 100 AND 199 THEN '$100-$199'
		WHEN price BETWEEN 200 AND 499 THEN '$200-$499'
		ELSE '$500+'
	END AS price_group,
	count(*) AS num_of_entries,
	sum(price) AS sum_by_group,
	avg(price) AS avg_price
FROM
	products
GROUP BY
	price_group;


-- practice with reviews table.
-- count task
SELECT
	COUNT(*) AS num_of_reviews,
	AVG(rating) AS avg_rating,
	(SELECT
		 COUNT(*)
	 FROM
		 reviews
	 WHERE
		 is_verified = 1
	 ) AS num_of_verified
FROM
	reviews;


-- grouping task
SELECT
	rating,
	COUNT(*) AS num_of_reviews,
	AVG(LENGTH(review_text)) AS avg_text_len,
	COUNT(CASE WHEN is_verified = 1 THEN 1 END) AS num_of_verified,
    ROUND(
        COUNT(CASE WHEN is_verified = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS percent_of_verified
FROM
	reviews
GROUP BY
	rating
ORDER BY
	rating ASC;


-- timestamp distribution
WITH reviews_separated AS (
	SELECT
        *,
        CASE strftime('%w', created_at)
            WHEN '0' THEN 'Sunday'
            WHEN '1' THEN 'Monday'
            WHEN '2' THEN 'Tuesday'
            WHEN '3' THEN 'Wednesday'
            WHEN '4' THEN 'Thursday'
            WHEN '5' THEN 'Friday'
            WHEN '6' THEN 'Saturday'
        END AS weekday_name,

        CASE
            WHEN CAST(strftime('%H', created_at) AS INTEGER) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN CAST(strftime('%H', created_at) AS INTEGER) BETWEEN 12 AND 17 THEN 'Day'
            WHEN CAST(strftime('%H', created_at) AS INTEGER) BETWEEN 18 AND 23 THEN 'Evening'
            ELSE 'Night'
        END AS time_of_day
    FROM reviews
)

SELECT
	weekday_name,
	time_of_day,
	COUNT(*) AS num_of_reviews,
	AVG(rating) AS avg_rating,
	ROUND(
        COUNT(CASE WHEN rating = 5 THEN 5 END) * 100.0 / COUNT(*),
        2
    ) AS percent_of_five_star,
    COUNT(CASE WHEN rating IN (1, 2) THEN 1 END) AS num_of_negative
FROM
	reviews_separated
GROUP BY
	weekday_name,
	time_of_day;
