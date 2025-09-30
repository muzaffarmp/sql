-- 1
SELECT MIN(Price) AS MinPrice FROM Products;

-- 2
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- 3
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 4
SELECT COUNT(DISTINCT Category) AS UniqueCategories FROM Products;

-- 5
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;

-- 6
SELECT AVG(Age) AS AvgAge FROM Employees;

-- 7
SELECT DepartmentName, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentName;

-- 8
SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

-- 9
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

-- 10
SELECT DepartmentName, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;


-- 1
SELECT P.Category,
       SUM(S.SaleAmount) AS TotalSales,
       AVG(S.SaleAmount) AS AvgSales
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.Category;

-- 2
SELECT COUNT(*) AS NumEmployees
FROM Employees
WHERE DepartmentName = 'HR';

-- 3
SELECT DepartmentName,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DepartmentName;

-- 4
SELECT DepartmentName,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName;

-- 5
SELECT DepartmentName,
       AVG(Salary) AS AvgSalary,
       COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DepartmentName;

-- 6
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

-- 7
SELECT YEAR(SaleDate) AS SaleYear,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

-- 8
SELECT CustomerID, COUNT(*) AS OrdersCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;

-- 9
SELECT DepartmentName,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;



-- 1
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;

-- 2
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;

-- 3
SELECT DepartmentName,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;

-- 4 (TSQL2012 baza kerak bo‘ladi, lekin umumiy ko‘rinishi)
SELECT CustomerID,
       SUM(Freight) AS TotalFreight,
       MIN(Freight) AS LeastFreight
FROM TSQL2012.Sales.Orders
WHERE Freight > 50
GROUP BY CustomerID;

-- 5
SELECT YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth,
       SUM(TotalAmount) AS TotalSales,
       COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;

-- 6
SELECT YEAR(OrderDate) AS OrderYear,
       MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate);

