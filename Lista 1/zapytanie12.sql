SELECT DISTINCT BillingCountry , av
FROM(
	SELECT AVG(total) AS av , BillingCountry AS bil
	FROM invoice
	GROUP BY BillingCountry
	) randomAverage
JOIN invoice ON randomAverage.bil=invoice.BillingCountry;