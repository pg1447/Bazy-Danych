UPDATE customer,
	(SELECT cntfId.CusId AS CustomerId, cntfId.gen AS FavGenre
   	FROM 
  	 	(
    	  (
    	  SELECT inv.CustomerId AS CusId, COUNT(tr.TrackId) AS cntv, tr.GenreId AS gen
   	   FROM invoice AS inv INNER JOIN invoiceline AS invl ON inv.InvoiceId=invl.InvoiceId
   	   INNER JOIN track AS tr ON tr.TrackId=invl.TrackId
   	   GROUP BY inv.CustomerID, tr.GenreId
   	   ORDER BY inv.CustomerID, cntv DESC
   	   ) AS cntfId
  	     	INNER JOIN
  	  		(
      	SELECT helpful.cId AS CusId, MAX(helpful.cntv) AS maxval 
      	FROM 
     		(
         	SELECT inv.CustomerId AS cId, COUNT(tr.TrackId) AS cntv
         	FROM invoice AS inv INNER JOIN invoiceline AS invl ON inv.InvoiceId=invl.InvoiceId
         	INNER JOIN track AS tr ON tr.TrackId=invl.TrackId
         	GROUP BY inv.CustomerID, tr.GenreId
         	ORDER BY inv.CustomerID, cntv DESC
      	) AS helpful
      	GROUP BY helpful.cId
      	) AS maxc
		ON maxc.CusId=cntfId.CusId
   	)
	WHERE cntfId.cntv=maxc.maxval
   ) AS final
SET customer.FavGenre=final.FavGenre
WHERE customer.CustomerId=final.CustomerId;
