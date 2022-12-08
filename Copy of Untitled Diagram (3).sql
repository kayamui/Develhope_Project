CREATE TABLE `Categories` (
  `CategoryID` integer,
  `CategoryName` text,
  `Description` text,
  `Picture` blob,
  PRIMARY KEY (`CategoryID`)
);

CREATE TABLE `CustomerCustomerDemo` (
  `CustomerID` text NOT NULL,
  `CustomerTypeID` text NOT NULL,
  PRIMARY KEY (`CustomerID`, `CustomerTypeID`)
);

CREATE TABLE `CustomerDemographics` (
  `CustomerTypeID` text PRIMARY KEY NOT NULL,
  `CustomerDesc` text
);

CREATE TABLE `Customer` (
  `CustomerID` TEXT PRIMARY KEY,
  `CompanyName` TEXT,
  `ContactName` TEXT,
  `ContactTitle` TEXT,
  `Address` TEXT,
  `City` TEXT,
  `Region` TEXT,
  `PostalCode` TEXT,
  `Country` TEXT,
  `Phone` TEXT,
  `Fax` TEXT
);

CREATE TABLE `EmployeeTerritories` (
  `EmployeeID` integer NOT NULL,
  `TerritoryID` text NOT NULL,
  PRIMARY KEY (`EmployeeID`, `TerritoryID`)
);

CREATE TABLE `Employees` (
  `EmployeeID` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `LastName` TEXT,
  `FirstName` TEXT,
  `Title` TEXT,
  `TitleOfCourtesy` TEXT,
  `BirthDate` DATE,
  `HireDate` DATE,
  `Address` TEXT,
  `City` TEXT,
  `Region` TEXT,
  `PostalCode` TEXT,
  `Country` TEXT,
  `HomePhone` TEXT,
  `Extension` TEXT,
  `Photo` BLOB,
  `Notes` TEXT,
  `ReportsTo` INTEGER,
  `PhotoPath` TEXT
);

CREATE TABLE `OrderDetails` (
  `OrderID` INTEGER NOT NULL,
  `ProductID` INTEGER NOT NULL,
  `UnitPrice` NUMERIC NOT NULL DEFAULT 0,
  `Quantity` INTEGER NOT NULL,
  `Discount` REAL NOT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`)
);

CREATE TABLE `Orders` (
  `OrderID` INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `CustomerID` TEXT,
  `EmployeeID` INTEGER,
  `OrderDate` DATETIME,
  `RequiredDate` DATETIME,
  `ShippedDate` DATETIME,
  `ShipVia` INTEGER,
  `Freight` NUMERIC,
  `ShipName` TEXT,
  `ShipAddress` TEXT,
  `ShipCity` TEXT,
  `ShipRegion` TEXT,
  `ShipPostalCode` TEXT,
  `ShipCountry` TEXT
);

CREATE TABLE `Products` (
  `ProductID` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `ProductName` TEXT,
  `SupplierID` INTEGER,
  `CategoryID` INTEGER,
  `QuantityPerUnit` TEXT,
  `UnitPrice` NUMERIC DEFAULT 0,
  `UnitsInStock` INTEGER DEFAULT 0,
  `UnitsOnOrder` INTEGER DEFAULT 0,
  `ReorderLevel` INTEGER DEFAULT 0,
  `Discontinued` TEXT NOT NULL DEFAULT 0
);

CREATE TABLE `Regions` (
  `RegionID` INTEGER PRIMARY KEY NOT NULL,
  `RegionDescription` TEXT NOT NULL
);

CREATE TABLE `Shippers` (
  `ShipperID` INTEGER NOT NULL AUTO_INCREMENT,
  `CompanyName` TEXT NOT NULL,
  `Phone` TEXT,
  PRIMARY KEY (`ShipperID`, `CompanyName`)
);

CREATE TABLE `Suppliers` (
  `SupplierID` INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `CompanyName` TEXT NOT NULL,
  `ContactName` TEXT,
  `ContactTitle` TEXT,
  `Address` TEXT,
  `City` TEXT,
  `Region` TEXT,
  `PostalCode` TEXT,
  `Country` TEXT,
  `Phone` TEXT,
  `Fax` TEXT,
  `HomePage` TEXT
);

CREATE TABLE `Territories` (
  `TerritoryID` TEXT PRIMARY KEY NOT NULL,
  `TerritoryDescription` TEXT NOT NULL,
  `RegionID` INTEGER NOT NULL
);

CREATE TABLE `Supplies` (
  `SupplierID` INTEGER NOT NULL,
  `ShipperID` INTEGER NOT NULL,
  `ProductID` INTEGER NOT NULL,
  `CategoryID` INTEGER NOT NULL,
  `CategoryName` TEXT NOT NULL,
  `CompanyName` TEXT NOT NULL,
  `Quantity` INTEGER NOT NULL,
  PRIMARY KEY (`SupplierID`, `ProductID`)
);

ALTER TABLE `CustomerCustomerDemo` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `CustomerCustomerDemo` ADD FOREIGN KEY (`CustomerTypeID`) REFERENCES `CustomerDemographics` (`CustomerTypeID`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`CustomerID`) REFERENCES `CustomerDemographics` (`CustomerTypeID`);

ALTER TABLE `EmployeeTerritories` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `EmployeeTerritories` ADD FOREIGN KEY (`TerritoryID`) REFERENCES `Territories` (`TerritoryID`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

ALTER TABLE `Employees` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `Orders` (`EmployeeID`);

ALTER TABLE `Products` ADD FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`);

ALTER TABLE `Products` ADD FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`);

ALTER TABLE `Suppliers` ADD FOREIGN KEY (`CompanyName`) REFERENCES `Shippers` (`ShipperID`);

ALTER TABLE `Territories` ADD FOREIGN KEY (`RegionID`) REFERENCES `Regions` (`RegionID`);

ALTER TABLE `Suppliers` ADD FOREIGN KEY (`SupplierID`) REFERENCES `Supplies` (`SupplierID`);

ALTER TABLE `Shippers` ADD FOREIGN KEY (`ShipperID`) REFERENCES `Supplies` (`ShipperID`);

ALTER TABLE `Products` ADD FOREIGN KEY (`ProductID`) REFERENCES `Supplies` (`ProductID`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`OrderID`) REFERENCES `Supplies` (`Quantity`);
