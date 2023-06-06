SELECT employee.FirstName , employee.LastName
FROM employee
Except 
SELECT employee.FirstName , employee.LastName 
From employee JOIN customer ON employee.City=customer.City;