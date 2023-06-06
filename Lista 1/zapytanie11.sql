SELECT DISTINCT BillingCity 
FROM(	
	SELECT SUM(total) AS cnt , BillingCity AS bil
	FROM invoice
	GROUP BY BillingCity
	) randomSum
JOIN invoice ON randomSum.bil=invoice.BillingCity
GROUP BY cnt DESC
LIMIT 1;