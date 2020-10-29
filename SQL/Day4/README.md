# SQL recap, JOIN, and Subqueries 

- ```sql
	UPDATE <table1>
	SET <column = new_value>, <other changes>
	WHERE <condition>
```

- ```sql
	FORMAT(DATE,dd/mm/yyyy)
```

# SubQueries
- A Subquery is a nested query inside another select statement
- This allows for you to take the results of one query and apply them to another query

- A subquery may occur in any of the following clauses:
  - SELECT (nested subquery  returns single value only)
  - FROM (inline view)
  - WHERE (nested Subquery)

#### examples
- This selects the customer ID's that were not in the orders table
```sql
SELECT <CompanyName> AS <'Customer'>
FROM <Customers>
WHERE <CustomerID> NOT IN
	(SELECT <CustomerID> FROM <Orders>);
```

- Subquery shows the max price from products table but for each of the rows
```sql
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount,
	(SELECT MAX(UnitPrice) FROM Products) AS 'Max Price of Product'
FROM [Order Details];
```
