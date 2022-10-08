/* e.To support database management process in We Klean, Lion Cat asked you to provide some 
query that resulting important data. The requirements that asked from him are: */
------------------------------------------------------------------------------------------------
USE We_Klean
------------------------------------------------------------------------------------------------
/* 1.Display Product Name, ProductSold (obtained from total product sold followed by 
“ Product(s)” without quotation mark) for every sales transaction that occur in May */
SELECT [Product Name] = productName, [Product Sold] = CONCAT(SUM(quantityProductSold),' Product(s)') FROM Product p JOIN Sales_Detail sd ON p.productID = sd.productID JOIN Sales_Header sh ON sd.salesID = sh.salesID WHERE MONTH(transactionDate) = 5 GROUP BY p.productID,p.productName 


/* 2. Display Customer ID, Customer Name (obtained from the first name of the customer), 
Customer Gender, TotalTransaction (obtained from customer total transaction) for every 
sales transaction that bought by female customer and the total transaction more than 20 */
SELECT [Customer ID] = c.customerID, [Customer Name] = LEFT(c.customerName,CHARINDEX(' ', c.customerName)), [Customer Gender] = c.customerGender, [Total Transaction] = COUNT(*)  FROM Customer c JOIN Sales_Header sh ON c.customerID = sh.customerID WHERE c.customerGender LIKE 'Female' GROUP BY c.customerID,c.customerName,c.customerGender HAVING COUNT(*) > 20


/* 3. Display Product Name (obtained from Product Name in lowercase), TotalSold (obtained 
from total product sold followed by “ Product(s)” without quotation mark), 
TotalTransaction (obtained from product total transaction followed by “ Transaction(s)” 
without quotation mark), TotalProfit (obtained from total product sold multiplied by the 
product price) for every product that has product weight between 500 and 1000 and the 
total transaction more than 5 */
SELECT [Product Name] = LOWER(productName), [Total Sold] = CONCAT(SUM(quantityProductSold),' Product(s)'), [Total Transaction] = CONCAT(COUNT(*),' Transaction(s)'), [Total Profit] = SUM(quantityProductSold * p.productPrice) FROM Product p JOIN Sales_Detail sd ON p.productID = sd.productID JOIN Purchase_Detail pd ON p.productID = pd.productID WHERE p.productweight BETWEEN 500 AND 1000 GROUP BY p.productID, p.productName HAVING COUNT(*) > 5


/* 4. Display Employee ID, Employee Name (obtained from the last name of the Employee 
Name), Employee Gender, TotalTransaction (obtained from total transaction handled by 
the employee), TotalProductHandled (obtained from total product handled by the 
employee) for every sales transaction that handled by male employee and the total 
product handled more than 200 */
SELECT  [Employee ID] = e.employeeID, [Employee Name] = SUBSTRING(e.employeeName, CHARINDEX(' ', e.employeeName)+1,LEN(e.employeeName) - CHARINDEX(' ',e.employeeName)), [Employee Gender] = e.employeeGender, [Total transaction] = COUNT(DISTINCT sh.salesID), [Total Product Handled] = COUNT(DISTINCT sd.productID) FROM Employee e JOIN Sales_Header sh ON e.employeeID = sh.employeeID JOIN Sales_Detail sd ON sd.salesID = sh.salesID WHERE e.employeeGender LIKE 'Male'GROUP BY e.employeeID, e.employeeName, employeeGender HAVING COUNT(DISTINCT sd.productID) > 200


/* 5. Display Product ID (obtained from replacing 'PR' in Product ID with “Product “), Product 
Name, Product Price, Product Weight for every product that has product price more than 
the average product price for every product that purchased in the last 5 months from the 
current date.
(alias subquery) */
SELECT REPLACE(p.productID, 'PR', 'Product ') as [Product ID], p.productName as [Product Name], p.productPrice as [Product Price], p.productWeight as [Product Weight] FROM Product p JOIN  Purchase_Detail pd ON p.productID = pd.productID JOIN Purchase_Header ph ON pd.purchaseID = ph.purchaseID,(SELECT AVG(Product.productPrice) as average FROM Product) as limit WHERE ph.purchaseDate >= DATEADD(MONTH, -5, GETDATE()) AND p.productPrice > limit.average


