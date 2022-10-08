/* d.Create query using DML syntax to simulate the transactions process for sales and purchase transactions. 
Note: DML syntax to fill database and DML syntax to simulate the transactions process should be a different query.*/
------------------------------------------------------------------------------------------------
USE We_Klean
------------------------------------------------------------------------------------------------
-- Example Query For Sales Transaction
-- Customer Bought 2 Kispray Kitchen Sprays And Saniter Disinfecting Wipes Single Pack
INSERT INTO Sales_Detail
VALUES
('TR012', 'PR001', 2),
('TR012', 'PR003', 1)


-- To Get Total Cash Amount For Sales Transaction
SELECT
SUM(Product.productPrice*Sales_Detail.quantityProductSold) AS [Total Sales Transaction in Rp]
FROM Sales_Header
JOIN Sales_Detail ON Sales_Header.salesID = Sales_Detail.SalesID
JOIN Product ON Sales_Detail.ProductID = Product.productID
JOIN Customer ON Sales_Header.customerID = Customer.customerID
WHERE Sales_Header.salesID IN ('TR005','TR010') 


-------------------------------------------------------------------
-------------------------------------------------------------------
-- Example Query For Purchase Transaction
-- Employee Purchased 10 Packs Of Saniter Disinfecting Wipes Single Pack
INSERT INTO Purchase_Detail
VALUES
('PU012', 'PR003', 10);


-- To Get Total Cash Amount for Purchase Transaction
SELECT
SUM(Product.productPrice*Purchase_Detail.quantityProductPurchased) AS [Total Purchase Transaction in Rp]
FROM Purchase_Header
JOIN Purchase_Detail ON Purchase_Header.purchaseID = Purchase_Detail.PurchaseID
JOIN Product ON Purchase_Detail.productID = Product.productID
JOIN Employee ON Purchase_Header.employeeID = Employee.employeeID
WHERE Purchase_Header.purchaseID IN ('PU006','PU012')
-------------------------------------------------------------------
-------------------------------------------------------------------

