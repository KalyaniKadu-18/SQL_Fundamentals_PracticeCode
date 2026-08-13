CREATE DATABASE Ecommerce;

USE Ecommerce;

CREATE TABLE customer(
cus_id INT PRIMARY KEY  AUTO_INCREMENT,
cus_name VARCHAR(40),
city VARCHAR(30),
email VARCHAR(30)
);

INSERT INTO customer(cus_name,city,email)
VALUES
('Rahul','Pune','rahul@gmail.com'),
('Priya','Mumbai','priya@gmail.com'),
('Amit','Nashik','amit@gmail.com'),
('Sneha','Nagpur','sneha@gmail.com'),
('Rohan','Pune','rohan@gmail.com'),
('Neha','Aurangabad','neha@gmail.com');

INSERT INTO customer(cus_name, city, email)
VALUES ('Kiran', 'Pune', 'kiran@gmail.com');

CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
cus_id INT,
product_id INT,
quantity INT,
order_date date
);

INSERT INTO Orders(cus_id, product_id, quantity, order_date)
VALUES
(1,1,2,'2026-07-01'),
(2,3,1,'2026-07-02'),
(1,2,1,'2026-07-03'),
(3,4,5,'2026-07-04'),
(4,1,1,'2026-07-05'),
(5,5,2,'2026-07-06'),
(2,6,1,'2026-07-07'),
(6,2,3,'2026-07-08'),
(3,1,2,'2026-07-09'),
(1,4,1,'2026-07-10');

CREATE TABLE Product(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT
);

INSERT INTO Product(product_name, category, price)
VALUES
('Laptop','Electronics',65000),
('Mobile','Electronics',30000),
('Keyboard','Electronics',2000),
('Office Chair','Furniture',8000),
('Study Table','Furniture',12000),
('Printer','Electronics',15000),
('Refrigerator','Appliances',45000),
('Washing Machine','Appliances',38000);

CREATE TABLE Supplier(
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO Supplier(supplier_name, city)
VALUES
('ABC Suppliers','Pune'),
('XYZ Traders','Mumbai'),
('Global Distributors','Delhi'),
('Prime Supplies','Hyderabad'),
('Star Enterprises','Bangalore'),
('Sunrise Traders','Chennai');

-- Display the customer name, city, product name, quantity, and order date for every order.
select
c.cus_name,
c.city, 
p.product_name,
o.quantity,
o.order_date
FROM customer as c
JOIN Orders as o
on c.cus_id = o.cus_id
JOIN Product as p
ON o.product_id = p.product_id;

-- Display all customers along with the total number of orders placed by each customer.--
SELECT 
c.cus_name, 
COUNT(o.order_id) as totalOrders
FROM customer as c
LEFT JOIN orders as o
ON c.cus_id = o.cus_id
GROUP BY c.cus_id,c.cus_name;

-- Find the names of customers who have never placed an order.--
SELECT 
c.cus_name
FROM customer as c
LEFT JOIN orders as o
ON c.cus_id = o.cus_id
where o.order_id is null;

-- Display the category name along with the average, maximum, and minimum price of products in each category.
select category,
min(price) as min_price,
max(price) as max_price,
avg(price) as avg_price
from Product
group by(category);

-- Display the names of customers who have placed more than 2 orders.--
select c.cus_name, 
count(o.order_id) as totalOrders
from customer as c
left join orders as o
on c.cus_id = o.cus_id
group by c.cus_id,cus_name
having  count(o.order_id) > 2;

-- Display the names of products that have never been ordered.
select
p.product_name
from Product as p
LEFT JOIN orders as o
on p.product_id = o.product_id
where o.order_id is null;

-- Display the customer name and the total amount spent by each customer.--
select 
c.cus_name ,
count(p.price) as totalPrice
FROM customer as c
left join Product as p
on c.cus_id = p.
