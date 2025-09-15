-- Create and use the database
CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE BookstoreDB;

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(6,2),
    QuantityInStock INT
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Sales table
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    SaleDate DATE,
    QuantitySold INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Books
INSERT INTO Books (BookID, Title, Author, Genre, Price, QuantityInStock) VALUES
(1, '1984', 'George Orwell', 'Dystopian', 9.99, 100),
(2, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 8.99, 50),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 7.99, 80);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
(101, 'Alice', 'Johnson', 'alice@example.com'),
(102, 'Bob', 'Smith', 'bob@example.com');

-- Insert sample data into Sales
INSERT INTO Sales (SaleID, BookID, CustomerID, SaleDate, QuantitySold) VALUES
(1001, 1, 101, '2025-09-01', 1),
(1002, 2, 102, '2025-09-05', 2);

-- Update stock after a sale
UPDATE Books
SET QuantityInStock = QuantityInStock - 1
WHERE BookID = 1;

-- Update customer email
UPDATE Customers
SET Email = 'alice.johnson@example.com'
WHERE CustomerID = 101;

-- Transaction block
START TRANSACTION;

-- Add a new sale
INSERT INTO Sales (SaleID, BookID, CustomerID, SaleDate, QuantitySold)
VALUES (1003, 3, 102, '2025-09-15', 1);

-- Update book stock
UPDATE Books
SET QuantityInStock = QuantityInStock - 1
WHERE BookID = 3;

-- Commit the transaction
COMMIT;

-- Select all records from each table
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Sales;

