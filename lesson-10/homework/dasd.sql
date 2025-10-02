Easy-Level Tasks (10)

1. Employees – 50000 dan katta maoshlar

SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 50000;


2. Customers × Orders – faqat 2023-yilda

SELECT C.FirstName, C.LastName, O.OrderDate
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 2023;


3. Employees + Departments – hamma xodimlar (NULL bo‘lsa ham)

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;


4. Suppliers + Products – hamma yetkazib beruvchilar

SELECT S.SupplierName, P.ProductName
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID;


5. Orders + Payments – ikkala tomon ham, hatto yo‘q bo‘lsa ham

SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;


6. Employees – manageri bilan

SELECT E.Name AS EmployeeName, M.Name AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;


7. Students – ‘Math 101’ kursiga yozilganlar

SELECT S.Name AS StudentName, C.CourseName
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Math 101';


8. Customers – 3 tadan ortiq item buyurtma qilganlar

SELECT C.FirstName, C.LastName, O.Quantity
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;


9. Employees – Human Resources bo‘limidagi xodimlar

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human Resources';

🟠 Medium-Level Tasks (9)

1. Departmentlarda 5 tadan ko‘p xodimlar

SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Departments D
INNER JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;


2. Hech qachon sotilmagan productlar

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;


3. Buyurtma qilgan mijozlar

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName;


4. Employees + Departments – faqat mos bo‘lganlar

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


5. Bir xil managerga bo‘ysunadigan juftliklar

SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID
FROM Employees E1
INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID < E2.EmployeeID AND E1.ManagerID IS NOT NULL;


6. 2022-yildagi buyurtmalar + mijoz ismi

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;


7. Sales bo‘limi, maoshi > 60000 bo‘lgan xodimlar

SELECT E.Name AS EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales' AND E.Salary > 60000;


8. Orders + Payments – faqat mos kelganlar

SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID;


9. Hech qachon buyurtma qilinmagan productlar

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.ProductID IS NULL;

🔴 Hard-Level Tasks (9)

1. O‘z bo‘limidagi o‘rtacha maoshdan ko‘p oylik oladigan xodimlar

SELECT E.Name AS EmployeeName, E.Salary
FROM Employees E
INNER JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) A ON E.DepartmentID = A.DepartmentID
WHERE E.Salary > A.AvgSalary;


2. 2020-yilgacha bo‘lgan va paymenti yo‘q buyurtmalar

SELECT O.OrderID, O.OrderDate
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE O.OrderDate < '2020-01-01' AND P.OrderID IS NULL;


3. Category yo‘q productlar

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryID IS NULL;


4. Bir xil manager + 60000 dan katta maosh

SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.ManagerID, E1.Salary
FROM Employees E1
INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID < E2.EmployeeID AND E1.Salary > 60000;


5. DepartmentName M bilan boshlansa

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';


6. Sales – summasi 500 dan katta, product bilan

SELECT S.SaleID, P.ProductName, S.SaleAmount
FROM Sales S
INNER JOIN Products P ON S.ProductID = P.ProductID
WHERE S.SaleAmount > 500;


7. ‘Math 101’ ga yozilmagan studentlar

SELECT S.StudentID, S.Name AS StudentName
FROM Students S
WHERE S.StudentID NOT IN (
    SELECT E.StudentID
    FROM Enrollments E
    INNER JOIN Courses C ON E.CourseID = C.CourseID
    WHERE C.CourseName = 'Math 101'
);


8. Payment yo‘q buyurtmalar

SELECT O.OrderID, O.OrderDate, P.PaymentID
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;


9. Electronics yoki Furniture productlari

SELECT P.ProductID, P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');
