-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.

-- SELECT * FROM sales JOIN employees ON sales.SalesPersonID = employees.EmployeeID Join products ON sales.ProductID = products.ProductID;
-- SELECT * FROM sales CROSS JOIN employees ON sales.SalesPersonID = employees.EmployeeID CROSS JOIN products ON sales.ProductID = products.ProductID;
 
-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!

-- CREATE VIEW all_sales AS SELECT employees.EmployeeID, employees.FirstName, employees.MiddleInitial, employees.LastName, sales.SalesID, sales.ProductID, products.Name, products.Price, sales.Quantity, sales.CustomerID FROM sales JOIN employees ON sales.SalesPersonID = employees.EmployeeID JOIN products ON sales.ProductID = products.ProductID;

-- 2b. Test your View by selecting all rows and columns from the View

-- SELECT * FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person

-- SELECT EmployeeID, FirstName, ROUND(AVG(Price * Quantity), 2) AS AverageSaleAmount FROM all_sales GROUP BY EmployeeID, FirstName ORDER BY EmployeeID;

-- Problem 4
-- Find the top three sales persons by total sales

-- SELECT EmployeeID, FirstName, ROUND((SUM(price * Quantity)), 2) AS TotalSales FROM all_sales GROUP BY EmployeeID, FirstName ORDER BY TotalSales DESC LIMIT 3;

-- Problem 5
-- Find the product that has the highest price

SELECT Name, Price FROM all_sales ORDER BY Price DESC LIMIT 1;
 
-- Problem 6
-- Find the product that was sold the most times

-- SELECT Name, SUM(Quantity) AS TimesSold FROM all_sales GROUP BY Name ORDER BY TimesSold DESC LIMIT 1;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

-- SELECT Name, Price, Quantity FROM all_sales WHERE Price > (SELECT AVG(Price) FROM all_sales) GROUP BY Name,Price, Quantity ORDER BY Price DESC;

-- Problem 8
-- Find the customer who spent the most money in purchased products

-- SELECT CustomerID, ROUND(SUM(Price * Quantity), 2) AS MoneySpent FROM all_sales GROUP BY CustomerID ORDER BY MoneySpent DESC;

-- Problem 9
-- Find the total number of sales for each sales person

-- SELECT EmployeeID, SUM(price * quantity) AS TotalSales FROM all_sales GROUP BY EmployeeID;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

-- SELECT EmployeeID, FirstName, MiddleInitial, LastName, CustomerID, ROUND(SUM(Price * Quantity), 2) AS MoneySpent FROM all_sales GROUP BY EmployeeID, FirstName, MiddleInitial, LastName, CustomerID ORDER BY MoneySpent DESC LIMIT 1;