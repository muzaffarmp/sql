Easy-Level Tasks (10)

1. Products × Suppliers – barcha kombinatsiyalar

SELECT P.ProductName, S.SupplierName
FROM Products P
CROSS JOIN Suppliers S;


2. Departments × Employees – barcha kombinatsiyalar

SELECT D.DepartmentName, E.Name AS EmployeeName
FROM Departments D
CROSS JOIN Employees E;


3. Products va Suppliers – haqiqiy yetkazib beruvchi kombinatsiyasi

SELECT S.SupplierName, P.ProductName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;


4. Customers va Orders – mijoz va buyurtma IDlari

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;


5. Students × Courses – barcha kombinatsiyalar

SELECT S.Name AS StudentName, C.CourseName
FROM Students S
CROSS JOIN Courses C;


6. Products va Orders – ProductID mos bo‘lsa

SELECT P.ProductName, O.OrderID
FROM Products P
INNER JOIN Orders O ON P.ProductID = O.ProductID;


7. Departments va Employees – DepartmentID mos kelgan xodimlar

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


8. Students va Enrollments – kursga yozilganlar

SELECT S.Name AS StudentName, E.CourseID
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID;


9. Payments va Orders – mos tushumlar

SELECT O.OrderID, P.PaymentID, P.Amount
FROM Payments P
INNER JOIN Orders O ON P.OrderID = O.OrderID;


10. Orders va Products – narxi > 100 bo‘lganlar

SELECT O.OrderID, P.ProductName, P.Price
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Price > 100;

🟡 Medium-Level Tasks (10)

1. Employees × Departments – IDlari teng bo‘lmagan kombinatsiyalar

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID <> D.DepartmentID;


2. Orders vs Products – Quantity > StockQuantity

SELECT O.OrderID, P.ProductName, O.Quantity, P.StockQuantity
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE O.Quantity > P.StockQuantity;


3. Customers va Sales – SaleAmount >= 500

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, S.ProductID, S.SaleAmount
FROM Customers C
INNER JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.SaleAmount >= 500;


4. Courses, Enrollments, Students – yozilgan kurslari

SELECT S.Name AS StudentName, C.CourseName
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;


5. Products va Suppliers – SupplierName “Tech” bo‘lsa

SELECT P.ProductName, S.SupplierName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName LIKE '%Tech%';


6. Orders va Payments – Payment < TotalAmount

SELECT O.OrderID, O.TotalAmount, P.Amount
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.Amount < O.TotalAmount;


7. Employees va Departments – Employee + DepartmentName

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


8. Products va Categories – Electronics yoki Furniture

SELECT P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');


9. Sales va Customers – faqat USA mijozlari

SELECT S.SaleID, S.SaleAmount, C.FirstName + ' ' + C.LastName AS CustomerName
FROM Sales S
INNER JOIN Customers C ON S.CustomerID = C.CustomerID
WHERE C.Country = 'USA';


10. Orders va Customers – Germany va TotalAmount > 100

SELECT O.OrderID, O.TotalAmount, C.FirstName + ' ' + C.LastName AS CustomerName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Country = 'Germany' AND O.TotalAmount > 100;

🔴 Hard-Level Tasks (5)

1. Employees – turli departmentdagi juftliklar

SELECT E1.Name AS Employee1, D1.DepartmentName AS Dept1,
       E2.Name AS Employee2, D2.DepartmentName AS Dept2
FROM Employees E1
INNER JOIN Employees E2 ON E1.EmployeeID < E2.EmployeeID
INNER JOIN Departments D1 ON E1.DepartmentID = D1.DepartmentID
INNER JOIN Departments D2 ON E2.DepartmentID = D2.DepartmentID
WHERE E1.DepartmentID <> E2.DepartmentID;


2. Payments, Orders, Products – Amount ≠ Quantity × Price

SELECT P.PaymentID, O.OrderID, P.Amount, (O.Quantity * PR.Price) AS ExpectedAmount
FROM Payments P
INNER JOIN Orders O ON P.OrderID = O.OrderID
INNER JOIN Products PR ON O.ProductID = PR.ProductID
WHERE P.Amount <> (O.Quantity * PR.Price);


3. Students – kursga yozilmaganlar

SELECT S.StudentID, S.Name
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.StudentID IS NULL;


4. Employees – Manager bo‘lgan, lekin oyligi <= boshqaradigan odamdan

SELECT M.Name AS ManagerName, M.Salary AS ManagerSalary,
       E.Name AS EmployeeName, E.Salary AS EmployeeSalary
FROM Employees E
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
WHERE M.Salary <= E.Salary;


5. Orders, Payments, Customers – buyurtma qilgan, lekin payment yo‘q

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;
