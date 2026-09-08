-- Task 2: Product and Category Management
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(150) NOT NULL,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

INSERT INTO Category (Category_Name) VALUES ('Electronics'), ('Fashion'), ('Home Appliances');
INSERT INTO Product (Product_Name, Category_ID, Price, Stock) VALUES
('Smartphone', 1, 19999.00, 25),
('T-Shirt', 2, 799.00, 50),
('Mixer Grinder', 3, 2499.00, 15);

UPDATE Product SET Price = 18999.00, Stock = 30 WHERE Product_ID = 1;
DELETE FROM Product WHERE Product_ID = 3;

SELECT c.Category_Name, COUNT(p.Product_ID) AS Product_Count,
       SUM(p.Stock) AS Total_Stock, SUM(p.Price * p.Stock) AS Stock_Value
FROM Category c LEFT JOIN Product p ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;
