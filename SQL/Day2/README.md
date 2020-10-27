# Querying an SQL database

## Normal form
Best practices for designing DB

## 1st normal form
- Make everything atomic
  - data presented as small as can be
  - no two data types in one box
- There should be no repeating groups
  - e.g colour1 colour2 should only be colour

## 2nd normal form
- It is in 1st normal form
- All non-key attributes are fully functional dependant on the primary key
  - not composit keys (Single Column Primary Key)

## 3rd normal form
- It is in 2nd normal form
- There is no transitive functional dependency
  - e.g if genre type depends on genre key, put genre key and type in seperate table

## Using SQL as a Tester
- Getting data for testing
- Saving data, generated during testing activity
- Data verifications in databases
- testing databases

## Using SQL as a DevOps Engineer
- Environments will need databases
- Actively look over databases
- Data verifications in databases
- testing databases

## Using SQL as a PMO/BA
- system teams will use databases 
- To analyse data, you will need to be able to retrieve it
- You can build small databases to support prototyping, analysis, data management and reporting.
- It can allow you to help during the test phase
- Helps you understand the data flow, data warehouses and analytical products

## Selecting the data you need

```
SELECT <columns> FROM <table_name> WHERE <where_clause and condition>;

#example
SELECT * FROM Customers WHERE City = 'London';
```
- need condition to be the correct data type
  - no apostrophe for DECIMAL, INT, 

```
-- To count the number of rows fitting your constraint

SELECT COUNT(<columns>) WHERE <condition>;

#To use with distinct
-- Top function
SELECT TOP 5 <Company_name> FROM <Companies>;
-- Count
-- Distinct
```
- To select columns depending on 2 conditions use AND/OR keyword
```
SELECT * FROM <table> WHERE <condition1> AND <condition2>;

#Using distinct gets unique rows/things
SELECT COUNT(DISTINCT animals) FROM eating_things
#returns number of unique animals
```

- Using the LIKE keyword
  - e.g 
```
SELECT ProductName
FROM Products WHERE ProductName LIKE '_h%';

#would return
# - Chocolate
# - sharp
# - whilst
```
- Wild card Characters in SQL
  - %
    - represents more characters
  - _
    - represents single character
    - h_t finds hot hat hut hit
  - []
    - represents any single character within the brackets
    - h[oa]t finds hot and hat
  - ^
    - represents characters not in brackets
    - h[^oa]t finds hit hut
  - -
    - represents range of characters
    - c[a-c]t finds cat and cbt 

## More SQL Keywords

- AS
  - SELECT Friends_id AS 'Friends number in line';
    - changes name of column

- maths functions work
- ORDER BY
- DESC
- ASC
```
ORDER BY UnitPrice * OrderTotal Desc;
```

