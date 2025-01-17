Create database Sales;
USE Sales;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(100),
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);
Alter Table Orders Add Order_quantity Int;

Desc Orders;
Rename table Orders to Sales_order;

INSERT INTO sales_order (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
(1, 'Appu samuel', 'Electronics', 'Smartphone', '9876543210', 2),
(2, 'Jane Smith', 'Furniture', 'Table', '1234567891', 1),
(3, 'Alice Brown', 'Books', 'Novel', '1234567892', 3),
(4, 'Bob Johnson', 'Clothing', 'Jacket', '1234567893', 1),
(5, 'Sreekumar S', 'Appliances', 'Blender', '1234567894', 1),
(6, 'Tommy India', 'Toys', 'Doll', '1234567895', 2),
(7, 'Viram Desair', 'Grocerry', 'Laptop', '1234567896', 1),
(8, 'Chris Green', 'Kitchenware', 'Cookware Set', '1234567897', 1),
(9, 'Maya Pradeep', 'Clothing', 'T-Shirt', '1234567898', 4),
(10, 'Indira K', 'Books', 'Notebook', '1234567899', 5);

SELECT Customer_name, Ordered_item
FROM sales_order;

UPDATE sales_order SET Ordered_item = 'Tablet' WHERE Order_Id = 3;
Desc Sales_order;

Delete from Sales_order where order_ID = 7;

Desc sales_order;