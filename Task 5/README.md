# Task 5 - Payment Transaction Management System

## Objectives
- Create the Payment table.
- Store payment mode, date, amount and status.
- Manage successful and failed transactions.
- Analyze payment methods used by customers.
- Generate payment transaction reports.

## SQL
```sql
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Payment_Mode VARCHAR(30) NOT NULL,
    Payment_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Payment (Order_ID, Payment_Mode, Amount, Status)
VALUES
(1, 'UPI', 19999.00, 'Successful');

INSERT INTO Payment (Order_ID, Payment_Mode, Amount, Status)
VALUES
(1, 'Card', 19999.00, 'Failed');

UPDATE Payment
SET Status = 'Successful'
WHERE Payment_ID = 2;

SELECT Payment_Mode,
       COUNT(*) AS Transaction_Count,
       SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Mode;

SELECT Status, COUNT(*) AS Transaction_Count, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Status;
```
