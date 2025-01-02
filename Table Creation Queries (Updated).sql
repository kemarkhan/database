CREATE TABLE Product(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255) NOT NULL,
    Category VARCHAR(255) NOT NULL
);

CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(255) NOT NULL,
    Supplier_PhoneNum VARCHAR(20),
    Supplier_Email VARCHAR(255),
    Supplier_Address VARCHAR(255)
);

CREATE TABLE Supplier_Product(
    Product_ID INT,
    Supplier_ID INT,
    Price DECIMAL(10,2),
    PRIMARY KEY(Product_ID, Supplier_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY(Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

CREATE TABLE Purchase_Order(
    Purchase_Order_ID INT PRIMARY KEY,
    Supplier_ID INT,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL (12,2),
    Order_Status VARCHAR(50),
    FOREIGN KEY(Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

CREATE TABLE Purchase_Order_Item(
    Purchase_Order_ID INT,
    Product_ID INT,
    Quantity_Ordered INT NOT NULL,
    Unit_Price DECIMAL(10,2),
    PRIMARY KEY (Purchase_Order_ID, Product_ID),
    FOREIGN KEY (Purchase_Order_ID) REFERENCES Purchase_Order(Purchase_Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Staff(
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(255),
    Staff_Role VARCHAR(100)
);

CREATE TABLE Inventory (
  Inventory_ID INT PRIMARY KEY, -- Single primary key
  Product_ID INT NOT NULL, 
  Stock_Level INT NOT NULL, 
  Last_Updated DATE NOT NULL, 
  Staff_ID INT, 
  Reorder_Flag NUMBER(1), -- Use NUMBER(1) instead of BOOLEAN for compatibility
  Last_Reorder_Check_Date DATE, 
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID), 
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID) 
);

CREATE TABLE Stock_Delivery (
    Delivery_ID INT PRIMARY KEY, -- Single primary key
    Purchase_Order_ID INT, -- Foreign key
    Supplier_ID INT, 
    Delivery_Date DATE NOT NULL,
    Delivery_Location VARCHAR(255),
    Delivered_Quantity INT NOT NULL,
    Delivery_Condition VARCHAR(255),
    Staff_ID INT,
    FOREIGN KEY (Purchase_Order_ID) REFERENCES Purchase_Order(Purchase_Order_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);


