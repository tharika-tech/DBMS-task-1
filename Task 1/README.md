# Task 1 - Requirement Analysis and Customer Database Module

## E-Commerce Order Management System

This task documents the business requirements of the E-Commerce Order Management System and defines the Customer database module.

### Functional Requirements
- Customer registration and login
- Customer profile management
- Product search and browsing
- Shopping cart management
- Order placement and order history
- Payment processing
- Delivery tracking
- Cancellation, returns and refunds
- Product reviews and ratings

### Non-Functional Requirements
- Security and data privacy
- Fast response time
- Reliability and availability
- Scalability during high traffic
- Data accuracy and integrity
- Backup and recovery
- User-friendly interface

### Customer Entity
| Field | Description |
|---|---|
| Customer_ID | Unique customer identifier (Primary Key) |
| Customer_Name | Customer full name |
| Email | Unique email address |
| Phone | Contact number |
| Address | Delivery address |
| Password_Hash | Hashed authentication credential |
| Created_Date | Account creation date |

### Customer Table
```sql
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Password_Hash VARCHAR(255) NOT NULL,
    Created_Date DATE DEFAULT (CURRENT_DATE)
);
```

Passwords should be stored as hashes, not plain text, in a real system.
