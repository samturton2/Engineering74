-- Getting gross total with order details
SELECT UnitPrice, Quantity, Discount, 
    -- can make Gross total back into price format
    CONVERT(DECIMAL(10,2), UnitPrice * Quantity AS 'Gross Total'),
    UnitPrice * Quantity * (1 - Discount) AS 'Net Total'
FROM [Order Details];

-- highest 10 net total in order details
SELECT TOP 10 OrderID,
    UnitPrice * Quantity * (1-Discount) AS 'Net_Total'
FROM [Order Details]
ORDER BY 'Net_Total' DESC;

-- SQL nested String functions

-- returns UK postal code region, and where white space is in postcode
SELECT PostalCode as 'Post Code',
LEFT(PostalCode, CHARINDEX(' ', PostalCode)-1) AS 'Postal Code Region'
CHARINDEX(' ', PostalCode) AS 'SQL Index of white space'
FROM Customers
WHERE Country = 'UK';

-- select product names with single quote
SELECT ProductName
FROM Products
WHERE CHARINDEX('''', ProductName) != 0;
-- uses '''', becuase 'isn''t' is needed to specify ending of string for isn't

-- return current date
SELECT GETDATE();
SELECT SYSDATETIME();

SELECT OrderDate,
    DATEADD(mm, 5, OrderDate) AS 'Order date + 5 months',
    DATEDIFF(dd, OrderDate, ShippedDate) AS 'Ship Time',
    YEAR(OrderDate),
    MONTH(OrderDate),
    DAY(OrderDate)
FROM Orders;

-- task
SELECT FirstName + ' ' + LastName AS 'Name_', 
DATEDIFF(yy, BirthDate, GETDATE()) AS 'Age_'
FROM Employees;

-- CASE statements
SELECT OrderDate, ShippedDate,
DATEDIFF(d, OrderDate, ShippedDate) AS 'Diff. order and shipped',
CASE
    WHEN DATEDIFF(d, OrderDate, ShippedDate) < 10 THEN 'On Time'
    WHEN DATEDIFF(d, OrderDate, ShippedDate) < 12 THEN 'Slightly Overdue'
    ELSE 'Overdue'
    END
AS 'Status of Order'
FROM Orders;

-- Task
SELECT FirstName + ' ' + LastName AS 'Name_', 
DATEDIFF(yy, BirthDate, GETDATE()) AS 'Age_',
CASE
    WHEN DATEDIFF(yy, BirthDate, GETDATE()) > 65 THEN 'Retired'
    WHEN DATEDIFF(yy, BirthDate, GETDATE()) > 60 THEN 'Retirement due'
    ELSE 'More than 5 years to go'
    END 
AS 'Retirement Status'
FROM Employees;

--  Aggregate Functions
SELECT SUM(UnitsOnOrder) AS 'Total On Order',
        AVG(UnitsOnOrder) AS 'Avg On Order',
        MIN(UnitsOnOrder) AS 'Min On Order',
        MAX(UnitsOnOrder) AS 'Max On Order',
        COUNT(UnitsOnOrder) AS 'Number of Order'
FROM Products
GROUP BY SupplierID
ORDER BY 'Total On Order' DESC;

SELECT * FROM Products;

-- Join example
SELECT TOP 10 OrderID, CustomerID, EmployeeID
FROM Orders;

SELECT TOP 10 EmployeeID, FirstName, LastName
FROM Employees;

SELECT TOP 10 Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Employees.FirstName, Employees.LastName
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;

-- Activity
SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Orders.ShipCity, Orders.ShipCountry
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ShipCountry = 'Brazil'
ORDER BY Customers.CustomerID;
