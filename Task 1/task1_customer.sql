-- Task 1: Customer Database Module
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Password_Hash VARCHAR(255) NOT NULL,
    Created_Date DATE DEFAULT (CURRENT_DATE)
);
