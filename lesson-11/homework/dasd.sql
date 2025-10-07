EASY LEVEL (7 ta topshiriq)

1️⃣
Show all orders placed after 2022

SELECT O.OrderID, CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderDate
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) > 2022;


2️⃣
Display employees who work in either the Sales or Marketing department

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('Sales', 'Marketing');


3️⃣
Show the highest salary for each department

SELECT D.DepartmentName, MAX(E.Salary) AS MaxSalary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;


4️⃣
List all customers from the USA who placed orders in the year 2023

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderID, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.Country = 'USA' AND YEAR(O.OrderDate) = 2023;


5️⃣
Show how many orders each customer has placed

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);


6️⃣
Display products supplied by Gadget Supplies or Clothing Mart

SELECT P.ProductName, S.SupplierName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName IN ('Gadget Supplies', 'Clothing Mart');


7️⃣
For each customer, show their most recent order (including those with none)

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, MAX(O.OrderDate) AS MostRecentOrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);

🟠 MEDIUM LEVEL (6 ta topshiriq)

1️⃣
Show customers who placed an order where total amount > 500

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.TotalAmount AS OrderTotal
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.TotalAmount > 500;


2️⃣
List product sales where sale was made in 2022 or amount > 400

SELECT P.ProductName, S.SaleDate, S.SaleAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE YEAR(S.SaleDate) = 2022 OR S.SaleAmount > 400;


3️⃣
Display each product with total sales amount

SELECT P.ProductName, SUM(S.SaleAmount) AS TotalSalesAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductName;


4️⃣
Employees in HR with salary > 60000

SELECT E.Name AS EmployeeName, D.DepartmentName, E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human Resources' AND E.Salary > 60000;


5️⃣
Products sold in 2023 and stock > 100

SELECT P.ProductName, S.SaleDate, P.StockQuantity
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE YEAR(S.SaleDate) = 2023 AND P.StockQuantity > 100;


6️⃣
Employees in Sales or hired after 2020

SELECT E.Name AS EmployeeName, D.DepartmentName, E.HireDate
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales' OR YEAR(E.HireDate) > 2020;

🔴 HARD LEVEL (7 ta topshiriq)

1️⃣
Orders made by USA customers with address starting with 4 digits

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderID, C.Address, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.Country = 'USA' AND C.Address LIKE '[0-9][0-9][0-9][0-9]%';


2️⃣
Product sales for Electronics or SaleAmount > 350

SELECT P.ProductName, P.Category, S.SaleAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE P.Category = 'Electronics' OR S.SaleAmount > 350;


3️⃣
Number of products in each category

SELECT C.CategoryName, COUNT(P.ProductID) AS ProductCount
FROM Products P
JOIN Categories C ON P.Category = C.CategoryID
GROUP BY C.CategoryName;


4️⃣
Orders from Los Angeles with amount > 300

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, C.City, O.OrderID, O.TotalAmount AS Amount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.City = 'Los Angeles' AND O.TotalAmount > 300;


5️⃣
Employees in HR or Finance, or whose name has 4+ vowels

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('Human Resources', 'Finance')
   OR LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(E.Name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) <= LEN(E.Name) - 4;


6️⃣
Employees in Sales or Marketing with salary > 60000

SELECT E.Name AS EmployeeName, D.DepartmentName, E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('Sales', 'Marketing') AND E.Salary > 60000;
