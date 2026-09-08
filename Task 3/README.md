# Task 3 - Seller and Inventory Management System

## Objectives
- Create Seller and Inventory tables.
- Relate sellers, products and stock.
- Maintain seller product information.
- Track available and unavailable products.
- Generate inventory status reports.

## Relationships
- One Seller can manage many inventory records.
- One Product can appear in inventory records for different sellers.
- `Inventory.Seller_ID` references `Seller.Seller_ID`.
- `Inventory.Product_ID` references `Product.Product_ID` from Task 2.

## SQL
```sql
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY AUTO_INCREMENT,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Seller_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Stock_Quantity INT NOT NULL DEFAULT 0,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    UNIQUE (Seller_ID, Product_ID)
);

INSERT INTO Seller (Seller_Name, Email, Phone) VALUES
('ABC Electronics', 'abc@example.com', '9876543210'),
('Fashion Hub', 'fashion@example.com', '9876543211');

INSERT INTO Inventory (Seller_ID, Product_ID, Stock_Quantity, Status)
VALUES (1, 1, 20, 'Available'), (2, 2, 0, 'Unavailable');

UPDATE Inventory
SET Stock_Quantity = 10, Status = 'Available'
WHERE Inventory_ID = 2;

SELECT s.Seller_Name, p.Product_Name, i.Stock_Quantity, i.Status
FROM Inventory i
JOIN Seller s ON i.Seller_ID = s.Seller_ID
JOIN Product p ON i.Product_ID = p.Product_ID;

SELECT Status, COUNT(*) AS Product_Count, SUM(Stock_Quantity) AS Total_Stock
FROM Inventory
GROUP BY Status;
```

> Run Task 2 before Task 3 because Inventory references Product.
