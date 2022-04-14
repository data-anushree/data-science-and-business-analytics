--Q1

SELECT count(QuantityAvailable) FROM Products;
SELECT * FROM Products
GROUP BY QuantityAvailable ORDER BY QuantityAvailable DESC LIMIT 3


--Q2

SELECT EmailId, sum (QuantityPurchased) FROM PurchaseDetails
GROUP BY EmailId HAVING sum (QuantityPurchased)>10
ORDER BY sum (QuantityPurchased) DESC;


--Q3

SELECT Categories. CategoryName, Products. CategoryId, sum (QuantityAvailable) FROM Categories
INNER JOIN Products ON Categories.CategoryId = Products.CategoryId
GROUP BY CategoryName ORDER BY sum (QuantityAvailable) DESC;


--Q4

SELECT Categories. CategoryName, Products. ProductName, PurchaseDetails. ProductId, sum (QuantityPurchased) FROM Categories
INNER JOIN Products ON Categories.CategoryId = Products.CategoryId
INNER JOIN PurchaseDetails ON Products.ProductId = PurchaseDetails.ProductId
GROUP BY ProductName HAVING max (QuantityPurchased) ORDER BY sum (QuantityPurchased) DESC;


--Q5

SELECT Roles.RoleName, USERS. RoleId, count(Gender), Gender FROM Users
INNER JOIN Roles ON Users. RoleId = Roles.RoleId
GROUP BY GENDER ORDER BY count (Gender) DESC;


--Q6

SELECT ProductId, ProductName, Price,
CASE 
WHEN Price < 2000 THEN 'Affordable'
WHEN Price between 2000 and 50000 THEN 'HIGH END STUFF'
ELSE 'LUXURY'
END AS Item_Class
FROM Products
ORDER BY Price DESC;



