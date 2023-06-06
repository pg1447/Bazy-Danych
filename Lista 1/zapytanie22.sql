SELECT COUNT(A.dom) AS numb , A.dom AS domain
FROM (	
	(
	Select SUBSTRING_INDEX(customer.Email, '@', -1) AS dom
	FROM customer 
	) AS A
	)
GROUP BY A.dom
ORDER BY numb DESC;