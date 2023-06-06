SELECT DISTINCT City, Country 
FROM customer
WHERE customer.PostalCode IS NOT NULL;