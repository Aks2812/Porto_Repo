/* b.Create a database system using DDL syntax that relevant with sales and purchase transactions*/
------------------------------------------------------------------------------------------------
CREATE DATABASE We_Klean
USE We_Klean
------------------------------------------------------------------------------------------------
CREATE TABLE Employee(
	employeeID char(5) NOT NULL PRIMARY KEY CHECK(employeeID LIKE 'EM[0-9][0-9][0-9]'),
	employeeName varchar(50) NOT NULL CHECK (employeeName NOT LIKE ' %'), 
	employeeGender varchar(7) NOT NULL CHECK (employeeGender IN ('Male', 'Female')),
	employeeEmail varchar(50) NOT NULL CHECK (employeeEmail LIKE '%@Gmail.com'), 
	employeeAddress varchar(50) NOT NULL,
	employeePhoneNumber varchar(50) NOT NULL 
)


CREATE TABLE Customer(
	customerID char(5) NOT NULL PRIMARY KEY CHECK (customerID LIKE 'CU[0-9][0-9][0-9]'),
	customerName varchar(50) NOT NULL CHECK (customerName NOT LIKE ' %'),
	customerGender varchar(7) NOT NULL CHECK (customerGender IN('Male', 'Female')),
	customerEmail varchar(50) NOT NULL CHECK (customerEmail LIKE '%@Gmail.com'),
	customerAddress varchar(50) NOT NULL, 
	customerPhoneNumber varchar(50) NOT NULL
)


CREATE TABLE Supplier(
	supplierID char(5) NOT NULL PRIMARY KEY CHECK (supplierID LIKE 'SU[0-9][0-9][0-9]'),
	supplierName varchar(50) NOT NULL CHECK (supplierName NOT LIKE ' %'),
	supplierGender varchar(7) NOT NULL CHECK (supplierGender IN('Male', 'Female')),
	supplierEmail varchar(50) NOT NULL CHECK (supplierEmail LIKE '%@Gmail.com'),
	supplierAddress varchar(50) NOT NULL, 
	supplierPhoneNumber varchar(50) NOT NULL
)


CREATE TABLE Product(
	productID char(5) NOT NULL PRIMARY KEY CHECK (productID LIKE 'PR[0-9][0-9][0-9]'),
	productName varchar(100) NOT NULL CHECK (LEN (productName) > 5),
	productPrice float NOT NULL CHECK (productPrice BETWEEN 10000 AND 500000),
	productWeight float NOT NULL CHECK (productWeight BETWEEN 500 AND 1000)
)


CREATE TABLE Purchase_Header(
	purchaseID char(5) NOT NULL PRIMARY KEY CHECK (purchaseID LIKE 'PU[0-9][0-9][0-9]'), 
	employeeID char(5) NOT NULL FOREIGN KEY REFERENCES Employee(employeeID),
	supplierID char(5) NOT NULL FOREIGN KEY REFERENCES Supplier(supplierID),
	purchaseDate date NOT NULL,
)


CREATE TABLE Sales_Header(
	salesID char(5) NOT NULL PRIMARY KEY CHECK (salesID LIKE 'TR[0-9][0-9][0-9]'), 
	employeeID char(5) NOT NULL FOREIGN KEY REFERENCES Employee(employeeID),
	customerID char(5) NOT NULL FOREIGN KEY REFERENCES Customer(customerID),
	transactionDate date NOT NULL,
)


CREATE TABLE Purchase_Detail(
	purchaseID char(5) NOT NULL FOREIGN KEY REFERENCES Purchase_Header(purchaseID),
	productID char(5) NOT NULL FOREIGN KEY REFERENCES Product(productID), 
	quantityProductPurchased int NOT NULL CHECK (quantityProductPurchased > 0),
	PRIMARY KEY (purchaseID, productID)
)



CREATE TABLE Sales_Detail(
	salesID char(5) NOT NULL FOREIGN KEY REFERENCES Sales_Header(salesID), 
	productID char(5) NOT NULL FOREIGN KEY REFERENCES Product(productID), 
	quantityProductSold int NOT NULL CHECK (quantityProductSold > 0),
	PRIMARY KEY(salesID, productID)
)
------------------------------------------------------------------------------------------------








