# SQL Queerying continued...

- TOP
- CONVERT(Datatype to convert to, Data you want to convert)

### String functions

- Substring(Expression, start, length)
- CHARINDEX(What you are looking for, where)
  - output = index in where
- LEFT/RIGHT(name, 5) for the first or last 5 characters
- LTRIM/RTRIM to remove white spaces left or right of string
- LEN(name)
- REPLACE(name,' ','_')
- UPPER / LOWER

## NOTE TO REMEMBER INDEXING IN SQL STARTS AT 1

### Date functions
- SELECT GETDATE()
  - returns current date and time
- SELECT SYSDATETIME()
  - returns data and time of computer
- DATEADD(mm, 5, OrderDate) AS 'Due_Date'
  - adds 5 months
- DATEDIFF(dd, OrderDate, ShippedDate) AS 'Ship Time'
  - difference in whole days between dates
- YEAR
- DAY
- MONTH

### Case statements
- CASE 
- WHEN
- THEN 
- ELSE
- END AS
- e.g.
```
SELECT OrderDate, ShippedDate,
DATEDIFF(d, OrderDate, ShippedDate) AS 'Diff. order and shipped',
CASE
    WHEN DATEDIFF(d, OrderDate, ShippedDate) < 10 THEN 'On Time'
    WHEN DATEDIFF(d, OrderDate, ShippedDate) < 12 THEN 'Slightly Overdue'
    ELSE 'Overdue'
    END
AS 'Status of Order'
FROM Orders;
```

### Aggregate functions
- SUM
- AVG
- MIN
- MAX
- COUNT
- GROUP BY
  - any values in that column that are the same get grouped together
e.g 
```
SELECT SUM(UnitsOnOrder) AS 'Total On Order',
        AVG(UnitsOnOrder) AS 'Avg On Order',
        MIN(UnitsOnOrder) AS 'Min On Order',
        MAX(UnitsOnOrder) AS 'Max On Order',
        COUNT(UnitsOnOrder) AS 'Number of Order'
FROM Products
GROUP BY SupplierID
ORDER BY 'Total On Order' DESC;
```

### JOINS
- INNER JOIN
```
SELECT *
FROM <tableA>
INNER JOIN <tableB> ON <tableA.column> = <tableb.column>;
```
- FULL JOIN
```
SELECT *
FROM <tableA>
FULL JOIN <tableB> ON <tableA.column> = <tableb.column>;
```
- LEFT JOIN
- RIGHT JOIN
- EXCLUSIVE FULL JOIN
```
SELECT *
FROM <tableA>
FULL JOIN <tableB> ON <tableA.column> = <tableb.column>
WHERE <tableB.column> IS NULL
OR <tableA.column> IS NULL
```
