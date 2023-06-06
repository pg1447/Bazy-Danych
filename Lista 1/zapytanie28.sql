DELETE FROM invoiceline
WHERE invoiceline.InvoiceId IN (
SELECT InvoiceId
FROM invoice
WHERE invoice.InvoiceDate<'2010-01-01 00:00:00'
);
DELETE FROM invoice 
WHERE invoice.InvoiceDate<'2010-01-01 00:00:00';
