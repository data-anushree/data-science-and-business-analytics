-- Q7

USE fastkart;

SELECT Products.ProductId, ProductName, Categories.CategoryName, Products. Price,
CASE -- CategoryName
WHEN 'Motors' THEN Price -3000
WHEN 'Electronics' THEN Price +50
WHEN 'Fashion' THEN Price +150
-- Rest of the CategoryName
ELSE Price
END AS New_Price
FROM Categories
-- Joined the two tables Products and Categories based on a common entity CategoryaId
INNER JOIN Products ON Categories.CategoryId = Products.CategoryId
ORDER BY Price DESC;


-- Q8

SELECT Gender, 
count( Gender ) AS Total, 
concat(round(((COUNT( Gender ) / (Select COUNT( * ) From Users)) * 100 ),2),'%') AS Percentage
FROM
  Users
WHERE GENDER != 'M' -- Gender is only female not male
GROUP BY
  Gender;


-- Q9

SELECT NameOnCard, CVVNumber, CardType, Balance FROM CardDetails
WHERE CVVNumber>333 AND NameOnCard LIKE '%e' -- Every name ending with 'e'
ORDER BY Balance DESC;


-- Q10

SELECT 
Products.ProductName, Categories.CategoryName, Products.Price*QuantityAvailable AS Value_Item FROM Categories
INNER JOIN Products ON Categories.CategoryId = Products.CategoryId
WHERE CategoryName != 'Motors' -- CategoryName except 'Motors'
ORDER BY Value_Item DESC LIMIT 1,1; -- 2nd highest value
