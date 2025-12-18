-- Q1; How many total customers are there?
SELECT COUNT(*) FROM CUSTOMER;

-- Q2; Show the number of customers in each city.
SELECT CITY , COUNT(*)
FROM CUSTOMER
GROUP BY CITY;

-- Q3; Which city has the highest number of customers?
SELECT city, COUNT(*) AS total_customers
FROM customer
GROUP BY city
ORDER BY total_customers DESC
LIMIT 1;

-- Q4; List all customers who belong to Delhi.
SELECT * FROM CUSTOMER
WHERE CITY = 'DELHI';

-- Q5; Show customers who signed up in March 2023.
SELECT *
FROM CUSTOMER
WHERE SIGNUP_DATE BETWEEN '2023-03-01'AND '2023-03-31';

-- Q6;Show customers who signed up after 2023-03-15.
SELECT * FROM CUSTOMER
WHERE SIGNUP_DATE > '2023-03-15';

-- Q7; Show customers ordered by signup date (latest first).
SELECT * FROM CUSTOMER
order by SIGNUP_DATE DESC;

-- Q8; Count how many customers signed up each month.
SELECT MONTH(signup_date) AS signup_month, COUNT(*) AS total_customers
FROM customer
GROUP BY MONTH(signup_date);

-- Q9; Show cities where more than 5 customers are present.
SELECT CITY , COUNT(*)
FROM CUSTOMER
GROUP BY CITY
HAVING COUNT(*) >5;

-- Q10; List customers who have never placed any order.
SELECT c.*
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q11; Show total number of products.
SELECT COUNT(*) FROM PRODUCTS;

-- Q12; Show how many products are there in each category.
SELECT c.category_name, COUNT(p.product_id)
FROM categories c
JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name;


-- Q13; Which category has the maximum number of products?
SELECT c.category_name, COUNT(p.product_id) AS total_products
FROM categories c
JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_products DESC
LIMIT 1;


-- Q14; List all products priced above 2000.
SELECT * 
FROM PRODUCTS
WHERE PRICE > 2000;

-- Q15; Show products sorted by price (highest to lowest).
SELECT * 
FROM PRODUCTS
ORDER BY PRICE DESC;

-- Q16; Show top 5 most expensive products.
SELECT * 
FROM PRODUCTS
ORDER BY PRICE DESC
LIMIT 5; 

-- Q17; Show total number of orders.
SELECT COUNT(*) FROM ORDERS; 

-- Q18; Show how many orders were placed each day.
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY order_date;

-- Q19; Show orders placed in March 2023.
SELECT * 
FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-03-01'AND '2023-03-31';

-- Q20; Show orders sorted by order date (latest first).
SELECT *
FROM ORDERS
ORDER BY ORDER_DATE DESC;

-- Q21; Count how many orders each customer has placed.
SELECT  CUSTOMER_NAME, COUNT(*) 
FROM ORDERS 
JOIN CUSTOMER USING (CUSTOMER_ID)
GROUP BY CUSTOMER_NAME;

-- Q22; Show orders placed by customers from Delhi.
SELECT  * 
FROM ORDERS 
JOIN CUSTOMER USING (CUSTOMER_ID)
WHERE CITY = 'DELHI';

-- Q23; Total quantity sold for each product
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Q24; Total quantity sold category-wise
SELECT 
    c.category_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Q25; Top 5 products based on quantity sold
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Q26; Customers who bought the highest total quantity
SELECT 
    c.customer_name,
    SUM(oi.quantity) AS total_quantity_bought
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_quantity_bought DESC;

-- Q27; Products that were ordered only once
SELECT 
    p.product_name,
    COUNT(oi.order_id) AS order_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(oi.order_id) = 1;

-- Q28; Customer-wise total orders (descending)
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;


-- Q29; Category-wise total orders
SELECT 
    c.category_name,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Q30; Orders along with product name and quantity
SELECT 
    o.order_id,
    p.product_name,
    oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Q31; Customers who ordered more than 3 products (total quantity)
SELECT 
    c.customer_name,
    SUM(oi.quantity) AS total_products_ordered
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
HAVING SUM(oi.quantity) > 3;


-- Q32; Products ordered in the highest quantity
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;













