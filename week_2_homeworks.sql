---- QUESTION 1: Which is / are the top suppliers (we have more products in stock) of Confections products?
SELECT p.ProductID , s.CompanyName ,  p.ProductName , SUM(od.Quantity) AS Quantity , c.CategoryName  FROM Categories c
JOIN Products p ON p.CategoryID  = c.CategoryID 
JOIN Suppliers s ON s.SupplierID = p.SupplierID 
JOIN "Order Details" od ON od.ProductID = p.ProductID 
WHERE c.CategoryName = 'Confections' 
GROUP BY P.ProductID 
ORDER BY s.CompanyName , Quantity  DESC
;
--QUESTION 2: The company is studying to open a new city (to send goods) in Vilna and the market research teams requires to know which is the
---top sold product in a nearby city to start with more stock with this product. 
----Which is the most popular (purchased) product in Berlin?
SELECT P.ProductID , p.ProductName, SUM(od.Quantity)  ,o.ShipCity  FROM Orders o 
JOIN "Order Details" od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID 
WHERE o.ShipCity = 'Berlin'
ORDER BY od.Quantity DESC
;
--QUESTION 3: The company Maison Dewey complained about having a bad experience with all its orders, 
---what are the telephone numbers of the shippers that carried the products?
SELECT od.OrderID , P.ProductName ,  s.CompanyName as shippers_name, s.Phone as shippers_phone FROM Customers c 
JOIN Orders o ON o.CustomerID = c.CustomerID 
JOIN Shippers s ON s.ShipperID = o.ShipVia 
JOIN "Order Details" od ON od.OrderID = o.OrderID 
JOIN Products p ON p.ProductID = od.ProductID 
WHERE c.CustomerID = 'MAISD'
;
--The company does not have enough employees to attend all the orders, and given that the company has signed a new big contract
---with a customer from Brazil, should the company hire a new employee in America, Europe or it does not matter?
Select s.CompanyName as supplier_name  , p.ProductName , od.Quantity AS order_quantity , Count(e.EmployeeID) as number_of_employees, c.Country as Customers_Country from Customers c 
JOIN Orders o ON o.CustomerID = c.CustomerID 
JOIN "Order Details" od ON od.OrderID = o.OrderID 
JOIN Products p ON p.ProductID = od.ProductID 
JOIN Suppliers s ON s.SupplierID = p.ProductID 
JOIN Employees e ON e.EmployeeID = o.EmployeeID 
JOIN EmployeeTerritories et ON et.EmployeeID = e.EmployeeID 
JOIN Territories t ON t.TerritoryID = et.TerritoryID 
JOIN Regions r ON t.RegionID = r.RegionID 
WHERE c.Country = 'Brazil'
Group by c.CompanyName, p.ProductID 
ORDER BY supplier_name, order_quantity DESC 
;
