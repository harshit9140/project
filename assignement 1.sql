Tasks to be Performed:

1. Insert a new record in your Orders table.

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)
INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)
SELECT*FROM Orders
INSERT INTO Orders Values
(5004,2356,108,'2024-03-23',2400)
SELECT*FROM Orders


2. Add Primary key constraint for SalesmanId column in Salesman table. Add default constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the Customer table

CREATE TABLE Salesman (
    SalesmanId INT PRIMARY KEY,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255) DEFAULT 'UNKNOWN',
    Age INT,
);
SELECT*FROM Salesman
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age) VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey',30);
	SELECT*FROM Salesman
CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT PRIMARY KEY ,
    CustomerName VARCHAR(255) NOT NULL,
    PurchaseAmount INT,
	);
	SELECT*FROM Customer
	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount) VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2356, 'Romina', 4000),
    (107, 3747, 'Remona', 2700),
  	(110, 4004, 'Julia', 4545);
	SELECT*FROM Customer
	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount) VALUES
	(113, 1675, 'Aman', 5500),
    (124, 2656, 'kiaan', 4800);
	SELECT*FROM Customer

	3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.
	
	SELECT *FROM Customer WHERE CustomerName LIKE '%N' AND PurchaseAmount > 500;

	4. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, and the other result containing SalesmanId with duplicates from two tables.

	-- First result with unique SalesmanId values
SELECT SalesmanId
FROM Salesman
UNION
SELECT SalesmanId
FROM Customer;

-- Other result containing SalesmanId with duplicates
SELECT SalesmanId
FROM Salesman
UNION ALL
SELECT SalesmanId
FROM Customer;

5. Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.
SELECT o.Orderdate,
       s.Name AS "Salesman Name",
       c.CustomerName AS "Customer Name",
       s.Commission,
       s.City
FROM Orders o
JOIN Salesman s ON o.SalesmanId = s.SalesmanId
JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE c.PurchaseAmount BETWEEN 500 AND 1500;


	5. Using right join fetch all the results from Salesman and Orders table.

	SELECT *FROM Salesman
RIGHT JOIN Orders ON Salesman.SalesmanId = Orders.SalesmanId;


