-- Task 4: Order Management
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    Total_Amount DECIMAL(10,2) NOT NULL DEFAULT 0,
    Status VARCHAR(30) NOT NULL DEFAULT 'Placed',
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Total_Price DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * Unit_Price) STORED,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Orders (Customer_ID, Total_Amount, Status) VALUES (1, 19999.00, 'Placed');
INSERT INTO Order_Details (Order_ID, Product_ID, Quantity, Unit_Price) VALUES (1, 1, 1, 19999.00);
UPDATE Orders SET Status = 'Confirmed', Total_Amount = 19999.00 WHERE Order_ID = 1;

SELECT o.Order_ID, o.Order_Date, o.Status, p.Product_Name,
       od.Quantity, od.Unit_Price, od.Total_Price
FROM Orders o JOIN Order_Details od ON o.Order_ID = od.Order_ID
JOIN Product p ON od.Product_ID = p.Product_ID
WHERE o.Customer_ID = 1 ORDER BY o.Order_Date DESC;
