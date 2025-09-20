Easy-Level Tasks (10)
1. Define and explain the purpose of BULK INSERT
-- BULK INSERT is used to quickly load large amounts of data from a file (e.g., .csv or .txt) into a SQL Server table.
-- It's faster than row-by-row inserts and is useful for importing flat files.

2. List four file formats that can be imported into SQL Server
1. CSV (.csv)
2. Text files (.txt)
3. Excel files (.xls, .xlsx)
4. XML files (.xml)

3. Create a table Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

4. Insert three records
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1000.00),
(2, 'Keyboard', 50.00),
(3, 'Mouse', 25.00);

5. Difference between NULL and NOT NULL
-- NULL means a column can have missing or unknown values.
-- NOT NULL ensures a column must always have a value (cannot be empty).

6. Add UNIQUE constraint to ProductName
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7. Write a comment in a SQL query
-- This query selects all products with price above 100
SELECT * FROM Products WHERE Price > 100;

8. Add CategoryID column
ALTER TABLE Products
ADD CategoryID INT;

9. Create Categories table with PK and UNIQUE
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

10. Purpose of IDENTITY column
-- IDENTITY auto-generates sequential values for a column, often used for primary keys.
-- Example: IDENTITY(1,1) starts at 1 and increases by 1.

✅ 🟠 Medium-Level Tasks (10)
1. Use BULK INSERT to import data
-- Make sure the file path is accessible and trusted.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row
);

2. Create FOREIGN KEY in Products referencing Categories
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

3. Difference between PRIMARY KEY and UNIQUE KEY
-- PRIMARY KEY: Uniquely identifies each row, cannot contain NULLs, only one per table.
-- UNIQUE KEY: Also enforces uniqueness but can allow one NULL, and a table can have multiple unique constraints.

4. Add CHECK constraint for Price > 0
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

5. Add column Stock (NOT NULL)
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

6. Use ISNULL to replace NULL in Price
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

7. Purpose and usage of FOREIGN KEY
-- A FOREIGN KEY ensures referential integrity between two tables.
-- It links a column in one table to the primary key in another, preventing invalid data entry.

✅ 🔴 Hard-Level Tasks (10)
1. Create Customers table with CHECK constraint for Age >= 18
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

2. Create table with IDENTITY column starting at 100, incrementing by 10
CREATE TABLE InvoiceNumbers (
    InvoiceID INT IDENTITY(100,10) PRIMARY KEY,
    InvoiceDate DATE
);

3. Create composite PRIMARY KEY in OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

4. Explain COALESCE vs ISNULL
-- ISNULL(expr, replacement): Replaces NULL with replacement value (only 2 arguments)
-- COALESCE(expr1, expr2, ..., exprN): Returns the first non-NULL value from a list

-- Example:
SELECT ISNULL(NULL, 'Default');     -- Returns 'Default'
SELECT COALESCE(NULL, NULL, 'X');   -- Returns 'X'

5. Create Employees table with PRIMARY and UNIQUE key
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

6. FOREIGN KEY with ON DELETE/UPDATE CASCADE
-- First, parent table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Then, child table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    DeptID INT,
    CONSTRAINT FK_Staff_Departments FOREIGN KEY (DeptID)
        REFERENCES Departments(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
