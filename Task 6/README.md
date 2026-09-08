# Task 6 - Product Review and Rating Management System

## Objectives
- Create Review and Rating tables.
- Store customer feedback and ratings.
- Retrieve product review details.
- Calculate average product ratings using aggregate functions.
- Identify highly rated products.

## Relationships
- Reviews and ratings are linked to Customer and Product.
- `Review.Customer_ID` and `Rating.Customer_ID` reference Customer.
- `Review.Product_ID` and `Rating.Product_ID` reference Product.

## SQL
```sql
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Review_Text VARCHAR(500),
    Review_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Rating (
    Rating_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating_Value INT NOT NULL,
    Rating_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    CHECK (Rating_Value BETWEEN 1 AND 5),
    UNIQUE (Customer_ID, Product_ID)
);

INSERT INTO Review (Customer_ID, Product_ID, Review_Text)
VALUES (1, 1, 'Good product and useful features.');

INSERT INTO Rating (Customer_ID, Product_ID, Rating_Value)
VALUES (1, 1, 5);

SELECT p.Product_Name, r.Review_Text, r.Review_Date,
       c.Customer_Name
FROM Review r
JOIN Product p ON r.Product_ID = p.Product_ID
JOIN Customer c ON r.Customer_ID = c.Customer_ID
ORDER BY r.Review_Date DESC;

SELECT p.Product_ID, p.Product_Name,
       ROUND(AVG(rt.Rating_Value), 2) AS Average_Rating,
       COUNT(rt.Rating_ID) AS Rating_Count
FROM Product p
JOIN Rating rt ON p.Product_ID = rt.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

SELECT p.Product_Name,
       ROUND(AVG(rt.Rating_Value), 2) AS Average_Rating
FROM Product p
JOIN Rating rt ON p.Product_ID = rt.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(rt.Rating_Value) >= 4
ORDER BY Average_Rating DESC;
```