/* 6. Display Purchase Date (obtained from Purchase Date in Mon dd, yyyy format), Employee 
Name, QuantitySold (obtained from Quantity followed by ' Item(s)') for every purchase 
that has the quantity purchased less than the average quantity purchased for every product 
that has 2 words Product Name.
(alias subquery) */
SELECT CONVERT(varchar, ph.purchaseDate, 107) as [Purchase Date], e.employeeName as [Employee Name], CONCAT(pd.quantityProductPurchased, ' Item(s)') as [Quantity Sold] FROM Purchase_Header ph JOIN Employee e ON ph.employeeID = e.employeeID JOIN Purchase_Detail pd ON ph.purchaseID = pd.purchaseID JOIN Product p ON pd.productID = p.productID JOIN Sales_Detail sd ON p.productID = sd.productID, (SELECT AVG(quantityProductPurchased) as average FROM Purchase_Detail) as limit 


/* 7. Display Product ID, Product Name (obtained from the 3 digits number of the Product ID 
followed by the Product Name), Product Price (obtained from the Product Price followed 
by ' IDR') for every product which the product price between the minimal product price 
and the average price that has been purchased in the November.
(alias subquery) */ 
SELECT p.productID as [Product ID], CONCAT(RIGHT(p.productID, 3), ' ', p.productName) as [Product Name], CONCAT(p.productPrice,' IDR') as [Product Price] FROM product p JOIN Purchase_Detail pd ON p.productID = pd.productID JOIN Purchase_Header ph ON ph.purchaseID = pd.purchaseID, (SELECT AVG(productPrice) as average, MIN(productPrice) as minim FROM Product) as limit WHERE p.productPrice BETWEEN limit.minim AND limit.average AND DATEPART(MONTH, ph.purchaseDate) = 11


/* 8. Display Transaction Date (obtained from the Sales Date in Mon dd, yyyy format), 
Product Name, TotalTransaction (obtained from the product total transaction followed 
by ' Transaction(s)') for every sales transaction which the quantity less than the maximum 
quantity of the sales transaction that occur every Wednesday and Friday.
(alias subquery) */ 
SELECT CONVERT(varchar, sh.transactionDate, 107) as [Transaction Date], p.productName as [Product Name], CONCAT(COUNT(*), ' Transaction(s)') as [Total Transaction] FROM Sales_Header sh JOIN Sales_Detail sd ON sh.salesID = sd.salesID JOIN Product p ON sd.productID = p.productID, (SELECT MAX(quantityProductPurchased) as maximum FROM Purchase_Detail) as limit WHERE DATENAME(WEEKDAY, sh.transactionDate) IN('Wednesday','Friday') AND sd.quantityProductSold < limit.maximum GROUP BY p.productName, sh.transactionDate, p.productID


/* 9. Display Customer ID, Customer Name, TransactionCount (obtained from the customer 
total transaction), QuantityBought (obtained from the total product bought) for every 
sales transaction which the total product bought more than 50 and the customer name 
start with 'M'. Sort the result by the total product bought in ascending */ 
SELECT c.customerID as [Customer ID], c.customerName as [Customer Name], COUNT(*) as [Transaction Count], SUM(sd.quantityProductSold) as [Quantity Bought] FROM Customer c JOIN Sales_Header sh ON c.customerID = sh.customerID JOIN Sales_Detail sd ON sh.salesID = sd.salesID WHERE c.customerName LIKE 'M%' GROUP BY c.customerID,c.customerName HAVING SUM(sd.quantityProductSold) > 50 ORDER BY SUM(quantityProductSold) ASC


/* 10. Display Product ID, Product Name, Product Price, NewPrice (obtained from the Product 
Price plus the 25% of the Product Price) for every sales transaction which the total 
product sold more than 100 and product total transaction more than 5. Sort the result by 
the NewPrice in descending */ 
SELECT p.productID as [Product ID], p.productName as [Product Name], p.productPrice as [Product Price], p.productPrice + (0.25 * productPrice) as [New Price] FROM Product p JOIN Sales_Detail sd ON p.productID = sd.productID GROUP BY p.productID, p.productName, p.productPrice HAVING COUNT(DISTINCT sd.salesID) > 5 AND SUM(sd.quantityProductSold) > 100 ORDER BY [New Price] DESC
------------------------------------------------------------------------------------------------
