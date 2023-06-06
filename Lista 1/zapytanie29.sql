DELETE FROM customer 
WHERE customer.CustomerId IN (
	SELECT cu.CustomerId
	FROM customer AS cu Left JOIN invoice AS inv ON cu.CustomerId=inv.CustomerId
	WHERE inv.InvoiceId IS NULL
);
