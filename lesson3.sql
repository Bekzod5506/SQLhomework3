create database Sql_lesson3

use Sql_lesson3


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

   insert into Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) 
   values
(1, 'John', 'Smith', 'IT', 5200.00, '2020-03-15'),
(2, 'Emily', 'Johnson', 'HR', 4300.50, '2019-07-22'),
(3, 'Michael', 'Brown', 'Finance', 6100.75, '2021-01-10'),
(4, 'Sarah', 'Davis', 'Marketing', 4800.00, '2018-11-05'),
(5, 'David', 'Wilson', 'IT', 7000.00, '2022-02-18'),
(6, 'Anna', 'Taylor', 'Sales', 4500.25, '2017-06-30'),
(7, 'James', 'Anderson', 'Finance', 6400.00, '2020-09-12'),
(8, 'Olivia', 'Thomas', 'HR', 4200.00, '2019-03-25'),
(9, 'Robert', 'Jackson', 'IT', 7300.50, '2023-04-14'),
(10, 'Sophia', 'White', 'Marketing', 5000.00, '2018-08-19'),
(11, 'Daniel', 'Harris', 'Finance', 6800.00, '2021-10-03'),
(12, 'Mia', 'Martin', 'Sales', 4600.75, '2017-12-11'),
(13, 'William', 'Thompson', 'IT', 7500.00, '2022-05-27'),
(14, 'Ava', 'Garcia', 'HR', 4100.00, '2019-09-08'),
(15, 'Joseph', 'Martinez', 'Marketing', 5300.00, '2020-01-29'),
(16, 'Isabella', 'Robinson', 'Finance', 6200.00, '2021-06-15'),
(17, 'Christopher', 'Clark', 'Sales', 4700.00, '2018-03-21'),
(18, 'Grace', 'Rodriguez', 'IT', 7100.00, '2023-02-10'),
(19, 'Andrew', 'Lewis', 'HR', 4000.00, '2017-05-14'),
(20, 'Chloe', 'Lee', 'Marketing', 4950.50, '2020-12-03');

select * from Employees

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status) 
VALUES
(1, 'John Smith', '2023-01-15', 120.50, 'Pending'),
(2, 'Emily Johnson', '2023-02-10', 89.99, 'Shipped'),
(3, 'Michael Brown', '2023-03-05', 250.00, 'Delivered'),
(4, 'Sarah Davis', '2023-04-12', 75.20, 'Cancelled'),
(5, 'David Wilson', '2023-05-08', 310.40, 'Delivered'),
(6, 'Anna Taylor', '2023-06-03', 150.75, 'Pending'),
(7, 'James Anderson', '2023-07-14', 420.00, 'Shipped'),
(8, 'Olivia Thomas', '2023-08-25', 199.99, 'Delivered'),
(9, 'Robert Jackson', '2023-09-10', 520.60, 'Pending'),
(10, 'Sophia White', '2023-10-02', 340.00, 'Cancelled'),
(11, 'Daniel Harris', '2023-11-19', 180.30, 'Delivered'),
(12, 'Mia Martin', '2023-12-05', 95.80, 'Shipped'),
(13, 'William Thompson', '2024-01-17', 410.00, 'Pending'),
(14, 'Ava Garcia', '2024-02-22', 230.50, 'Delivered'),
(15, 'Joseph Martinez', '2024-03-13', 145.99, 'Shipped'),
(16, 'Isabella Robinson', '2024-04-09', 275.00, 'Pending'),
(17, 'Christopher Clark', '2024-05-15', 360.40, 'Delivered'),
(18, 'Grace Rodriguez', '2024-06-21', 68.99, 'Cancelled'),
(19, 'Andrew Lewis', '2024-07-30', 520.00, 'Shipped'),
(20, 'Chloe Lee', '2024-08-18', 310.80, 'Delivered');

select * from Orders;



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

insert into Products (ProductID, ProductName, Category, Price, Stock) 
values
(1, 'Wireless Mouse', 'Electronics', 19.99, 120),
(2, 'Laptop Backpack', 'Accessories', 34.50, 80),
(3, 'USB-C Charger', 'Electronics', 25.00, 150),
(4, 'Notebook A5', 'Stationery', 3.99, 300),
(5, 'Water Bottle 1L', 'Home', 7.50, 200),
(6, 'Bluetooth Headphones', 'Electronics', 45.90, 60),
(7, 'Desk Lamp LED', 'Home', 18.75, 90),
(8, 'Ballpoint Pen Set', 'Stationery', 5.40, 400),
(9, 'Office Chair', 'Furniture', 120.00, 15),
(10, 'Wireless Keyboard', 'Electronics', 22.80, 110),
(11, 'Coffee Mug Ceramic', 'Home', 6.20, 250),
(12, 'Portable Hard Drive 1TB', 'Electronics', 55.00, 40),
(13, 'Sticky Notes Pack', 'Stationery', 4.20, 350),
(14, 'Smartphone Stand', 'Accessories', 8.99, 180),
(15, 'Gaming Mousepad', 'Accessories', 12.50, 160),
(16, 'Folding Table', 'Furniture', 45.00, 20),
(17, 'LED Monitor 24-inch', 'Electronics', 135.00, 25),
(18, 'Whiteboard Markers', 'Stationery', 3.50, 280),
(19, 'Plastic Storage Box', 'Home', 9.99, 130),
(20, 'Ergonomic Keyboard', 'Electronics', 49.99, 55);

select * from Products;

--task1 

SELECT
    Department,
    AVG(Salary) AS AverageSalary,
    CASE
        WHEN Salary > 80000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM (
    -- SQL Server: use TOP (10) PERCENT with ORDER BY to get top 10% by Salary
    SELECT TOP (10) PERCENT
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary
    FROM Employees
    ORDER BY Salary DESC
) AS TopPaid
GROUP BY
    Department,
    CASE
        WHEN Salary > 80000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END
ORDER BY AverageSalary DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;  

--task 2

SELECT
    OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM (
        SELECT 
            CustomerName,
            OrderDate,
            TotalAmount,
            Status,
            CASE
                WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
                WHEN Status = 'Pending' THEN 'Pending'
                WHEN Status = 'Cancelled' THEN 'Cancelled'
            END AS OrderStatus
        FROM Orders
        WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
     ) AS OrderData
GROUP BY OrderStatus
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;

--task3

SELECT 
    Category,
    ProductName,
    Price,
    Stock,
    IIF(Stock = 0, 'Out of Stock',
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')
    ) AS InventoryStatus
FROM (
        SELECT 
            Category,
            ProductName,
            Price,
            Stock,
            ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS rn
        FROM Products
     ) AS RankedProducts
WHERE rn = 1   
ORDER BY Price DESC
OFFSET 5 ROWS;   














