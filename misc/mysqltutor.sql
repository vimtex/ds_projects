# http://www.mysqltutorial.org/

SELECT @@GLOBAL.sql_mode global;
#SET GLOBAL sql_mode=''; # not needed
SELECT @@SESSION.sql_mode session;
#'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
SET sql_mode='';

SHOW DATABASES;
USE classicmodels;
SHOW FULL TABLES;

# make an alias
DROP VIEW IF EXISTS orderDetails;
CREATE VIEW orderDetails AS
SELECT *
FROM orderdetails;

DESCRIBE employees;

SELECT 
	lastName
FROM 
	employees;

SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees;
    
SELECT *
FROM employees;

SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname;
    
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC;
    
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC,
    contactFirstname ASC;
    
SELECT 
    orderNumber, 
    orderlinenumber
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
   
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;

SELECT DISTINCT status
FROM orders;

SELECT 
    orderNumber, 
    status
FROM
    orders
ORDER BY 
    FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
        
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
    
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
    
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;
    
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
    
SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;
    
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
    
SELECT DISTINCT state
FROM customers;

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
    
SELECT 
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state , 
    city;
    
SELECT 
    state
FROM
    customers
GROUP BY state;

SELECT DISTINCT
    state
FROM
    customers;
    
SELECT DISTINCT
    state
FROM
    customers
ORDER BY 
    state;

SELECT 
    COUNT(DISTINCT state)
FROM
    customers
WHERE
    country = 'USA';
    
SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;

SELECT 1 = 0 AND 1 / 0 ;

SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND state = 'CA';
    
SELECT    
    customername, 
    country, 
    state, 
    creditlimit
FROM    
    customers
WHERE country = 'USA'
    AND state = 'CA'
    AND creditlimit > 100000;
    
SELECT 1 = 1 OR 1 / 0;

SELECT true OR false AND false;

SELECT (true OR false) AND false;

SELECT    
    customername, 
    country
FROM    
    customers
WHERE country = 'USA' OR 
      country = 'France';
      
SELECT   
    customername, 
    country, 
    creditLimit
FROM   
    customers
WHERE ( country = 'USA'
        OR country = 'France')
	  AND creditlimit > 100000;
      
SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE country = 'USA'
        OR country = 'France'
        AND creditlimit > 10000;
        
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');
    
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France');
 
SELECT    
    orderNumber, 
    customerNumber, 
    status, 
    shippedDate
FROM    
    orders
WHERE orderNumber IN
(
     SELECT 
         orderNumber
     FROM 
         orderdetails
     GROUP BY 
         orderNumber
     HAVING SUM(quantityOrdered * priceEach) > 60000
);

# subquery
     SELECT 
         orderNumber
     FROM 
         orderdetails
     GROUP BY 
         orderNumber
     HAVING SUM(quantityOrdered * priceEach) > 60000;

SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
     
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';

SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName REGEXP '^B.*t';
    
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit, 
    customerNumber
LIMIT 5;

SELECT COUNT(*) INTO @cnt FROM customers;
SELECT @cnt;

SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;

SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;

# Get the 2nd
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 1,1;

SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC
LIMIT 3;

SELECT 1 IS NULL,  -- 0
       0 IS NULL,  -- 0
       NULL IS NULL; -- 1
       
SELECT 1 IS NOT NULL, -- 1
       0 IS NOT NULL, -- 1
       NULL IS NOT NULL; -- 0
       
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName;
    
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
   customerName;
   
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);

# make sure starting from an empty table
DELETE FROM projects;

# Now we can use 0000-00-00
INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM','2020-01-01','0000-00-00'),
      ('ERP Future','2020-01-01','0000-00-00'),
      ('VR','2020-01-01','2030-01-01');
 
SELECT * FROM projects;
WHERE complete_date IS NULL;

SELECT 
    customerNumber, 
    salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;
    
EXPLAIN SELECT 
    customerNumber, 
    salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;
    
EXPLAIN SELECT 
    customerNumber,
    salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber = 1370 OR
    salesRepEmployeeNumber IS NULL;
    
SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;
    
SELECT 
    CONCAT_WS(', ', lastName, firstname) AS `Full Name`
FROM
    employees;
    
SELECT
    CONCAT_WS(', ', lastName, firstname) 'Full Name'
FROM
    employees
ORDER BY
    `Full Name`;
    
SELECT
    orderNumber `Order no.`,
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
GROUP BY
    `Order no.`
HAVING
    total > 60000;
    
SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;

SELECT
    customerName,
    COUNT(o.orderNumber) total
FROM
    customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
    customerName
ORDER BY
    total DESC;
    
SELECT
    customers.customerName,
    COUNT(orders.orderNumber) total
FROM
    customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY
    customerName
ORDER BY
    total DESC;
    
DROP TABLE IF EXISTS members;
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);
 
 DROP TABLE IF EXISTS committees;
CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');
 
INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

SELECT * FROM members;
SELECT * FROM committees;

SELECT 
    m.member_id, 
    m.name as member_,  # member is a keyword, and is reserved in mySQL 8.0.17 
    c.committee_id, 
    c.name committee
FROM
    members m
INNER JOIN committees c 
    ON c.name = m.name;
    
SELECT 
    m.member_id, 
	m.name member_, 
    c.committee_id,
    c.name committee
FROM
    members m
INNER JOIN committees c USING (name);

SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name);

SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
LEFT JOIN committees c ON m.name = c.name;

SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;

SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;


SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
RIGHT JOIN committees c USING(name);

SELECT 
    m.member_id, 
    m.name member_, 
    c.committee_id, 
    c.name committee
FROM
    members m
CROSS JOIN committees c;

SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);

SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;

SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';
    
SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;
    
SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;
    
SELECT
    customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers
LEFT JOIN orders USING (customerNumber);

SELECT 
    c.customerNumber, 
    c.customerName,
	o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;
    
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;
    
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails 
    USING (orderNumber)
WHERE
    orderNumber = 10123;
    
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails d 
    ON o.orderNumber = d.orderNumber 
	   AND o.orderNumber = 10123;

SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
    employeeNumber;

SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
    salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

# self join
SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
SELECT IFNULL(NULL, 20);

SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname), 'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;

SELECT * FROM customers;
    
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;
    
CREATE DATABASE IF NOT EXISTS salesdb;

USE salesdb;

DROP TABLE products, stores, sales;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2 )
);
 
CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);
 
CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL(13 , 2 ) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id , store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO products(product_name, price)
VALUES('iPhone', 699),
      ('iPad',599),
      ('Macbook Pro',1299);
 
INSERT INTO stores(store_name)
VALUES('North'),
      ('South');
 
INSERT INTO sales(store_id,product_id,quantity,sales_date)
VALUES(1,1,20,'2017-01-02'),
      (1,2,15,'2017-01-05'),
      (1,3,25,'2017-01-05'),
      (2,1,30,'2017-01-02'),
      (2,2,35,'2017-01-05');
      
SELECT 
    store_name,
    product_name,
    SUM(quantity * price) AS revenue
FROM
    sales
        INNER JOIN
    products ON products.id = sales.product_id
        INNER JOIN
    stores ON stores.id = sales.store_id
GROUP BY store_name , product_name; 

SELECT 
    store_name, product_name
FROM
    stores AS a
        CROSS JOIN
    products AS b;

SELECT 
        stores.id AS store_id,
        products.id AS product_id,
        store_name,
		product_name,
        ROUND(SUM(quantity * price), 0) AS revenue
    FROM
        sales
    INNER JOIN products ON products.id = sales.product_id
    INNER JOIN stores ON stores.id = sales.store_id
    GROUP BY store_name , product_name;

SELECT 
    b.store_name,
    a.product_name,
    IFNULL(c.revenue, 0) AS revenue
FROM
    products AS a
        CROSS JOIN
    stores AS b
        LEFT JOIN
	(SELECT 
        stores.id AS store_id,
        products.id AS product_id,
        store_name,
		product_name,
        ROUND(SUM(quantity * price), 0) AS revenue
    FROM
        sales
    INNER JOIN products ON products.id = sales.product_id
    INNER JOIN stores ON stores.id = sales.store_id
    GROUP BY store_name , product_name) AS c 
    ON c.store_id = b.id
        AND c.product_id= a.id
ORDER BY b.store_name;

SHOW DATABASES;
USE classicmodels;

SELECT 
    status
FROM
    orders
GROUP BY status;

SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;

SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;
    
SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;
    
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);

SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year;
    
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year
HAVING 
    year > 2003;
    
SELECT 
    status, 
    COUNT(*)
FROM
    orders
GROUP BY 
    status DESC;
    
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 60000;
   
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND ordernumber > 10111 AND 
    itemsCount > 600;
    
SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    
    
SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
WHERE status = 'Shipped'
GROUP BY  
    ordernumber, 
    status
HAVING 
    total > 1500;
    
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
SELECT
    productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM
    orderDetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine ,
    YEAR(orderDate);
    
SELECT * FROM sales;

SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline;

SELECT 
    SUM(orderValue) totalOrderValue
FROM
    sales;
    
SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline 
UNION ALL --
SELECT 
    IFNULL(NULL, 'Total'), 
    SUM(orderValue) totalOrderValue
FROM
    sales;
    
SELECT 
    IFNULL(productLine, 'Total'), 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline WITH ROLLUP;
    
SELECT 
    IFNULL(productLine, 'Total'), 
    IFNULL(orderYear, '2003-5'),
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline, 
    orderYear 
WITH ROLLUP;
    
SELECT 
    productLine, orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    orderYear,
    productline
WITH ROLLUP;

# SQL 8, GROUPING
SELECT 
    orderYear,
    productLine, 
    SUM(orderValue) totalOrderValue,
    GROUPING(orderYear),
    GROUPING(productLine)
FROM
    sales
GROUP BY 
    orderYear,
    productline
WITH ROLLUP;

SELECT 
    IF(GROUPING(orderYear),
        'All Years',
        orderYear) orderYear,
    IF(GROUPING(productLine),
        'All Product Lines',
        productLine) productLine,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    orderYear , 
    productline 
WITH ROLLUP;

SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT AVG(amount) FROM payments);
    
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN 
		(SELECT DISTINCT
            customerNumber
        FROM
            orders);

SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;

SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline);
    
SELECT 
    orderNumber, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;

SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered) AS rev
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING rev > 60000);
        
SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;

SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);
    
SELECT 
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY customerNumber;

SELECT 
    cg.customerGroup, 
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;

SELECT VERSION();

WITH customers_in_usa AS (
    SELECT 
        customerName, state
    FROM
        customers
    WHERE
        country = 'USA'
) SELECT 
    customerName
 FROM
    customers_in_usa
 WHERE
    state = 'CA'
 ORDER BY customerName;

#--
	SELECT productline, AVG(buyprice) as avgbuyprice  
    FROM products 
    GROUP BY productline;

WITH cte AS (
	SELECT productline, AVG(buyprice) as avgbuyprice  
    FROM products 
    GROUP BY productline
) SELECT 
	productname,
	avgbuyprice
FROM
	products, cte
WHERE
	products.productline = cte.productline AND
    products.buyprice > cte.avgbuyprice; 

WITH cte AS (
	SELECT productline, AVG(buyprice) as avgbuyprice  
    FROM products 
    GROUP BY productline
) SELECT 
	productname,
	avgbuyprice
FROM
	products JOIN cte
ON
	products.productline = cte.productline AND
    products.buyprice > cte.avgbuyprice; 
    
WITH topsales2003 AS (
    SELECT 
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDate) = 2003
            AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT 
    employeeNumber, 
    firstName, 
    lastName, 
    sales
FROM
    employees
        JOIN
    topsales2003 USING (employeeNumber);
    
WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
customer_salesrep AS (
    SELECT 
        customerName, salesrepName
    FROM
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT 
    *
FROM
    customer_salesrep
ORDER BY customerName;

WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
)
SELECT 
    customerName, salesrepName
FROM
    customers INNER JOIN salesrep 
    ON salesrep.employeeNumber = customers.salesrepEmployeeNumber
ORDER BY customerName;

SELECT * FROM customers LIMIT 1;

#WITH ... SELECT ...
#WITH ... UPDATE ...
#WITH ... DELETE ...
#SELECT ... WHERE id IN (WITH ... SELECT ...); 
#SELECT * FROM (WITH ... SELECT ...) AS derived_table;

#CREATE TABLE ... WITH ... SELECT ...
#CREATE VIEW ... WITH ... SELECT ...
#INSERT ... WITH ... SELECT ...
#REPLACE ... WITH ... SELECT ...
#DECLARE CURSOR ... WITH ... SELECT ...
#EXPLAIN ... WITH ... SELECT ...

WITH RECURSIVE cte_count (n) 
AS (
      SELECT 1
      UNION ALL
      SELECT n + 1 
      FROM cte_count 
      WHERE n < 3
    )
SELECT *
FROM cte_count;

WITH RECURSIVE employee_paths AS
  ( SELECT employeeNumber,
           reportsTo managerNumber,
           officeCode, 
           1 lvl
   FROM employees
   WHERE reportsTo IS NULL
     UNION ALL
     SELECT e.employeeNumber,
            e.reportsTo,
            e.officeCode,
            lvl+1
     FROM employees e
     INNER JOIN employee_paths ep ON ep.employeeNumber = e.reportsTo )
SELECT employeeNumber,
       managerNumber,
       lvl,
       city
FROM employee_paths ep
INNER JOIN offices o USING (officeCode)
ORDER BY lvl, city;

DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
 
CREATE TABLE t1 (
    id INT PRIMARY KEY
);
 
CREATE TABLE t2 (
    id INT PRIMARY KEY
);
 
INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);

SELECT id
FROM t1
UNION
SELECT id
FROM t2;

SELECT id
FROM t1
UNION ALL
SELECT id
FROM t2;

SELECT 
    firstName, 
    lastName
FROM
    employees 
UNION 
SELECT 
    contactFirstName, 
    contactLastName
FROM
    customers;
    
SELECT 
    CONCAT(firstName,' ',lastName) fullname
FROM
    employees 
UNION 
SELECT 
    CONCAT(contactFirstName,' ',contactLastName)
FROM
    customers;
    
SELECT 
    concat(firstName,' ',lastName) fullname
FROM
    employees 
UNION 
SELECT 
    concat(contactFirstName,' ',contactLastName)
FROM
    customers
ORDER BY fullname;

SELECT 
    CONCAT(firstName, ' ', lastName) fullname, 
    'Employee' as contactType
FROM
    employees 
UNION 
SELECT 
    CONCAT(contactFirstName, ' ', contactLastName),
    'Customer' as contactType
FROM
    customers
ORDER BY 
    fullname;
    
SELECT 
    CONCAT(firstName,' ',lastName) fullname
FROM
    employees 
UNION SELECT 
    CONCAT(contactFirstName,' ',contactLastName)
FROM
    customers
ORDER BY 1;

SELECT * FROM t2;

# NOT supported by mySQL, but by SQL
SELECT id FROM t1
INTERSECT
SELECT id FROM t2;

# SIMULATE INTERSECTION within mySQL
SELECT DISTINCT id 
FROM t1 INNER JOIN t2 USING(id);

SELECT DISTINCT id
FROM t1
WHERE id IN (SELECT id FROM t2);

# not in mySQL
SELECT id FROM t1
MINUS
SELECT id FROM t2;

# SIMULATE MINUS
SELECT id 
FROM t1 LEFT JOIN t2 USING (id)
WHERE t2.id IS NULL;

DROP TABLE tasks;
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY (task_id)
);

INSERT INTO tasks(title,priority)
VALUES('Learn MySQL INSERT Statement',1);

INSERT INTO tasks(title,priority)
VALUES('Understanding DEFAULT keyword in INSERT statement',DEFAULT);

INSERT INTO tasks(title, start_date, due_date)
VALUES('Insert date into table','2018-01-09','2018-09-15');

INSERT INTO tasks(title,start_date,due_date)
VALUES('Use current date for the task',CURRENT_DATE(),CURRENT_DATE());

INSERT INTO tasks(title, priority)
VALUES
    ('My first task', 1),
    ('It is the second task',2),
    ('This is the third task of the week',3);
    
SELECT * FROM tasks;
SELECT last_insert_id();

SHOW VARIABLES LIKE 'max_allowed_packet'; # maximum number of rows/records by a single insert statement
SHOW VARIABLES LIKE 'net_buffer_length';

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);

INSERT INTO suppliers (
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';
    
SELECT * FROM suppliers;

DROP TABLE IF EXISTS stats;
 
CREATE TABLE stats (
    totalProduct INT,
    totalCustomer INT,
    totalOrder INT
);

INSERT INTO stats(totalProduct, totalCustomer, totalOrder)
VALUES(
    (SELECT COUNT(*) FROM products),
    (SELECT COUNT(*) FROM customers),
    (SELECT COUNT(*) FROM orders)
);

SELECT * FROM stats;

DROP TABLE IF EXISTS devices;
CREATE TABLE devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO devices(name)
VALUES('Router F1'),('Switch 1'),('Switch 2');

SELECT id, name
FROM  devices;
    
INSERT INTO 
   devices(name) 
VALUES 
   ('Printer') 
ON DUPLICATE KEY UPDATE name = 'Printer';

INSERT INTO devices(id, name) 
VALUES 
   (4, 'Printer') 
ON DUPLICATE KEY UPDATE name = 'Central Printer';

SELECT id, name
FROM  devices;

DROP TABLE IF EXISTS subscribers;
CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com');

INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com'), 
      ('jane.smith@ibm.com');
      
SELECT * FROM subscribers;

INSERT IGNORE INTO subscribers(email)
VALUES('john.doe@gmail.com'), 
      ('jane.smith@ibm.com');
      
SHOW WARNINGS;

SELECT * FROM subscribers;

DROP TABLE IF EXISTS tokens;
CREATE TABLE tokens (
    s VARCHAR(6)
);

SET sql_mode='STRICT_TRANS_TABLES';

INSERT INTO tokens VALUES('abcdefg');
INSERT IGNORE INTO tokens VALUES('abcdefg');
SELECT * FROM tokens;

SET sql_mode='';
SELECT now();

SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
    
UPDATE employees
SET
	email = 'mary.patterson@classicmodelcars.com'
WHERE
	employeeNumber = 1056;
    
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
UPDATE employees
SET email = REPLACE(email,'@classicmodelcars.com','@mysqltutorial.org')
WHERE
   jobTitle = 'Sales Rep' AND
   officeCode = 6;
   
SELECT 
    customername, 
    salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;

# random selection    
SELECT 
    employeeNumber
FROM
    employees
WHERE
    jobtitle = 'Sales Rep'
ORDER BY RAND()
LIMIT 1;

UPDATE customers 
SET 
    salesRepEmployeeNumber = (SELECT 
            employeeNumber
        FROM
            employees
        WHERE
            jobtitle = 'Sales Rep'
        ORDER BY RAND()
        LIMIT 1)
WHERE
    salesRepEmployeeNumber IS NULL;
    
SELECT 
     salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;  # empty now

DROP DATABASE IF EXISTS empdb;
CREATE DATABASE IF NOT EXISTS empdb;
USE empdb;

-- create tables
CREATE TABLE merits (
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY (performance)
);
 
CREATE TABLE employees (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
        REFERENCES merits (performance)
);

SHOW WARNINGS;

-- insert data for merits table
INSERT INTO merits (performance,percentage)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);
      
-- insert data for employees table
INSERT INTO employees (emp_name,performance,salary)      
VALUES('Mary Doe', 1, 50000),
      ('Cindy Smith', 3, 65000),
      ('Sue Greenspan', 4, 75000),
      ('Grace Dell', 5, 125000),
      ('Nancy Johnson', 3, 85000),
      ('John Doe', 2, 45000),
      ('Lily Bush', 3, 55000);
      
UPDATE employees
        INNER JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * percentage;
    
SELECT * FROM employees;

INSERT INTO employees(emp_name,performance,salary)
VALUES('Jack William',NULL,43000),
      ('Ricky Bond',NULL,52000);
      
UPDATE employees
        LEFT JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * 0.015
WHERE
    merits.percentage IS NULL;
    
USE classicmodels;

DELETE FROM employees 
WHERE
    officeCode = 4;

DELETE FROM employees;

DESCRIBE employees;
SHOW TABLES;
DESCRIBE offices;
SHOW CREATE TABLE employees;

SELECT * FROM customers
ORDER BY customerName
LIMIT 12;

DELETE FROM customers
ORDER BY customerName
LIMIT 10;

DELETE FROM customers
WHERE country = 'France'
ORDER BY creditLimit
LIMIT 5;

DROP TABLE IF EXISTS buildings, rooms; 
CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);

INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');
      
SELECT * FROM buildings;

INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);
      
SELECT * FROM rooms;

DESCRIBE rooms;

DELETE FROM buildings 
WHERE building_no = 2;

SELECT * FROM buildings;
SELECT * FROM rooms;

USE information_schema;
 
SELECT 
    table_name
FROM
    referential_constraints
WHERE
    constraint_schema = 'classicmodels'
        AND referenced_table_name = 'buildings'
        AND delete_rule = 'CASCADE';
 
USE classicmodels;
 
DROP TABLE IF EXISTS t1, t2;
 
CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);
 
CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);
 
INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

SELECT * FROM t1;
SELECT * FROM t2;

DELETE t1,t2 
FROM t1 INNER JOIN t2 
	ON t2.ref = t1.id 
WHERE t1.id = 1;

SELECT * FROM t1;
SELECT * FROM t2;

DELETE t1 
FROM t1 INNER JOIN t2 
	ON t2.ref = t1.id 
WHERE t1.id = 2;

SELECT * FROM t1;
SELECT * FROM t2;

DELETE t2 
FROM t1 INNER JOIN t2 
	ON t2.ref = t1.id 
WHERE t1.id = 3;

SELECT * FROM t1;
SELECT * FROM t2;

DELETE customers 
FROM customers
        LEFT JOIN
    orders ON customers.customerNumber = orders.customerNumber 
WHERE
    orderNumber IS NULL;
    
SELECT 
    c.customerNumber, 
    c.customerName, 
    orderNumber
FROM
    customers c
        LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;

DROP TABLE IF EXISTS cities;    
CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    population INT NOT NULL
);

INSERT INTO cities(name,population)
VALUES('New York',8008278),
      ('Los Angeles',3694825),
      ('San Diego',1223405);
      
SELECT * FROM cities;

REPLACE INTO cities (id,population)
VALUES(2,3696820);

REPLACE INTO cities (id,population)
VALUES(4,3696820);

REPLACE INTO cities
SET id = 4,
    name = 'Phoenix',
    population = 1768980;
    
SELECT * FROM cities;

REPLACE INTO 
    cities (name,population)
SELECT 
    name,
    population 
FROM 
   cities # can be another table
WHERE id = 1;

SELECT * FROM cities;

PREPARE stmt1 FROM 
    'SELECT 
            productCode, 
            productName 
		FROM products
        WHERE productCode = ?';

SET @pc = 'S10_1678'; 

EXECUTE stmt1 USING @pc;

SET @pc = 'S12_1099';

EXECUTE stmt1 USING @pc;

DEALLOCATE PREPARE stmt1;

SET autocommit = 0; # 0/OFF, 1/ON, and the default if 1

-- 1. start a new transaction
START TRANSACTION;
 
-- 2. Get the latest order number
SELECT 
    @orderNumber:=MAX(orderNUmber)+1
FROM
    orders;
 
-- 3. insert a new order for customer 145
INSERT INTO orders(orderNumber,
                   orderDate,
                   requiredDate,
                   shippedDate,
                   status,
                   customerNumber)
VALUES(@orderNumber,
       '2005-05-31',
       '2005-06-10',
       '2005-06-11',
       'In Process',
        145);
        
-- 4. Insert order line items
INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantityOrdered,
                         priceEach,
                         orderLineNumber)
VALUES(@orderNumber,'S18_1749', 30, '136', 1),
      (@orderNumber,'S18_2248', 50, '55.09', 2); 
      
-- 5. commit changes    
COMMIT;

SELECT 
    a.orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    status,
    comments,
    customerNumber,
    orderLineNumber,
    productCode,
    quantityOrdered,
    priceEach
FROM
    orders a
        INNER JOIN
    orderdetails b USING (orderNumber)
WHERE
    a.ordernumber = 10426;

SELECT * FROM t1;
START TRANSACTION;
DELETE FROM t1;
SELECT * FROM t1;
ROLLBACK;
SELECT * FROM t1;

SET autocommit = ON; # you will see the difference from another mysql session
SELECT * FROM t1;
START TRANSACTION;
DELETE FROM t1;
SELECT * FROM t1;
ROLLBACK;
SELECT * FROM t1;

CREATE TABLE messages ( 
    id INT NOT NULL AUTO_INCREMENT, 
    message VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id) 
);

SELECT CONNECTION_ID();

INSERT INTO messages(message) 
VALUES('Hello');

SELECT * FROM messages;

LOCK TABLE messages READ;
INSERT INTO messages(message) 
VALUES('Hi');
SHOW WARNINGS;
SELECT CONNECTION_ID();
SHOW PROCESSLIST;

UNLOCK TABLES;
SELECT * FROM messages;
LOCK TABLE messages WRITE;
INSERT INTO messages(message) 
VALUES('Hi2');
SELECT * FROM messages;
# INSERT FROM another connection
SHOW PROCESSLIST;
UNLOCK TABLES;
SHOW PROCESSLIST;
SELECT * FROM messages;

SHOW CREATE DATABASE classicmodels;
SHOW CREATE TABLE messages;

# mySQL Storage Engines:
#MyISAM
#InnoDB
#MERGE
#MEMORY (HEAP)
#ARCHIVE
#CSV
#FEDERATED

# column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] column_constraint(like CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY);
# PRIMARY KEY (col1,col2,...)
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

DESCRIBE tasks;

CREATE TABLE IF NOT EXISTS checklists (
    todo_id INT AUTO_INCREMENT,
    task_id INT,
    todo VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (todo_id , task_id),
    FOREIGN KEY (task_id)
        REFERENCES tasks (task_id)
        ON UPDATE RESTRICT 
        ON DELETE CASCADE
);

# SEQUENCE via AUTO_INCREMENT
CREATE DATABASE sequence;
USE sequence;
CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane');

SELECT last_insert_id();
SELECT * FROM employees;

DELETE FROM employees 
WHERE
    emp_no = 2;
    
INSERT INTO employees(first_name,last_name)
VALUES('Jack','Lee');

SELECT * FROM employees;

UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 1
WHERE
    emp_no = 3;
# will issue an error since 1<3

UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 10
WHERE
    emp_no = 3;
    
SELECT last_insert_id();
SELECT * FROM employees;

INSERT INTO employees(first_name,last_name)
VALUES('Wang','Lee');

SELECT last_insert_id();
SELECT * FROM employees;

USE classicmodels;

CREATE TABLE vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);

DESCRIBE vehicles;

ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;

DESCRIBE vehicles;

ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);
DESCRIBE vehicles;

ALTER TABLE vehicles 
MODIFY note VARCHAR(100) NOT NULL;
DESCRIBE vehicles;

ALTER TABLE vehicles 
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;

DESCRIBE vehicles;

ALTER TABLE vehicles 
CHANGE COLUMN note vehicleCondition VARCHAR(100) NOT NULL;  # can use AFTER col_name

DESCRIBE vehicles;

ALTER TABLE vehicles
DROP COLUMN vehicleCondition;

SHOW TABLES;

ALTER TABLE vehicles 
RENAME TO cars;   # also work for temporary TABLE, for which RENAME TABLE ... TO ... does not work

SHOW TABLES;

SELECT database();
DROP DATABASE IF EXISTS hr;
CREATE DATABASE IF NOT EXISTS hr;
USE hr;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);
 
CREATE TABLE employees (
    id int AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    department_id int not null,
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

INSERT INTO departments(dept_name)
VALUES('Sales'),('Markting'),('Finance'),('Accounting'),('Warehouses'),('Production');

INSERT INTO employees(first_name,last_name,department_id) 
VALUES('John','Doe',1),
        ('Bush','Lily',2),
        ('David','Dave',3),
        ('Mary','Jane',4),
        ('Jonatha','Josh',5),
        ('Mateo','More',1);
        
SELECT 
    department_id, dept_name
FROM
    departments;
    
SELECT 
    id, first_name, last_name, department_id
FROM
    employees;
    
CREATE VIEW v_employee_info as
    SELECT 
        id, first_name, last_name, dept_name
    from
        employees
            inner join
        departments USING (department_id);
        
SELECT 
    *
FROM
    v_employee_info;
    
RENAME TABLE employees TO people;

# issue an error, has to manually moodify VIEW 
SELECT 
    *
FROM
    v_employee_info;

CHECK TABLE v_employee_info;
# We need to manually change the v_employee_info view so that it refers to the people table instead of the employees table.

### Renaming a table that referenced by a stored procedure
# In case the table that you are going to rename is referenced by a stored procedure, you have to manually adjust it like you did with the view.
# First, rename the people table back to the employees table.
RENAME TABLE people TO employees;
SHOW TABLES;
# 
DELIMITER $$
CREATE PROCEDURE get_employee(IN p_id INT)
BEGIN
    SELECT first_name
        ,last_name
        ,dept_name
    FROM employees
    INNER JOIN departments using (department_id)
    WHERE id = p_id;
END $$
DELIMITER ;

CALL get_employee(1); # works
RENAME TABLE employees TO people;
CALL get_employee(2); # error
# To fix this, we must manually change the employees table in the stored procedure to people table.

# Renaming a table that has foreign keys referenced to
RENAME TABLE departments TO depts;
DELETE FROM depts 
WHERE
    department_id = 1;
 # error
 
# RENAME TABLES 
RENAME TABLE depts TO departments,
             people TO employees;

CREATE TEMPORARY TABLE lastnames
SELECT DISTINCT last_name from employees;

RENAME TABLE lastnames TO unique_lastnames; # error, fail for temporary table
ALTER TABLE lastnames
RENAME TO unique_lastnames;

SELECT database();

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    excerpt VARCHAR(400),
    content TEXT,
    created_at DATETIME,
    updated_at DATETIME
);

ALTER TABLE posts
DROP COLUMN excerpt;

ALTER TABLE posts
DROP COLUMN created_at,
DROP COLUMN updated_at;

# FOREIGN KEY
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE posts 
ADD COLUMN category_id INT NOT NULL;

# what is fk_cat?
ALTER TABLE posts 
ADD CONSTRAINT fk_cat   
FOREIGN KEY (category_id) 
REFERENCES categories(id);

DESCRIBE posts;

# error due to FOREIGN KEYS 
ALTER TABLE posts
DROP COLUMN category_id;

ALTER TABLE posts 
DROP FOREIGN KEY fk_cat;
#ALTER TABLE `table_name` DROP FOREIGN KEY `id_name_fk`;
#ALTER TABLE `table_name` DROP INDEX  `id_name_fk`;
DESCRIBE posts;
ALTER TABLE posts
DROP COLUMN category_id;

CREATE TABLE IF NOT EXISTS vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE vendors
ADD COLUMN phone VARCHAR(15) AFTER name;

ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL;

INSERT INTO vendors(name,phone,vendor_group)
VALUES('IBM','(408)-298-2987',1);
 
INSERT INTO vendors(name,phone,vendor_group)
VALUES('Microsoft','(408)-298-2988',1);

SELECT 
    id, name, phone,vendor_group
FROM
    vendors;
    
ALTER TABLE vendors
ADD COLUMN email VARCHAR(100) NOT NULL,
ADD COLUMN hourly_rate decimal(10,2) NOT NULL;

SELECT * FROM vendors;

ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL; # duplicated

# THERE is no statement "ADD COLUMN IF NOT EXISTS"
# to check the existence of a column
SELECT 
    IF(count(*) = 1, 'Exist','Not Exist') AS result
FROM
    information_schema.columns
WHERE
    table_schema = 'hr'
        AND table_name = 'vendors'
        AND column_name = 'phone';

#To execute the DROP TABLE statement, you must have DROP privileges for the table that you want to remove.
CREATE TABLE insurances (
    id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    effectiveDate DATE NOT NULL,
    duration INT NOT NULL,
    amount DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);

DROP TABLE insurances;

CREATE TABLE CarAccessories (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);
 
CREATE TABLE CarGadgets (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);

DROP TABLE CarAccessories, CarGadgets;

DROP TABLE aliens;  # error, table not exist
DROP TABLE IF EXISTS aliens;
SHOW WARNINGS;

CREATE TABLE test1(
  id INT AUTO_INCREMENT,
  PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS test2 LIKE test1;
CREATE TABLE IF NOT EXISTS test3 LIKE test1;

SELECT database();
SET @schema = 'hr';
SET @pattern = 'test%';

SELECT CONCAT('DROP TABLE ',GROUP_CONCAT(CONCAT(@schema,'.',table_name)),';')
INTO @droplike
FROM information_schema.tables
WHERE @schema = database()
AND table_name LIKE @pattern;

SHOW TABLES;
SELECT @droplike;

# execute dynamic sql
PREPARE stmt FROM @droplike;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

# put everything together
-- set table schema and pattern matching for tables
SET @schema = 'classicmodels';
SET @pattern = 'test%';
 
-- build dynamic sql (DROP TABLE tbl1, tbl2...;)
SELECT CONCAT('DROP TABLE ',GROUP_CONCAT(CONCAT(@schema,'.',table_name)),';')
INTO @droplike
FROM information_schema.tables
WHERE @schema = database()
AND table_name LIKE @pattern;
 
-- display the dynamic sql statement
SELECT @droplike;
 
-- execute dynamic sql
PREPARE stmt FROM @droplike;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

USE classicmodels;
DROP TEMPORARY TABLE IF EXISTS credits;
CREATE TEMPORARY TABLE credits(
    customerNumber INT PRIMARY KEY,
    creditLimit DEC(10,2)
);

INSERT INTO credits(customerNumber,creditLimit)
SELECT customerNumber, creditLimit
FROM customers
WHERE creditLimit > 0;

CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;

SELECT 
    customerNumber, 
    customerName, 
    sales
FROM
    top_customers
ORDER BY sales;

DROP TEMPORARY TABLE top_customers;

DELIMITER //
CREATE PROCEDURE check_table_exists(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
    END IF;
END //
DELIMITER ;

CALL check_table_exists('credits');
SELECT @table_exists;

# TRUNCATE TABLE, more efficient than DELETE FROM table;
USE classicmodels;
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

DELIMITER $$
CREATE PROCEDURE load_book_data(IN num INT(4))
BEGIN
    DECLARE counter INT(4) DEFAULT 0;
    DECLARE book_title VARCHAR(255) DEFAULT '';
 
    WHILE counter < num DO
      SET book_title = CONCAT('Book title #',counter);
      SET counter = counter + 1;
 
      INSERT INTO books(title)
      VALUES(book_title);
    END WHILE;
END$$
DELIMITER ;
 
CALL load_book_data(10000); 

SELECT * FROM books;
TRUNCATE TABLE books; 
SELECT * FROM books;

CALL load_book_data(100); 
SELECT * FROM books;
DELETE FROM books; # DELETE IS FAST for 100 rows?
SELECT * FROM books;

#Generated Columns

SELECT database();

DROP TABLE IF EXISTS contacts;
 
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    fullname varchar(101) GENERATED ALWAYS AS (CONCAT(first_name,' ',last_name)),
    email VARCHAR(100) NOT NULL
);

INSERT INTO contacts(first_name,last_name, email)
VALUES('john','doe','john.doe@mysqltutorial.org');

SELECT 
    *
FROM
    contacts;
    
DESCRIBE contacts; # virtual generated
 
USE classicmodels;

ALTER TABLE products
ADD COLUMN stockValue DOUBLE 
GENERATED ALWAYS AS (buyprice*quantityinstock) STORED;

SELECT 
    productName, 
    ROUND(stockValue, 2) stock_value
FROM
    products;

# MySQL Data Types
# http://www.mysqltutorial.org/mysql-data-types.aspx
# Numeric Types Description                                                                                                                                                                                                               
#  TINYINT  A very small integer
#  SMALLINT A small integer
#  MEDIUMINT  A medium-sized integer
#  INT  A standard integer
#  BIGINT A large integer
#  DECIMAL  A fixed-point number
#  FLOAT  A single-precision floating point number
#  DOUBLE A double-precision floating point number
#  BIT  A bit field
# MySQL Boolean data type
#  BOOLEAN and BOOL are synonyms for TINYINT(1).
# String Types  Description
#  CHAR A fixed-length nonbinary (character) string
#  VARCHAR  A variable-length non-binary string
#  BINARY A fixed-length binary string
#  VARBINARY  A variable-length binary string
#  TINYBLOB A very small BLOB (binary large object)
#  BLOB A small BLOB
#  MEDIUMBLOB A medium-sized BLOB
#  LONGBLOB A large BLOB
#  TINYTEXT A very small non-binary string
#  TEXT A small non-binary string
#  MEDIUMTEXT A medium-sized non-binary string
#  LONGTEXT A large non-binary string
#  ENUM An enumeration; each column value may be assigned one enumeration member
#  SET  A set; each column value may be assigned zero or more SET members
# Date and Time Types Description
#  DATE A date value in CCYY-MM-DD format
#  TIME A time value in hh:mm:ss format
#  DATETIME A date and time value inCCYY-MM-DD hh:mm:ssformat
#  TIMESTAMP  A timestamp value in CCYY-MM-DD hh:mm:ss format
#  YEAR A year value in CCYY or YY format
# Spatial Data Types  Description
#  GEOMETRY A spatial value of any type
#  POINT  A point (a pair of X-Y coordinates)
#  LINESTRING A curve (one or more POINT values)
#  POLYGON  A polygon
#  GEOMETRYCOLLECTION A collection of GEOMETRYvalues
#  MULTILINESTRING  A collection of LINESTRINGvalues
#  MULTIPOINT A collection of POINTvalues
#  MULTIPOLYGON A collection of POLYGONvalues
# JSON data type

CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_text VARCHAR(255)
);

INSERT INTO 
    items(item_text)
VALUES
    ('laptop'), 
    ('mouse'),
    ('headphone');
    
SELECT * FROM items;

INSERT INTO items(item_id,item_text)
VALUES(10,'Server');

INSERT INTO items(item_text)
VALUES('Router');

SELECT * FROM items;

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    total_member INT UNSIGNED,
    PRIMARY KEY (class_id)
);

INSERT INTO classes(name, total_member)
VALUES('Weekend',100);

INSERT INTO classes(name, total_member)
VALUES('Fly',-50);

# zerofill for unsigned int
CREATE TABLE zerofill_tests(
    id INT AUTO_INCREMENT PRIMARY KEY,
    v1 INT(2) ZEROFILL,
    v2 INT(3) ZEROFILL,
    v3 INT(5) ZEROFILL
);

INSERT INTO zerofill_tests(v1,v2,v3)
VALUES(1,6,9);

SELECT 
    v1, v2, v3
FROM
    zerofill_tests;
    
CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    cost DECIMAL(19 , 4 ) NOT NULL
);

INSERT INTO materials(description,cost)
VALUES('Bicycle', 500.34),('Seat',10.23),('Break',5.21);

SELECT * FROM materials;
    
ALTER TABLE materials
MODIFY cost DECIMAL(19,4) zerofill;

SELECT * FROM materials;

# MySQL BIT data type, Bit(n) for n-bite values
# SELECT CHARSET(B'); -- binary
CREATE TABLE working_calendars(
    y INT,
    w INT,
    days BIT(7),
    PRIMARY KEY(y,w)
);

INSERT INTO working_calendars(y,w,days)
VALUES(2017,1,B'1111100');

SELECT * FROM working_calendars;
SELECT bin(days) FROM working_calendars;

INSERT INTO working_calendars(y,w,days)
VALUES(2017,2,B'1100');
SELECT * FROM working_calendars;
SELECT bin(days) FROM working_calendars;

SELECT 
    y, w , lpad(bin(days),7,'0')
FROM
    working_calendars;
    
SELECT true, false, TRUE, FALSE, True, False;

CREATE TABLE task (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN
);

DESCRIBE task;

INSERT INTO task(title,completed)
VALUES('Master MySQL Boolean type',true),
      ('Design database table',false); 

INSERT INTO task(title,completed)
VALUES('Test Boolean with a number',2);   

SELECT * FROM task;

SELECT 
    id, 
    title, 
    IF(completed, 'true', 'false') completed
FROM
    task;

SELECT 
    id, title, completed
FROM
    task
WHERE
    completed IS TRUE;
    
SELECT 
    id, title, completed
FROM
    task
WHERE
    completed = TRUE;
    
SELECT 
    id, title, completed
FROM
    task
WHERE
    completed IS FALSE;
    
SELECT 
    id, title, completed
FROM
    task
WHERE
    completed IS NOT TRUE;    

CREATE TABLE mysql_char_test (
    status CHAR(3)
);

INSERT INTO mysql_char_test(status)
VALUES('Yes'),('No'), ('  Y');

SELECT 
    status, 
    LENGTH(status)
FROM
    mysql_char_test;

SELECT * 
FROM mysql_char_test
WHERE status = 'Y';

SELECT * 
FROM mysql_char_test
WHERE status = '  Y';

CREATE UNIQUE INDEX uidx_status 
ON mysql_char_test(status);

INSERT INTO mysql_char_test(status)
VALUES('N');

INSERT INTO mysql_char_test(status)
VALUES('N ');  # error since only differring by padding spaces

CREATE TABLE IF NOT EXISTS varchar_test (
    s1 VARCHAR(32765) NOT NULL,
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;

CREATE TABLE IF NOT EXISTS varchar_test_2 (
    s1 VARCHAR(32766) NOT NULL, -- error
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;

CREATE TABLE items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(3)
);
 
INSERT INTO items(title)
VALUES('ABCD');  # too long

INSERT INTO items(title)
VALUES('AB '),
      ('ABC   ');  # spaces removed, with a warning

SELECT 
    id, title, length(title)
FROM
    items;
    
# MySQL TEXT Data Type: TINYTEXT/255B, TEXT/64KB, MEDIUMTEXT/16MB, and LONGTEXT/4GB
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    summary TINYTEXT
);

ALTER TABLE articles 
ADD COLUMN body TEXT NOT NULL
AFTER summary;

CREATE TABLE whitepapers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    body MEDIUMTEXT NOT NULL,
    published_on DATE NOT NULL
); 

# MySQL DATE data type
# DATE values range from 1000-01-01 to 9999-12-31
# When strict mode is disabled, MySQL converts any invalid date e.g., 2015-02-30 to the zero date value 0000-00-00.
# Year values with only TWO digits: in the range 00-69 are converted to 2000-2069.
# 						Year values in the range 70-99 are converted to 1970 – 1999.
CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);

INSERT INTO people(first_name,last_name,birth_date)
VALUES('John','Doe','1990-09-01');

INSERT INTO people(first_name,last_name,birth_date)
VALUES('Jack','Daniel','01-09-01'),
      ('Lily','Bush','80-09-01');
      
SELECT * FROM people;

SELECT NOW() INTO @now;
SELECT @now, date(@now), month(@now), year(@now), monthname(@now), quarter(@now), 
	   dayofweek(@now), dayofmonth(@now), dayofyear(@now), weekday(@now), week(@now), week(@now, 1), weekofyear(@now);

SELECT CURDATE() , DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS today;

SELECT DATEDIFF('2015-11-04','2014-11-04') days;

SELECT 
    CURDATE() today,
    DATE_ADD(CURDATE(), INTERVAL -1 DAY) 'yesterday',
    DATE_ADD(CURDATE(), INTERVAL 1 DAY) 'one day later',
    DATE_ADD(CURDATE(), INTERVAL 1 WEEK) 'one week later',
    DATE_ADD(CURDATE(), INTERVAL 1 MONTH) 'one month later',
    DATE_ADD(CURDATE(), INTERVAL 1 YEAR) 'one year later';
    
# MySQL TIME data type: ranges from -838:59:59 to 838:59:59
CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME,
    end_at TIME
);

INSERT INTO tests(name,start_at,end_at)
VALUES('Test 1', '08:00:00','10:00:00');

SELECT 
    name, start_at, end_at
FROM
    tests;
    
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 2','083000','101500'),
	  ('Test 3',082000,102000),
      ('Test 4','9:5:0',100500);

SELECT 
    name, start_at, end_at
FROM
    tests;
    
INSERT INTO tests(name,start_at,end_at)
VALUES('Test invalid','083000','106000'); # error: min>59

SELECT 
    CURRENT_TIME(),
    ADDTIME(CURRENT_TIME(), 023000),
    SUBTIME(CURRENT_TIME(), 023000);
    
SELECT 
    TIMEDIFF(end_at, start_at)
FROM
    tests;
    
SELECT 
    name,
    TIME_FORMAT(start_at, '%h:%i %p') start_at,
    TIME_FORMAT(end_at, '%h:%i %p') end_at
FROM
    tests;
    
SELECT 
	current_time() now, 
	hour(current_time()) h,
    min(current_time()) m, 
    second(current_time()) s;

SELECT 
   CURRENT_TIME(), 
   UTC_TIME();
   
# MySQL DATETIME Data Type, YYYY-MM-DD HH:MM:SS, 1000-01-01 00:00:00 to 9999-12-31 23:59:59
# TIMESTAMP:									 1970-01-01 00:00:01 UTC to 2038-01-19 03:14:07 UTC.

SET time_zone = '+00:00';

CREATE TABLE timestamp_n_datetime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ts TIMESTAMP,
    dt DATETIME
);

INSERT INTO timestamp_n_datetime(ts,dt)
VALUES(NOW(),NOW());

SELECT * FROM timestamp_n_datetime;

SET time_zone = '+03:00';
SELECT * FROM timestamp_n_datetime;

SET @dt =  NOW();
SELECT @dt, DATE(@dt);

CREATE TABLE test_dt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME
);
 
INSERT INTO test_dt(created_at)
VALUES('2015-11-05 14:29:36');

SELECT 
    *
FROM
    test_dt
WHERE
    created_at = '2015-11-05';
    
SELECT 
    *
FROM
    test_dt
WHERE
    DATE(created_at) = '2015-11-05';
    
SELECT TIME(@dt);
SELECT DATE_FORMAT(@dt, '%H:%i:%s - %W %M %Y');
SELECT @dt start, 
       DATE_ADD(@dt, INTERVAL 1 SECOND) '1 second later',
       DATE_ADD(@dt, INTERVAL 1 MINUTE) '1 minute later',
       DATE_ADD(@dt, INTERVAL 1 HOUR) '1 hour later',
       DATE_ADD(@dt, INTERVAL 1 DAY) '1 day later',
       DATE_ADD(@dt, INTERVAL 1 WEEK) '1 week later',
       DATE_ADD(@dt, INTERVAL 1 MONTH) '1 month later',
       DATE_ADD(@dt, INTERVAL 1 YEAR) '1 year later';
       
SELECT @dt start, 
       DATE_SUB(@dt, INTERVAL 1 SECOND) '1 second before',
       DATE_SUB(@dt, INTERVAL 1 MINUTE) '1 minute before',
       DATE_SUB(@dt, INTERVAL 1 HOUR) '1 hour before',
       DATE_SUB(@dt, INTERVAL 1 DAY) '1 day before',
       DATE_SUB(@dt, INTERVAL 1 WEEK) '1 week before',
       DATE_SUB(@dt, INTERVAL 1 MONTH) '1 month before',
       DATE_SUB(@dt, INTERVAL 1 YEAR) '1 year before';
       
CREATE TABLE datediff_test (
    dt DATETIME
);

INSERT INTO datediff_test(dt)
VALUES('2010-04-30 07:27:39'),
    ('2010-05-17 22:52:21'),
    ('2010-05-18 01:19:10'),
    ('2010-05-22 14:17:16'),
    ('2010-05-26 03:26:56'),
    ('2010-06-10 04:44:38'),
    ('2010-06-13 13:55:53');
    
SELECT 
    dt, 
    DATEDIFF(NOW(), dt)
FROM
    datediff_test;
    
CREATE TABLE test_timestamp (
    t1  TIMESTAMP
);

SET time_zone='+00:00';

INSERT INTO test_timestamp(t1)
VALUES('2008-01-01 00:00:01');

SELECT t1 FROM test_timestamp;

SET time_zone ='+03:00';
SELECT t1 FROM test_timestamp;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO categories(name) 
VALUES ('A');

SELECT * FROM categories;

ALTER TABLE categories
ADD COLUMN updated_at 
  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  ON UPDATE CURRENT_TIMESTAMP;
  
INSERT INTO categories(name)
VALUES('B');

SELECT * FROM categories;

UPDATE categories 
SET name = 'B+'
WHERE id = 2;

SELECT * FROM categories;

# update with the same value, no effects
UPDATE categories 
SET name = 'B+'
WHERE id = 2;

SELECT * FROM categories;

# JSON
CREATE TABLE events( 
  id int auto_increment primary key, 
  event_name varchar(255), 
  visitor varchar(255), 
  properties json, 
  browser json
);

INSERT INTO events(event_name, visitor,properties, browser) 
VALUES (
  'pageview', 
   '1',
   '{ "page": "/" }',
   '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
('pageview', 
  '2',
  '{ "page": "/contact" }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 2560, "y": 1600 } }'
),
(
  'pageview', 
  '1',
  '{ "page": "/products" }',
  '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
(
  'purchase', 
   '3',
  '{ "amount": 200 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1600, "y": 900 } }'
),
(
  'purchase', 
   '4',
  '{ "amount": 150 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1280, "y": 800 } }'
),
(
  'purchase', 
  '4',
  '{ "amount": 500 }',
  '{ "name": "Chrome", "os": "Windows", "resolution": { "x": 1680, "y": 1050 } }'
);

SELECT id, browser->'$.name' browser, browser->>'$.name' "browser_w/o_quoto"
FROM events;

SELECT browser->>'$.name' browser, 
      count(browser)
FROM events
GROUP BY browser->>'$.name';

SELECT visitor, SUM(properties->>'$.amount') revenue
FROM events
WHERE properties->>'$.amount' > 0
GROUP BY visitor;

# MySQL ENUM data type
CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

INSERT INTO tickets(title, priority)
VALUES('Scan virus for computer A', 'High');

INSERT INTO tickets(title, priority)
VALUES('Upgrade Windows OS for all computers', 1);

INSERT INTO tickets(title, priority)
VALUES('Install Google Chrome for Mr. John', 'Medium'),
      ('Create a new user for the new employee David', 'High');
      
SELECT * FROM tickets;

INSERT INTO tickets(title)
VALUES('Refresh the computer of Ms. Lily');  # use the first choice by default

SELECT * FROM tickets;

SELECT 
    *
FROM
    tickets
WHERE
    priority = 'High';
    
SELECT 
    *
FROM
    tickets
WHERE
    priority = 3;
    
SELECT 
    title, priority
FROM
    tickets
ORDER BY priority DESC;

SELECT 
    column_type
FROM
    information_schema.COLUMNS
WHERE
    TABLE_NAME = 'tickets'
    AND COLUMN_NAME = 'priority';

### constraints
# NOT NULL
DROP TABLE task;
CREATE TABLE task (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

INSERT INTO task(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', '2017-02-01','2017-02-02'),
      ('Check and update NOT NULL constraint to your database', '2017-02-01',NULL);
      
SELECT * 
FROM task
WHERE end_date IS NULL;

UPDATE task
SET 
    end_date = start_date + 7
WHERE
    end_date IS NULL;
    
SELECT * FROM task;

ALTER TABLE task
CHANGE 
    end_date 
    end_date DATE NOT NULL;
    
DESCRIBE task; 

ALTER TABLE task
MODIFY end_date DATE NOT NULL;

SHOW CREATE TABLE task;

# PRIMARY KEY
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);

CREATE TABLE user_roles(
   user_id INT,
   role_id INT,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) 
       REFERENCES users(user_id),
   FOREIGN KEY(role_id) 
       REFERENCES roles(role_id)
);

CREATE TABLE pkdemos(
   id INT,
   title VARCHAR(255) NOT NULL
);

ALTER TABLE pkdemos
ADD PRIMARY KEY(id);

# KEY, INDEX, UNIQUE, PRIMARY KEY
ALTER TABLE users
ADD UNIQUE INDEX username_unique (username ASC) ;

DESCRIBE users;

# MySQL foreign key
SHOW CREATE TABLE employees;

CREATE DATABASE fkdemo;
USE fkdemo;

CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
) ENGINE=INNODB;
 
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
) ENGINE=INNODB;
# default: 
# ON DELETE RESTRICT
# ON UPDATE RESTRICT

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
    
INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

INSERT INTO products(productName, categoryId)
VALUES('iPad',3); # error, 3 not in categoryIDs

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;  # cannot update a parent row

DROP TABLE products;
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM products;

DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM products;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)ENGINE=INNODB;
 
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
        ON UPDATE SET NULL
        ON DELETE SET NULL 
)ENGINE=INNODB;

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
    
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM products;

DELETE FROM categories 
WHERE categoryId = 2;

SELECT * FROM products;

SHOW CREATE TABLE products;
ALTER TABLE products
DROP FOREIGN KEY fk_category;
ALTER TABLE products
DROP KEY fk_category;
SHOW CREATE TABLE products;

CREATE TABLE countries(
    country_id INT AUTO_INCREMENT,
    country_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(country_id)
) ENGINE=InnoDB;

CREATE TABLE cities(
    city_id INT AUTO_INCREMENT,
    city_name VARCHAR(255) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY(city_id),
    FOREIGN KEY(country_id) 
        REFERENCES countries(country_id)
)ENGINE=InnoDB;

INSERT INTO cities(city_name, country_id)
VALUES('New York',1);  # error since 1 is not in the parent table countries yet

DROP TABLE countries; # error since it is referenced by a child

SET foreign_key_checks = 0;
INSERT INTO cities(city_name, country_id)
VALUES('New York',1); 

SET foreign_key_checks = 1;
INSERT INTO countries(country_id, country_name)
VALUES(1,'USA');

# UNIQUE
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address 
		UNIQUE (name , address)
);

INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-2476',
       '4000 North 1st Street');

INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street');

INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-3333','3000 North 1st Street');

INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-1111',
       '4000 North 1st Street');
       
SHOW CREATE TABLE suppliers;

SHOW INDEX FROM suppliers;

DROP INDEX uc_name_address ON suppliers;
SHOW INDEX FROM suppliers;

ALTER TABLE suppliers
ADD CONSTRAINT  uc_name_address
UNIQUE (name, address);

# MySQL CHECK constraint
# [CONSTRAINT [constraint_name]] CHECK (expression) [[NOT] ENFORCED]

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

SHOW CREATE TABLE parts; # 'parts_chk_1, ...'

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',0,-100);

DROP TABLE IF EXISTS parts;
CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost 
        CHECK(price >= cost)
);

SHOW CREATE TABLE parts;

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',200,100);

# To emulate CHECK constraints in MySQL (before 8.0.16), you can use two triggers: BEFORE INSERT and BEFORE UPDATE.
DROP TABLE IF EXISTS parts;
CREATE TABLE IF NOT EXISTS parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

DELIMITER $ 
CREATE PROCEDURE `check_parts`(IN cost DECIMAL(10,2), IN price DECIMAL(10,2))
BEGIN
    IF cost < 0 THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on parts.cost failed';
    END IF;
    
    IF price < 0 THEN
    SIGNAL SQLSTATE '45001'
       SET MESSAGE_TEXT = 'check constraint on parts.price failed';
    END IF;
    
    IF price < cost THEN
    SIGNAL SQLSTATE '45002'
           SET MESSAGE_TEXT = 'check constraint on parts.price & parts.cost failed';
    END IF;
END$
DELIMITER ;

-- before insert
DELIMITER $
CREATE TRIGGER `parts_before_insert` BEFORE INSERT ON `parts`
FOR EACH ROW
BEGIN
    CALL check_parts(new.cost,new.price);
END$   
DELIMITER ; 

-- before update
DELIMITER $
CREATE TRIGGER `parts_before_update` BEFORE UPDATE ON `parts`
FOR EACH ROW
BEGIN
    CALL check_parts(new.cost,new.price);
END$   
DELIMITER ;

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',100,120);

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-002','Heater',-100,120);

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-002','Heater',100,-120);

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-003','wiper',120,100);

SELECT * FROM parts;

UPDATE parts
SET price = 10
WHERE part_no = 'A-001';

# Emulate CHECK constraints using views
# create a view WITH CHECK OPTION

DROP TABLE IF EXISTS parts;
 
CREATE TABLE IF NOT EXISTS parts_data (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE VIEW parts AS
    SELECT 
        part_no, description, cost, price
    FROM
        parts_data
    WHERE
        cost > 0 AND price > 0 AND price >= cost 
WITH CHECK OPTION;

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',100,120);

INSERT INTO parts_checked(part_no, description,cost,price)
VALUES('A-002','Heater',-100,120); # error

# MySQL character set, collation
SHOW CHARACTER SET;

SET @str = CONVERT('MySQL Character Set' USING ucs2);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

SET @str = CONVERT('MySQL Character Set' USING utf8);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

SET @str = CONVERT('pingüino' USING utf8);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

SELECT CAST(_latin1'MySQL character set' AS CHAR CHARACTER SET utf8);

# SET NAMES 'utf8';
SHOW COLLATION LIKE 'latin1%';  
# _bin/binary, _cs/case sensitive, _ci/case ignoring, usually the default collation

# CREATE DATABASE database_name
# CHARACTER SET character_set_name;
# COLLATE collation_name
CREATE DATABASE mydbdemo
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

# ALTER DATABASE database_name
# CHARACTER SET character_set_name
# COLLATE collation_name;


# CREATE TABLE table_name(
#    ...
# )
# CHARACTER SET character_set_name
# COLLATE collation_name
USE mydbdemo; 
CREATE TABLE t1(
c1 char(25)
);

# ALTER TABLE table_name(
#   ...
# )
# CHARACTER SET character_set_name
# COLLATE collation_name

ALTER TABLE t1
CHARACTER SET latin1
COLLATE latin1_german1_ci;

ALTER TABLE t2
MODIFY c1 VARCHAR(25)
CHARACTER SET latin1;

# Import CSV File
CREATE TABLE discounts (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    expired_date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) NULL,
    PRIMARY KEY (id)
);

SHOW VARIABLES LIKE "secure_file_priv";
SELECT @@global.secure_file_priv;

LOAD DATA INFILE '/home/haowei/work/test_db/discounts.csv' 
INTO TABLE discounts 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM discounts;

LOAD DATA INFILE '/home/haowei/work/test_db/discounts_2.csv' 
INTO TABLE discounts
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title,@expired_date,amount)
SET expired_date = STR_TO_DATE(@expired_date, '%m/%d/%Y');

# from local to remote server
LOAD DATA LOCAL INFILE  '/home/haowei/work/test_db/discounts.csv' 
INTO TABLE discounts
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE classicmodels;
SELECT * FROM orders;

SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled' 
INTO OUTFILE  '/home/haowei/work/test_db/cancelled_orders.csv'
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

SET @TS = DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s');
 
SET @FOLDER = '/home/haowei/work/test_db/';
SET @PREFIX = 'orders';
SET @EXT    = '.csv';

SET @CMD = CONCAT("SELECT * FROM orders INTO OUTFILE '",@FOLDER,@PREFIX,@TS,@EXT,
                   "' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'",
                   "  LINES TERMINATED BY '\r\n';");
PREPARE statement FROM @CMD;
EXECUTE statement;

# add head
(SELECT 'Order Number','Order Date','Status')
UNION 
(SELECT orderNumber,orderDate, status
FROM orders
INTO OUTFILE '/home/haowei/work/test_db/orders.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"'
LINES TERMINATED BY '\r\n');

# use N/A for null values
SELECT 
    orderNumber, orderDate, IFNULL(shippedDate, 'N/A')
FROM
    orders INTO OUTFILE '/home/haowei/work/test_db/orders2.csv' 
    FIELDS ENCLOSED BY '"' 
    TERMINATED BY ';' 
    ESCAPED BY '"' LINES 
    TERMINATED BY '\r\n';

USE classicmodels;    
SELECT * FROM orders; # then you can use mysql workbench to export/import

# MySQL Natural Sorting
DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_no VARCHAR(255) NOT NULL
);

INSERT INTO items(item_no)
VALUES ('1'),
       ('1C'),
       ('10Z'),
       ('2A'),
       ('2'),
       ('3C'),
       ('20D');
       
SELECT 
    item_no
FROM
    items
ORDER BY item_no;

SELECT 
    item_no
FROM
    items
ORDER BY CAST(item_no AS UNSIGNED) , item_no;

TRUNCATE TABLE items;
 
INSERT INTO items(item_no)
VALUES('A-1'),
      ('A-2'),
      ('A-3'),
      ('A-4'),
      ('A-5'),
      ('A-10'),
      ('A-11'),
      ('A-20'),
      ('A-30');
      
SELECT 
    item_no
FROM
    items
ORDER BY item_no;

#SELECT 
#    CONCAT(prefix, suffix)
#FROM
#    items
#ORDER BY 
#    prefix , suffix;

SELECT 
    item_no
FROM
    items
ORDER BY LENGTH(item_no) , item_no;

# mySQL stored procedure
SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
FROM
    customers
ORDER BY customerName;

DELIMITER $$ 
CREATE PROCEDURE GetCustomers()
BEGIN
    SELECT 
        customerName, 
        city, 
        state, 
        postalCode, 
        country
    FROM
        customers
    ORDER BY customerName;    
END$$
DELIMITER ;

CALL GetCustomers();

SELECT * FROM products;

DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *  FROM products;
END //
DELIMITER ;

CALL GetAllProducts();

DELIMITER $$
 
CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT 
        firstName, 
        lastName, 
        city, 
        state, 
        country
    FROM employees
    INNER JOIN offices using (officeCode);
    
END$$
 
DELIMITER ;

DROP PROCEDURE GetEmployees;

#DECLARE variable_name datatype(size) [DEFAULT default_value];
#SET variable_name = value;

DELIMITER $$ 
CREATE PROCEDURE GetTotalOrder()
BEGIN
	DECLARE zero INT DEFAULT 0;
    DECLARE totalOrder INT DEFAULT 0;
    
    SET zero = -1;
    
    SELECT COUNT(*) 
    INTO totalOrder
    FROM orders;
    
    SELECT zero, totalOrder-zero;
END$$
DELIMITER ;

CALL getTotalOrder();

# parameter, modes: IN, OUT, INOUT
DELIMITER // 
CREATE PROCEDURE GetOfficeByCountry(
    IN countryName VARCHAR(255)
)
BEGIN
    SELECT * 
     FROM offices
    WHERE country = countryName;
END //
DELIMITER ;

CALL GetOfficeByCountry('USA');

DELIMITER $$
CREATE PROCEDURE GetOrderCountByStatus (
    IN  orderStatus VARCHAR(25),
    OUT total INT
)
BEGIN
    SELECT COUNT(orderNumber)
    INTO total
    FROM orders
    WHERE status = orderStatus;
END$$
DELIMITER ;

CALL GetOrderCountByStatus('Shipped',@total);
SELECT @total;

CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;

DELIMITER $$
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END$$ 
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

	
SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS WHERE db = 'classicmodels';

SHOW PROCEDURE STATUS LIKE '%Order%' ;

SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = 'classicmodels';
        
# IF-THEN statement, IF-THEN-ELSE statement, and IF-THEN-ELSEIF- ELSE statement.
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;
 
    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;
 
    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END$$ 
DELIMITER ;

DROP PROCEDURE GetCustomerLevel;
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;
 
    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;
 
    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$
DELIMITER ;

DROP PROCEDURE GetCustomerLevel;
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;
 
    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;
 
    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END $$ 
DELIMITER ;

CALL GetCustomerLevel(141, @level);
SELECT @level;

CALL GetCustomerLevel(447, @level);
SELECT @level;

DELIMITER $$
CREATE PROCEDURE GetCustomerShipping(
    IN  pCustomerNUmber INT, 
    OUT pShipping       VARCHAR(50)
)
BEGIN
    DECLARE customerCountry VARCHAR(100);
 
SELECT 
    country
INTO customerCountry FROM
    customers
WHERE
    customerNumber = pCustomerNUmber;
 
    CASE customerCountry
        WHEN  'USA' THEN
           SET pShipping = '2-day Shipping';
        WHEN 'Canada' THEN
           SET pShipping = '3-day Shipping';
        ELSE
           SET pShipping = '5-day Shipping';
    END CASE;
END$$ 
DELIMITER ;

CALL GetCustomerShipping(112,@shipping);
SELECT @shipping;

# searched CASE
DELIMITER $$ 
CREATE PROCEDURE GetDeliveryStatus(
    IN pOrderNumber INT,
    OUT pDeliveryStatus VARCHAR(100)
)
BEGIN
    DECLARE waitingDay INT DEFAULT 0;
    SELECT 
        DATEDIFF(requiredDate, shippedDate)
    INTO waitingDay
    FROM orders
    WHERE orderNumber = pOrderNumber;
    
    CASE 
        WHEN waitingDay = 0 THEN 
            SET pDeliveryStatus = 'On Time';
        WHEN waitingDay >= 1 AND waitingDay < 5 THEN
            SET pDeliveryStatus = 'Late';
        WHEN waitingDay >= 5 THEN
            SET pDeliveryStatus = 'Very Late';
        ELSE
            SET pDeliveryStatus = 'No Information';
    END CASE;    
END$$
DELIMITER ;

CALL GetDeliveryStatus(10100,@delivery);
SELECT @delivery;

DROP PROCEDURE IF EXISTS LoopDemo;
 
DELIMITER $$
CREATE PROCEDURE LoopDemo()
BEGIN
    DECLARE x  INT;
    DECLARE str  VARCHAR(255);
        
    SET x = 1;
    SET str =  '';
        
    loop_label:  LOOP
        IF  x > 10 THEN 
            LEAVE  loop_label;
        END  IF;
            
        SET  x = x + 1;
        IF  (x mod 2) THEN
            ITERATE  loop_label;
        ELSE
            SET  str = CONCAT(str,x,',');
        END  IF;
    END LOOP;
    SELECT str;
END$$
DELIMITER ;

CALL LoopDemo();

CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);

DELIMITER $$ 
CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE LoadCalendars(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;
 
    WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;
 
END$$
DELIMITER ;

CALL LoadCalendars('2019-01-01',31);

SELECT * FROM calendars;

DELIMITER $$
CREATE PROCEDURE RepeatDemo()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT '';
    
    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter >= 10
    END REPEAT;
    
    -- display result
    SELECT result;
END$$
DELIMITER ;

CALL RepeatDemo();

# LEAVE can be used in both loops and stored procedures
DELIMITER $$
CREATE PROCEDURE CheckCredit(
    inCustomerNumber int
)
sp: BEGIN    
    DECLARE customerCount INT;
 
    -- check if the customer exists
    SELECT 
        COUNT(*)
    INTO customerCount 
    FROM
        customers
    WHERE
        customerNumber = inCustomerNumber;
    
    -- if the customer does not exist, terminate
    -- the stored procedure
    IF customerCount = 0 THEN
        LEAVE sp;
    END IF;
    
    -- other logic
    -- ...
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE LeaveDemo(OUT result VARCHAR(100))
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE times INT;
    -- generate a random integer between 4 and 10
    SET times  = FLOOR(RAND()*(10-4+1)+4);
    SET result = '';
    disp: LOOP
        -- concatenate counters into the result
        SET result = concat(result,counter,',');
        
        -- exit the loop if counter equals times
        IF counter = times THEN
            LEAVE disp; 
        END IF;
        SET counter = counter + 1;
    END LOOP;
END$$
DELIMITER ;

CALL LeaveDemo(@result);
SELECT @result;

# ERROR Handling
#DECLARE action HANDLER FOR condition_value statement;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
END;

DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;

# 1062, the sql state for duplicate key error
DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';

CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

DELIMITER $$
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
     SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$
DELIMITER ;

CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);

CALL InsertSupplierProduct(1,3);

# 1st/error code, 2nd/sqlstate, 3rd/sqlexception
DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER $$
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062 SELECT 'Duplicate keys error encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$
DELIMITER ;

CALL InsertSupplierProduct(1,3);

# named error code
DROP PROCEDURE IF EXISTS TestProc;
DELIMITER $$
CREATE PROCEDURE TestProc()
BEGIN
    DECLARE TableNotFound CONDITION for 1146 ; 
 
    DECLARE EXIT HANDLER FOR TableNotFound 
    SELECT 'Please create table abc first' Message; 
    SELECT * FROM abc;
END$$
DELIMITER ;

# SIGNAL and RESIGNAL to raise error conditions
#SIGNAL SQLSTATE | condition_name;
#SET condition_information_item_name_1 = value_1,
#    condition_information_item_name_1 = value_2, etc;
# The  condition_information_item_name can be MESSAGE_TEXT, MYSQL_ERRORNO, CURSOR_NAME , etc.
DELIMITER $$
CREATE PROCEDURE AddOrderItem(
             in orderNo int,
             in productCode varchar(45),
             in qty int, 
             in price double, 
             in lineNo int )
BEGIN
    DECLARE C INT;
 
    SELECT COUNT(orderNumber) INTO C
    FROM orders 
    WHERE orderNumber = orderNo;
 
    -- check if orderNumber exists
    IF(C != 1) THEN 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Order No not found in orders table';
            # 45000 is a generic SQLSTATE value for an unhandled user-defined exception
    END IF;
    -- more code below
    -- ...
END $$
DELIMITER ;

CALL AddOrderItem(10,'S10_1678',1,95.7,1);

DROP PROCEDURE IF EXISTS Divide;
DELIMITER $$
CREATE PROCEDURE Divide(IN numerator INT, IN denominator INT, OUT result double)
BEGIN
    DECLARE division_by_zero CONDITION FOR SQLSTATE '22012';
 
    DECLARE CONTINUE HANDLER FOR division_by_zero 
    RESIGNAL SET MESSAGE_TEXT = 'Division by zero / Denominator cannot be zero';
    -- 
    IF denominator = 0 THEN
        SIGNAL division_by_zero;
    ELSE
        SET result := numerator / denominator;
    END IF;
END $$
DELIMITER ;

CALL Divide(10,0,@result) ;

# MySQL Cursor
# A cursor allows you to iterate a set of rows returned by a query 
# and process each row individually.
# MySQL cursor is read-only, non-scrollable and asensitive.
# must also declare a NOT FOUND handler
# DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

# DECLARE cursor_name CURSOR FOR SELECT_statement;
# OPEN cursor_name;
# FETCH cursor_name INTO variables list;
# CLOSE cursor_name;

DELIMITER $$
CREATE PROCEDURE createEmailList (
    INOUT emailList varchar(4000)
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress varchar(100) DEFAULT "";
 
    -- declare cursor for employee email
    DEClARE curEmail 
        CURSOR FOR 
            SELECT email FROM employees;
 
    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
 
    OPEN curEmail;
 
    getEmail: LOOP
        FETCH curEmail INTO emailAddress;
        IF finished = 1 THEN 
            LEAVE getEmail;
        END IF;
        -- build email list
        SET emailList = CONCAT(emailAddress,";",emailList);
    END LOOP getEmail;
    CLOSE curEmail;

END$$
DELIMITER ;

SET @emailList = ""; 
CALL createEmailList(@emailList); 
SELECT @emailList;

# STORED FUNCTION
DELIMITER $$
CREATE FUNCTION CustomerLevel(
    credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);
 
    IF credit > 50000 THEN
        SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
            credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
    -- return the customer level
    RETURN (customerLevel);
END$$
DELIMITER ;

SHOW FUNCTION STATUS 
WHERE db = 'classicmodels';

SELECT 
    customerName, 
    CustomerLevel(creditLimit)
FROM
    customers
ORDER BY 
    customerName;
    

DELIMITER $$ 
CREATE PROCEDURE GetCustomerLevel(
    IN  customerNo INT,  
    OUT customerLevel VARCHAR(20)
)
BEGIN
 
    DECLARE credit DEC(10,2) DEFAULT 0;
    
    -- get credit limit of a customer
    SELECT 
        creditLimit 
    INTO credit
    FROM customers
    WHERE 
        customerNumber = customerNo;
    
    -- call the function 
    SET customerLevel = CustomerLevel(credit);
END$$
DELIMITER ;

CALL GetCustomerLevel(-131, @customerLevel);
SELECT @customerLevel;


DELIMITER $$
 
CREATE FUNCTION OrderLeadTime (
    orderDate DATE,
    requiredDate DATE
) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN requiredDate - orderDate;
END$$
 
DELIMITER ;

DROP FUNCTION OrderLeadTime;
DROP FUNCTION IF EXISTS OrderLeadTime;
SHOW WARNINGS;

	
SHOW FUNCTION STATUS;	
SHOW FUNCTION STATUS WHERE db='classicmodels';
SHOW FUNCTION STATUS LIKE "%order%";

SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'FUNCTION'
        AND routine_schema = 'classicmodels';
        
# multiple return values
DROP PROCEDURE IF EXISTS get_order_by_cust;

DELIMITER $$ 
CREATE PROCEDURE get_order_by_cust(
    IN cust_no INT,
    OUT shipped INT,
    OUT canceled INT,
    OUT resolved INT,
    OUT disputed INT)
BEGIN
        -- shipped
        SELECT
            count(*) INTO shipped
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Shipped';
 
        -- canceled
        SELECT
            count(*) INTO canceled
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Canceled';
 
        -- resolved
        SELECT
            count(*) INTO resolved
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Resolved';
 
        -- disputed
        SELECT
            count(*) INTO disputed
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Disputed';
 
END $$
DELIMITER ;

CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;

# MySQL Stored Object Access Control
# MySQL uses DEFINER and SQL SECURITY characteristics to control these privileges.

#CREATE [DEFINER=user] PROCEDURE/FUNCTION spName(parameter_list)
#SQL SECURITY [DEFINER | INVOKER]
#...

CREATE DATABASE testdb;
USE testdb;

CREATE TABLE messages (
    id INT AUTO_INCREMENT,
    message VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

DELIMITER $$
CREATE DEFINER = root@localhost PROCEDURE InsertMessage( 
    msg VARCHAR(100)
)
SQL SECURITY DEFINER
BEGIN
    INSERT INTO messages(message)
    VALUES(msg);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=root@localhost 
PROCEDURE UpdateMessage( 
    msgId INT,
    msg VARCHAR(100)
)
SQL SECURITY INVOKER
BEGIN
    UPDATE messages
    SET message = msg
    WHERE id = msgId;
END$$ 
DELIMITER ;

CREATE USER dev@localhost 
IDENTIFIED BY 'Abcd1@34';

GRANT EXECUTE ON testdb.* 
TO dev@localhost;

# mysql -u dev@localhost -p
# mysql> show databases;
# mysql> use testdb;
# mysql> call InsertMessage('Hello World');

# mysql> call UpdateMessage(1,'Good Bye');
# This time the UpdateMessage() stored procedure executes
# with the privileges of the caller which is dev@localhost.
# Because dev@localhost does not have any privileges on the messages table,
# MySQL issues an error and rejects the update

# TRIGGER: BEFORE/AFTER INSERT/UPDATE/DELETE
# CREATE TRIGGER trigger_name
# {BEFORE | AFTER} {INSERT | UPDATE| DELETE }
# ON table_name FOR EACH ROW
# [BEGIN] 
# trigger_body;
# [END]

USE classicmodels;

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
INSERT INTO employees_audit
SET action = 'update',
    employeeNumber = OLD.employeeNumber, # OLD, NEW
    lastname = OLD.lastname,
    changedat = NOW();
    
SHOW TRIGGERS;

UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
    
SELECT * FROM employees_audit;

CREATE TABLE billings (
    billingNo INT AUTO_INCREMENT,
    customerNo INT,
    billingDate DATE,
    amount DEC(10 , 2 ),
    PRIMARY KEY (billingNo)
);

DELIMITER $$
CREATE TRIGGER before_billing_update
    BEFORE UPDATE 
    ON billings FOR EACH ROW
BEGIN
    IF new.amount > old.amount * 10 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'New amount cannot be 10 times greater than the current amount.';
    END IF;
END$$    
DELIMITER ;

SHOW TRIGGERS;

DROP TRIGGER before_billing_update;

DROP TABLE IF EXISTS WorkCenters;
 
CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

DROP TABLE IF EXISTS WorkCenterStats;
 
CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);

DELIMITER $$
CREATE TRIGGER before_workcenters_insert
BEFORE INSERT
ON WorkCenters FOR EACH ROW
BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity; # we can use NEW here, but not old for *insert*
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 
 
END $$ 
DELIMITER ;

INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

SELECT * FROM WorkCenterStats;

INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

SELECT * FROM WorkCenterStats;

DROP TABLE IF EXISTS members;
 
CREATE TABLE members (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS reminders;
 
CREATE TABLE reminders (
    id INT AUTO_INCREMENT,
    memberId INT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY (id , memberId)
);

DELIMITER $$
CREATE TRIGGER after_members_insert
AFTER INSERT
ON members FOR EACH ROW
BEGIN
    IF NEW.birthDate IS NULL THEN
        INSERT INTO reminders(memberId, message)
        VALUES(new.id,CONCAT('Hi ', NEW.name, ', please update your date of birth.'));
    END IF;
END$$
DELIMITER ;

INSERT INTO members(name, email, birthDate)
VALUES
    ('John Doe', 'john.doe@example.com', NULL),
    ('Jane Doe', 'jane.doe@example.com','2000-01-01');
    
SELECT * FROM reminders;

# BEFORE UPDATE trigger to validate data before it is updated to a table.
DROP TABLE IF EXISTS sales;
 
CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1),
    ('1969 Corvair Monza', 150,2020,1),
    ('1970 Plymouth Hemi Cuda', 200,2020,1);
    
SELECT * FROM sales;

DELIMITER $$
CREATE TRIGGER before_sales_update
BEFORE UPDATE
ON sales FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new quantity ',
                        NEW.quantity,
                        ' cannot be 3 times greater than the current quantity ',
                        OLD.quantity);
                        
    IF new.quantity > old.quantity * 3 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$
DELIMITER ;

UPDATE sales 
SET quantity = 150
WHERE id = 1;

UPDATE sales 
SET quantity = 1500
WHERE id = 1;

SHOW WARNINGS;
SHOW ERRORS;

# AFTER UPDATE trigger to log the changes made to a table.
DROP TABLE IF EXISTS Sales;
 
CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);

DROP TABLE IF EXISTS SalesChanges;
 
CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
 
CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$
 
DELIMITER ;

UPDATE sales 
SET quantity = 350
WHERE id = 1;

SELECT * FROM SalesChanges;

UPDATE sales 
SET quantity = CAST(quantity * 1.1 AS UNSIGNED);

SELECT * FROM SalesChanges;

# BEFORE DELETE trigger to add deleted rows into an archive table.
DROP TABLE IF EXISTS Salaries;
 
CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);

INSERT INTO Salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);
    
DROP TABLE IF EXISTS SalaryArchives;    
 
CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

DELIMITER $$
CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON Salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    
DELIMITER ;

DELETE FROM Salaries 
WHERE employeeNumber = 1002;

SELECT * FROM SalaryArchives;

# AFTER DELETE trigger to maintain a summary table of another table.
DROP TABLE IF EXISTS Salaries;
 
CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);

INSERT INTO Salaries(employeeNumber,salary)
VALUES
    (1002,5000),
    (1056,7000),
    (1076,8000);
    
DROP TABLE IF EXISTS SalaryBudgets;
 
CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);

INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries;

SELECT * FROM SalaryBudgets;

CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
UPDATE SalaryBudgets 
SET total = total - old.salary;

DELETE FROM Salaries
WHERE employeeNumber = 1002;

SELECT * FROM SalaryBudgets;    

DELETE FROM Salaries;

SELECT * FROM SalaryBudgets;    

# Multiple Triggers
# DELIMITER $$
# CREATE TRIGGER trigger_name
# {BEFORE|AFTER}{INSERT|UPDATE|DELETE} 
# ON table_name FOR EACH ROW 
# {FOLLOWS|PRECEDES} existing_trigger_name
# BEGIN
#     -- statements
# END$$
# 
# DELIMITER ;

CREATE TABLE PriceLogs (
    id INT AUTO_INCREMENT,
    productCode VARCHAR(15) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    updated_at TIMESTAMP NOT NULL 
            DEFAULT CURRENT_TIMESTAMP 
            ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (productCode)
        REFERENCES products (productCode)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

DROP TRIGGER before_products_update;

DELIMITER $$
CREATE TRIGGER before_products_update 
   BEFORE UPDATE ON products 
   FOR EACH ROW 
BEGIN
     IF OLD.msrp <> NEW.msrp THEN
         INSERT INTO PriceLogs(productCode,price)
         VALUES(old.productCode,old.msrp);
     END IF;
END$$
DELIMITER ;

SELECT 
    productCode, 
    msrp 
FROM 
    products
WHERE 
    productCode = 'S12_1099';

UPDATE products
SET msrp = 200
WHERE productCode = 'S12_1099';

SELECT * FROM PriceLogs;

CREATE TABLE UserChangeLogs (
    id INT AUTO_INCREMENT,
    productCode VARCHAR(15) DEFAULT NULL,
    updatedAt TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,
    updatedBy VARCHAR(30) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (productCode)
        REFERENCES products (productCode)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

DELIMITER $$
CREATE TRIGGER before_products_update_log_user
   BEFORE UPDATE ON products 
   FOR EACH ROW 
   FOLLOWS before_products_update
BEGIN
    IF OLD.msrp <> NEW.msrp THEN
    INSERT INTO 
            UserChangeLogs(productCode,updatedBy)
        VALUES
            (OLD.productCode,USER());
    END IF;
END$$
DELIMITER ;

UPDATE 
    products
SET 
    msrp = 220
WHERE 
    productCode = 'S12_1099';
    
SELECT * FROM PriceLogs;
SELECT * FROM UserChangeLogs;

SHOW TRIGGERS 
FROM classicmodels
WHERE `table` = 'products';

SELECT 
    trigger_name, 
    action_order
FROM
    information_schema.triggers
WHERE
    trigger_schema = 'classicmodels'
ORDER BY 
    event_object_table , 
    action_timing , 
    event_manipulation;
    
# Call a Stored Procedure From a Trigger
# trigger cannot call a stored procedure that has OUT or INOUT parameters or a stored procedure that uses dynamic SQL.

DROP TABLE IF EXISTS accounts;
 
CREATE TABLE accounts (
    accountId INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL ,
    PRIMARY KEY (accountId),
    CHECK(amount >= 0) 
);

INSERT INTO accounts(name, amount)
VALUES
    ('John Doe', 1000),
    ('Jane Bush', 500);
    
DELIMITER $$
 
CREATE PROCEDURE Withdraw(
    fromAccountId INT, 
    withdrawAmount DEC(10,2)
)
BEGIN
    IF withdrawAmount <= 0 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'The withdrawal amount must be greater than zero';
    END IF;
    
    UPDATE accounts 
    SET amount = amount - withdrawAmount
    WHERE accountId = fromAccountId;
END$$
 
DELIMITER ;

DELIMITER $$
 
CREATE PROCEDURE CheckWithdrawal(
    fromAccountId INT,
    withdrawAmount DEC(10,2)
)
BEGIN
    DECLARE balance DEC(10,2);
    DECLARE withdrawableAmount DEC(10,2);
    DECLARE message VARCHAR(255);
 
    -- get current balance of the account
    SELECT amount 
    INTO balance
    FROM accounts
    WHERE accountId = fromAccountId;
    
    -- Set minimum balance
    SET withdrawableAmount = balance - 25;
 
    IF withdrawAmount > withdrawableAmount THEN
        SET message = CONCAT('Insufficient amount, the maximum withdrawable is ', withdrawableAmount);
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = message;
    END IF;
END$$
 
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_accounts_update
BEFORE UPDATE
ON accounts FOR EACH ROW
BEGIN
    CALL CheckWithdrawal (
        OLD.accountId, 
        OLD.amount - NEW.amount
    );
END$$
DELIMITER ;   

CALL withdraw(1, 400);
SELECT * FROM accounts
WHERE accountId = 1;

CALL withdraw(1, 600);
SHOW ERRORS;


# VIEWS
CREATE OR REPLACE VIEW customerPayments
AS 
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber);
    
SELECT * FROM customerPayments;

CREATE VIEW salePerOrder AS
    SELECT 
        orderNumber, 
        SUM(quantityOrdered * priceEach) total
    FROM
        orderDetails
    GROUP by orderNumber
    ORDER BY total DESC;

SELECT * FROM salePerOrder;

SHOW TABLES;
SHOW FULL TABLES like "sale%";

CREATE VIEW bigSalesOrder AS
    SELECT 
        orderNumber, 
        ROUND(total,2) as total
    FROM
        salePerOrder
    WHERE
        total > 60000;
        
SELECT * FROM bigSalesOrder;

CREATE OR REPLACE VIEW customerOrders AS
SELECT 
    orderNumber,
    customerName,
    SUM(quantityOrdered * priceEach) total
FROM
    orderDetails
INNER JOIN orders o USING (orderNumber)
INNER JOIN customers USING (customerNumber)
GROUP BY orderNumber;

SELECT * FROM customerOrders;

CREATE VIEW aboveAvgProducts AS
    SELECT 
        productCode, 
        productName, 
        buyPrice
    FROM
        products
    WHERE
        buyPrice > (
            SELECT 
                AVG(buyPrice)
            FROM
                products)
    ORDER BY buyPrice DESC;
    
SELECT * FROM aboveAvgProducts;

CREATE VIEW customerOrderStats (
   customerName , 
   orderCount
) 
AS
    SELECT 
        customerName, 
        COUNT(orderNumber)
    FROM
        customers
            INNER JOIN
        orders USING (customerNumber)
    GROUP BY customerName;
    
SELECT 
    customerName,
    orderCount
FROM
    customerOrderStats
ORDER BY 
    orderCount, 
    customerName;

# MySQL view processing algorithms including MERGE, TEMPTABLE, and UNDEFINED.   
# CREATE [OR REPLACE][ALGORITHM = {MERGE | TEMPTABLE | UNDEFINED}] VIEW 
#    view_name[(column_list)]
# AS 
#    select-statement;

# MERGE: view resolution
CREATE ALGORITHM=MERGE VIEW contactPersons(
    customerName, 
    firstName, 
    lastName, 
    phone
) AS
SELECT 
    customerName, 
    contactFirstName, 
    contactLastName, 
    phone
FROM customers;

SELECT * FROM contactPersons
WHERE customerName LIKE '%Co%';

# becomes:
SELECT 
    customerName, 
    contactFirstName, 
    contactLastName, 
    phone
FROM
    customers
WHERE
    customerName LIKE '%Co%';
    
# TEMPTABLE: create a temporary table, less efficient
# UNDEFINED: the default one

# Updatable Views, not for TEMPTABLE views
CREATE VIEW officeInfo
 AS 
   SELECT officeCode, phone, city
   FROM offices;
   
UPDATE officeInfo 
SET 
    phone = '+33 14 723 5555'
WHERE
    officeCode = 4;
    
SELECT 
    table_name, 
    is_updatable
FROM
    information_schema.views
WHERE
    table_schema = 'classicmodels';

-- create a new table named items
DROP TABLE items;
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(11 , 2 ) NOT NULL
);
 
-- insert data into the items table
INSERT INTO items(name,price) 
VALUES('Laptop',700.56),('Desktop',699.99),('iPad',700.50) ;
 
-- create a view based on items table
CREATE VIEW LuxuryItems AS
    SELECT 
        *
    FROM
        items
    WHERE
        price > 700;
        
-- query data from the LuxuryItems view
SELECT 
    *
FROM
    LuxuryItems;

DELETE FROM LuxuryItems 
WHERE
    id = 3;
    
SELECT 
    *
FROM
    LuxuryItems;
    
SELECT 
    *
FROM
    items; # row removed from the base table

# WITH CHECK OPTION
CREATE OR REPLACE VIEW vps AS
    SELECT 
        employeeNumber,
        lastname,
        firstname,
        jobtitle,
        extension,
        email,
        officeCode,
        reportsTo
    FROM
        employees
    WHERE
        jobTitle LIKE '%VP%';
        
SELECT * FROM vps;

INSERT INTO vps(
    employeeNumber,
    firstName,
    lastName,
    jobTitle,
    extension,
    email,
    officeCode,
    reportsTo
) 
VALUES(
    1703,
    'Lily',
    'Bush',
    'IT Manager',
    'x9111',
    'lilybush@classicmodelcars.com',
    1,
    1002
);

SELECT 
   * 
FROM 
   employees
ORDER BY 
   employeeNumber DESC;
# the view is only about VPs, but we update the table for non-vps

CREATE OR REPLACE VIEW vps AS
    SELECT 
        employeeNumber,
        lastName,
        firstName,
        jobTitle,
        extension,
        email,
        officeCode,
        reportsTo
    FROM
        employees
    WHERE
        jobTitle LIKE '%VP%' 
WITH CHECK OPTION;

INSERT INTO vps(employeeNumber,firstname,lastname,jobtitle,extension,email,officeCode,reportsTo)
VALUES(1704,'John','Smith','IT Staff','x9112','johnsmith@classicmodelcars.com',1,1703);

SHOW ERRORS;

INSERT INTO vps(employeeNumber,firstname,lastname,jobtitle,extension,email,officeCode,reportsTo)
VALUES(1704,'John','Smith','SVP Marketing','x9112','johnsmith@classicmodelcars.com',1,1076);

SELECT * FROM vps;

# LOCAL & CASCADED in WITH CHECK OPTION Clause
DROP TABLE t1;
CREATE TABLE t1 (
    c INT
);

CREATE OR REPLACE VIEW v1 
AS
    SELECT 
        c
    FROM
        t1
    WHERE
        c > 10;

INSERT INTO v1(c) 
VALUES (5);

SELECT * FROM v1;
SELECT * FROM t1;

CREATE OR REPLACE VIEW v2 
AS
    SELECT c FROM v1 
WITH CASCADED CHECK OPTION;

INSERT INTO v2(c) 
VALUES (5);

SHOW ERRORS;

CREATE OR REPLACE VIEW v3 
AS
    SELECT c
    FROM v2
    WHERE c < 20;
    
INSERT INTO v3(c) VALUES (8);

SHOW ERRORS;

INSERT INTO v3(c) VALUES (30);
SELECT * FROM v3;

ALTER VIEW v2 AS
    SELECT 
        c
    FROM
        v1 
WITH LOCAL CHECK OPTION;

INSERT INTO v2(c) 
VALUES (5);

INSERT INTO v3(c) VALUES (8); # succeed since checking only locally

DROP VIEW v3;
DROP VIEW v2, v1;
DROP VIEW IF EXISTS v2, v1;

SHOW FULL TABLES 
WHERE table_type = 'VIEW';

SHOW FULL TABLES IN sys 
WHERE table_type='VIEW';

SHOW FULL TABLES 
FROM sys
LIKE 'waits%';

# will be very slow
SELECT * 
FROM information_schema.tables;

SELECT 
    table_name view_name
FROM 
    information_schema.tables 
WHERE 
    table_type   = 'VIEW' AND 
    table_schema = 'classicmodels' AND
    table_name   LIKE 'customer%';

SHOW TABLES LIKE "%ine%";

CREATE VIEW productLineSales AS
SELECT 
    productLine, 
    SUM(quantityOrdered) totalQtyOrdered
FROM
    productlines
        INNER JOIN
    products USING (productLine)
        INNER JOIN
    orderdetails USING (productCode)
GROUP BY productLine;

RENAME TABLE productLineSales 
TO productLineQtySales;

# MySQL Full-Text Search, FULLTEXT for mySQL 5.6+
# Creating FULLTEXT Indexes, 
# indexing and re-indexing data automatically for full-text search enabled columns

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  PRIMARY KEY (id),
  FULLTEXT KEY (body ) # KEY is not necessary
);

ALTER TABLE products  
ADD FULLTEXT(productDescription,productLine);

CREATE FULLTEXT INDEX address
ON offices(addressLine1,addressLine2);

ALTER TABLE offices
DROP INDEX address;

# MySQL natural language full-text search by using:
# MATCH() specifies the column where you want to search 
# AGAINST() determines the search expression to be used

ALTER TABLE products 
ADD FULLTEXT(productline);

DESCRIBE products;

SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productLine) 
    AGAINST('Classic');
    
SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productline) 
    AGAINST('Classic,Vintage')
ORDER BY productName;

SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productline) 
    AGAINST('Classic,Vintage' IN NATURAL LANGUAGE MODE);

ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productName) 
    AGAINST('1932,Ford');
    
SELECT productName, productline
FROM products
WHERE MATCH(productName) 
      AGAINST('Truck' IN BOOLEAN MODE );
      
SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('Truck -Pickup' IN BOOLEAN MODE );

# +, -, > (include, and inclrease ranking value), <, (), ~, *, ""
# ‘mysql tutorial’ # contain at least one of the two words: mysql or tutorial
# ‘+mysql +tutorial’ # both words
# ‘+mysql tutorial’ # contain mysql, higher rank for rows containing tutorial
# ‘+mysql -tutorial’ # not tutorial
# ‘+mysql ~tutorial’ # if tutorial, rank lower
# ‘+mysql +(>tutorial <training)’ #  contain the words “mysql” and “tutorial”, 
								  # or “mysql” and “training” in whatever order, 
	#  but put the rows that contain “mysql tutorial” higher than “mysql training”.
# 'my*'

# MySQL Query Expansion

ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT 
    productName
FROM
    products
WHERE
    MATCH (productName) 
    AGAINST ('1992' );
    
SELECT 
    productName
FROM
    products
WHERE
    MATCH (productName) 
    AGAINST ('1992' WITH QUERY EXPANSION);
    
# MySQL ngram full-text parser for CJK

# MySQL Tips
# use adjacency list model for managing hierarchical data.
# basically, it defines a tree
CREATE TABLE category (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  parent_id int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_id) REFERENCES category (id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO category(title,parent_id) 
VALUES('Electronics',NULL);

INSERT INTO category(title,parent_id) 
VALUES('Laptops & PC',1);
 
INSERT INTO category(title,parent_id) 
VALUES('Laptops',2);
INSERT INTO category(title,parent_id) 
VALUES('PC',2);
 
INSERT INTO category(title,parent_id) 
VALUES('Cameras & photo',1);
INSERT INTO category(title,parent_id) 
VALUES('Camera',5);
 
INSERT INTO category(title,parent_id) 
VALUES('Phones & Accessories',1);
INSERT INTO category(title,parent_id) 
VALUES('Smartphones',7);
 
INSERT INTO category(title,parent_id) 
VALUES('Android',8);
INSERT INTO category(title,parent_id) 
VALUES('iOS',8);
INSERT INTO category(title,parent_id) 
VALUES('Other Smartphones',8);
 
INSERT INTO category(title,parent_id) 
VALUES('Batteries',7);
INSERT INTO category(title,parent_id) 
VALUES('Headsets',7);
INSERT INTO category(title,parent_id) 
VALUES('Screen Protectors',7);

SELECT
    id, title
FROM
    category
WHERE
    parent_id IS NULL; # root

SELECT
    c1.id, c1.title
FROM
    category c1
        LEFT JOIN
    category c2 ON c2.parent_id = c1.id
WHERE
    c2.id IS NULL; # # leaf via a self join
    
SELECT
    id, title
FROM
    category
WHERE
    parent_id = 1;
    
#  querying the whole tree via recursive common table expression (CTE) 
WITH RECURSIVE category_path (id, title, path) AS
(
  SELECT id, title, title as path
    FROM category
    WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.title, CONCAT(cp.path, ' > ', c.title)
    FROM category_path AS cp JOIN category AS c
      ON cp.id = c.parent_id
)
SELECT * FROM category_path
ORDER BY path;

# query a subtree
WITH RECURSIVE category_path (id, title, path) AS
(
  SELECT id, title, title as path
    FROM category
    WHERE parent_id = 7
  UNION ALL
  SELECT c.id, c.title, CONCAT(cp.path, ' > ', c.title)
    FROM category_path AS cp JOIN category AS c
      ON cp.id = c.parent_id
)
SELECT * FROM category_path
ORDER BY path;

# query a single path
WITH RECURSIVE category_path (id, title, parent_id) AS
(
  SELECT id, title, parent_id
    FROM category
    WHERE id = 10 -- child node
  UNION ALL
  SELECT c.id, c.title, c.parent_id
    FROM category_path AS cp JOIN category AS c
      ON cp.parent_id = c.id
)
SELECT * FROM category_path;

# Calculating level of each node
WITH RECURSIVE category_path (id, title, lvl) AS
(
  SELECT id, title, 0 lvl
    FROM category
    WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.title,cp.lvl + 1
    FROM category_path AS cp JOIN category AS c
      ON cp.id = c.parent_id
)
SELECT * FROM category_path
ORDER BY lvl;

# Deleting a node and its descendants
DELETE FROM category 
WHERE
    id = 2;
    
# Deleting a node and promote its descendants
UPDATE category 
SET 
    parent_id = 7 -- Phones & Accessories
WHERE
    parent_id = 5; -- Smartphone
    
DELETE FROM category 
WHERE
    id = 8;
    
# put together
BEGIN;
UPDATE category 
SET 
    parent_id = 7 
WHERE 
    parent_id = 5;
 
DELETE FROM category 
WHERE 
    id = 8; 
COMMIT;

# Moving a subtree
UPDATE category 
SET 
    parent_id = 7
WHERE
    id = 5;
    

# Row Count
SELECT 
    COUNT(*)
FROM
    customers;
    
SELECT 
    'customers' tablename, 
     COUNT(*) nb_rows
FROM
    customers 
UNION 
SELECT 
    'orders' as tablename, 
     COUNT(*) as nb_rows
FROM
    orders;
    

SELECT 
    CONCAT(GROUP_CONCAT(CONCAT('SELECT \'',
                        table_name,
                        '\' table_name,COUNT(*) rows FROM ',
                        table_name)
                SEPARATOR ' UNION '),
            ' ORDER BY table_name')
INTO @sql 
FROM
    (SELECT 
        table_name
    FROM
        information_schema.tables
    WHERE
        table_schema = 'classicmodels'
            AND table_type = 'BASE TABLE') table_list;
            
WITH table_list AS (
SELECT
    table_name
  FROM information_schema.tables 
  WHERE table_schema = 'classicmodels' AND
        table_type = 'BASE TABLE'
) 
SELECT CONCAT(
            GROUP_CONCAT(CONCAT("SELECT '",table_name,"' table_name,COUNT(*) rows FROM ",table_name) SEPARATOR " UNION "),
            ' ORDER BY table_name'
        )
INTO @sql
FROM table_list;

SELECT @sql;

PREPARE s FROM  @sql;
EXECUTE s;
DEALLOCATE PREPARE s;

# Getting MySQL row count of all tables in a database with one query
SELECT 
    table_name, 
    table_rows
FROM
    information_schema.tables
WHERE
    table_schema = 'classicmodels'
ORDER BY table_name;


#Compare Two Tables
USE classicmodels;
SELECT database();

DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
    id int auto_increment primary key,
    title varchar(255)    
);
 
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(
    id int auto_increment primary key,
    title varchar(255),
    note varchar(255)
);

INSERT INTO t1(title)
VALUES('row 1'),('row 2'),('row 3');

INSERT INTO t2(title,note)
SELECT title, 'data migration'
FROM t1;

SELECT * FROM t1;
SELECT * FROM t2;

SELECT id,title
FROM (
SELECT id, title FROM t1
UNION ALL
SELECT id,title FROM t2
) tbl
GROUP BY id, title
HAVING count(*) = 1
ORDER BY id;

INSERT INTO t2(title,note)
VALUES('new row 4','new');

SELECT id,title
FROM (
SELECT id, title FROM t1
UNION ALL
SELECT id,title FROM t2
) tbl
GROUP BY id, title
HAVING count(*) = 1
ORDER BY id;

# Find Duplicate Values
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO contacts (first_name,last_name,email) 
VALUES ('Carine ','Schmitt','carine.schmitt@verizon.net'),
       ('Jean','King','jean.king@me.com'),
       ('Peter','Ferguson','peter.ferguson@google.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@att.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com'),
       ('Julie','Murphy','julie.murphy@yahoo.com'),
       ('Kwai','Lee','kwai.lee@google.com'),
       ('Jean','King','jean.king@me.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com');
SELECT * FROM contacts ORDER BY email;

SELECT email, COUNT(email) cnt
FROM contacts
GROUP BY email
HAVING cnt > 1;

SELECT 
    first_name, COUNT(first_name),
    last_name,  COUNT(last_name),
    email,      COUNT(email)
FROM
    contacts
GROUP BY 
    first_name , 
    last_name , 
    email
HAVING  COUNT(first_name) > 1
    AND COUNT(last_name) > 1
    AND COUNT(email) > 1;  # do we need the AND clauses? since we are using group by (cols), we do not need this.
    
# Delete Duplicate Rows
SELECT email, COUNT(email)
FROM contacts
GROUP BY email
HAVING COUNT(email) > 1;

# using DELETE JOIN (and SELF JOIN)
DELETE c1 FROM contacts c1
INNER JOIN contacts c2 
WHERE
    c1.id > c2.id AND 
    c1.email = c2.email;
    
SELECT email, COUNT(email)
FROM contacts
GROUP BY email
HAVING COUNT(email) > 1;

# Delete duplicate rows using an intermediate table
-- step 1
CREATE TABLE contacts_temp LIKE contacts;
 
-- step 2
INSERT INTO contacts_temp
SELECT * 
FROM contacts 
GROUP BY email;
  
-- step 3
DROP TABLE contacts;
 
ALTER TABLE contacts_temp 
RENAME TO contacts;

# using the ROW_NUMBER() function, mySQL 8.02+
SELECT 
    id, 
    email, 
    ROW_NUMBER() OVER ( 
        PARTITION BY email 
        ORDER BY email
    ) AS row_num 
FROM contacts;

SELECT 
    id 
FROM (
    SELECT 
        id,
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY email) AS row_num
    FROM 
        contacts
) t
WHERE 
    row_num > 1;

DELETE FROM contacts 
WHERE 
    id IN (
		SELECT 
			id 
		FROM (
			SELECT 
				id,
				ROW_NUMBER() OVER (
					PARTITION BY email
					ORDER BY email) AS row_num
			FROM 
            contacts
			) t
		WHERE row_num > 1
	);

# UUID vs. INT for Primary Key, Universally Unique IDentifier
SELECT UUID();

CREATE TABLE customer (
    id BINARY(16) PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO customer (id, name)
VALUES(UUID_TO_BIN(UUID()),'John Doe'),
      (UUID_TO_BIN(UUID()),'Will Smith'),
      (UUID_TO_BIN(UUID()),'Mary Jane');
      
SELECT * FROM customer;
SELECT BIN_TO_UUID(id) id, name FROM customer;

# copy table to a new table
CREATE TABLE IF NOT EXISTS offices_bk 
SELECT * FROM offices;
    
SELECT * FROM offices_bk;

CREATE TABLE IF NOT EXISTS offices_usa 
SELECT * FROM offices
WHERE country = 'USA';

CREATE TABLE offices_dup LIKE offices;

INSERT offices_dup
SELECT * FROM offices;

CREATE DATABASE IF NOT EXISTS testdb;
CREATE TABLE testdb.offices LIKE classicmodels.offices;
INSERT testdb.offices
SELECT * FROM classicmodels.offices;

# Copy a MySQL Database
CREATE DATABASE classicmodels_backup;
# mysqldump -u root -p classicmodels > PATH/classicmodels.sql
# mysql -u root -p classicmodels_backup < PATH/classicmodels.sql

# mysqldump -u root -p --databases classicmodels > PATH/db.sql
# copy db.sql to another server
# mysql -u root -p classicmodels < new_path/db.sql

# MySQL Variables, @variable_name
SET @counter := 100;
SET @counter_ = 100;
SELECT @counter, @counter_;

SELECT 
    @msrp:=MAX(msrp)
FROM
    products;

SELECT 
    productCode, productName, productLine, msrp
FROM
    products
WHERE
    msrp = @msrp;
    
SELECT 
    @buyPrice:=buyprice
FROM
    products
WHERE
    buyprice > 95
ORDER BY buyprice;

SELECT @buyprice; # only save the last row

# SELECT INTO Variable
SELECT 
    city, customerName
INTO
    @city, @name
FROM 
    customers
WHERE 
    customerNumber = 103;

SELECT @city, @name;

SELECT 
    creditLimit
INTO
    @creditLimit
FROM 
    customers
WHERE 
    customerNumber > 103
LIMIT 1; # can only return one line

# Compare Successive Rows Within The Same Table
CREATE TABLE inventory(
  id INT AUTO_INCREMENT PRIMARY KEY,
  counted_date date NOT NULL,
  item_no VARCHAR(20) NOT NULL,
  qty int(11) NOT NULL
);

INSERT INTO inventory(counted_date,item_no,qty)
VALUES ('2014-10-01','A',20),
       ('2014-10-01','A',30),
       ('2014-10-01','A',45),
       ('2014-10-01','A',80),
       ('2014-10-01','A',100);
       
SELECT * FROM inventory;

SELECT 
    g1.item_no,
    g1.counted_date from_date,
    g2.counted_date to_date,
    (g2.qty - g1.qty) AS receipt_qty
FROM
    inventory g1
        INNER JOIN
    inventory g2 ON g2.id = g1.id + 1
WHERE
    g1.item_no = 'A';
    
# Change MySQL Storage Engine
SELECT 
    engine
FROM
    information_schema.tables
WHERE
    table_schema = 'classicmodels'
        AND table_name = 'offices';
        
SHOW TABLE STATUS LIKE 'offices';

SHOW CREATE TABLE offices;

SHOW ENGINES;

ALTER TABLE offices ENGINE = 'MYISAM';

# REGEXP
SELECT 
    productname
FROM
    products
WHERE
    productname REGEXP '^(A|B|C)'
ORDER BY productname;

# ROW_NUMBER
SET @row_number = 0; 
SELECT 
    (@row_number:=@row_number + 1) AS num, 
    firstName, 
    lastName
FROM
    employees
ORDER BY firstName, lastName    
LIMIT 5;

SELECT 
    (@row_number:=@row_number + 1) AS num, 
    firstName, 
    lastName
FROM
    employees,
    (SELECT @row_number:=0) AS t
ORDER BY 
    firstName, 
    lastName    
LIMIT 5;

SELECT
    customerNumber, 
    paymentDate, 
    amount
FROM
    payments
ORDER BY 
   customerNumber;
   
set @row_number := 0;
 
SELECT 
    @row_number:=CASE
        WHEN @customer_no = customerNumber 
            THEN @row_number + 1
        ELSE 1
    END AS num,
    @customer_no:=customerNumber customerNumber,
    paymentDate,
    amount
FROM
    payments
ORDER BY customerNumber;

SELECT 
    @row_number:=CASE
        WHEN @customer_no = customerNumber 
          THEN 
              @row_number + 1
          ELSE 
               1
        END AS num,
    @customer_no:=customerNumber CustomerNumber,
    paymentDate,
    amount
FROM
    payments,
    (SELECT @customer_no:=0,@row_number:=0) as t
ORDER BY 
    customerNumber;

# Select Random Records
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY RAND()
LIMIT 5;

#SELECT ROUND(RAND() * ( SELECT MAX(id) FROM  table_name)) AS id;
SELECT 
    t.customerNumber, t.customerName
FROM
    customers AS t
        JOIN
    (SELECT 
        ROUND(
			RAND() * (SELECT MAX(customerNumber) FROM customers)
            ) AS customerNumber
    ) AS x
WHERE
    t.customerNumber >= x.customerNumber
LIMIT 1;

# The nth Highest Record
SELECT 
    productCode, productName, buyPrice
FROM
    products
ORDER BY buyPrice DESC
LIMIT 2-1 , 1;

SELECT 
    productCode, productName, buyPrice
FROM
    products a
WHERE
    2-1 = (SELECT 
            COUNT(productCode)
        FROM
            products b
        WHERE
            b.buyPrice > a.buyPrice);
            
# Reset Auto Increment Values
CREATE TABLE tmp (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tmp(name)
VALUES('test 1'),
      ('test 2'),
      ('test 3');
      
SELECT * FROM tmp;

SELECT last_insert_id();  # 1

DELETE FROM tmp 
WHERE
    ID = 3;
    
INSERT INTO tmp(name)
VALUES('test 3_1');

SELECT * FROM tmp;

DELETE FROM tmp 
WHERE
    ID = 4;
    
ALTER TABLE tmp AUTO_INCREMENT = 3;

INSERT INTO tmp(name)
VALUES('test 3_2');

SELECT * FROM tmp;

TRUNCATE TABLE tmp;
SELECT * FROM tmp;
INSERT INTO tmp(name)
VALUES('test 1'),
      ('test 2'),
      ('test 3');
SELECT * FROM tmp;

# INTERVAL expr unit
SELECT NOW() + INTERVAL 1 DAY;

# MySQL NULL:
DROP TABLE IF EXISTS leads;
 
CREATE TABLE leads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    source VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(25)
);

INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('John','Doe','Web Search','john.doe@acme.com',NULL);

INSERT INTO leads(first_name,last_name,source,phone) # ignore email
VALUES
    ('Lily','Bush','Cold Calling','(408)-555-1234'),
    ('David','William','Web Search','(408)-888-6789');
    
# set NULL
UPDATE leads 
SET phone = NULL
WHERE id = 3;

SELECT *
FROM leads
ORDER BY phone; # NULLs in the front

SELECT *
FROM leads
WHERE phone IS NULL;

SELECT *
FROM leads
WHERE phone IS NOT NULL;

# groupby NULLs
SET @sql_mode_ = @@sql_mode;
SELECT @sql_mode_;
SET @@sql_mode='';

SELECT id, first_name, last_name, email, phone
FROM leads
GROUP BY email;

# NULLs can be unique
CREATE UNIQUE INDEX idx_phone ON leads(phone);

# IFNULL, COALESCE, and NULLIF.
SELECT 
    id, 
    first_name, 
    last_name, 
    IFNULL(phone, 'N/A') phone
FROM
    leads;
    
# COALESCE accepts a list of arguments and returns the first non-NULL argument.
SELECT 
    id,
    first_name,
    last_name,
    COALESCE(phone, email, 'N/A') contact
FROM
    leads;
    
INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('Thierry','Henry','Web Search','thierry.henry@example.com','');
   
SELECT 
    id,
    first_name,
    last_name,
    COALESCE(NULLIF(phone, ''), email, 'N/A') contact
FROM
    leads;
    
# Map NULL Values To Other Meaningful Values
# IF(exp,exp_result1,exp_result2);

SELECT 
    customername, state, country
FROM
    customers
ORDER BY country;

SELECT 
    customername, 
    IF(state IS NULL, 'N/A', state) state, 
    country
FROM
    customers
ORDER BY country;

SELECT customername, 
       IFNULL(state,"N/A") state, 
       country
FROM customers
ORDER BY country;

/*
c-style
multipline 
comments
exam-
-ple
*/

# /*! MySQL-specific code */
# /*!##### MySQL-specific code */ # for the version 

SELECT 1 /*! +1 */ ; # will return 2 for mySQL
SELECT 1 /*!90110 +1 */ ; 

# MySQL Aggregate Functions
# function_name(DISTINCT | ALL expression)
/*
AVG()	Return the average of non-NULL values.
BIT_AND()	Return bitwise AND.
BIT_OR()	Return bitwise OR.
BIT_XOR()	Return bitwise XOR.
COUNT()	Return the number of rows in a group, including rows with NULL values.
GROUP_CONCAT()	Return a concatenated string.
JSON_ARRAYAGG()	Return result set as a single JSON array.
JSON_OBJECTAGG()	Return result set as a single JSON object.
MAX()	Return the highest value (maximum) in a set of non-NULL values.
MIN()	Return the lowest value (minimum) in a set of non-NULL values.
STDEV()	Return the population standard deviation.
STDDEV_POP()	Return the population standard deviation.
STDDEV_SAMP()	Return the sample standard deviation.
SUM()	Return the summation of all non-NULL values a set.
VAR_POP()	Return the population standard variance.
VARP_SAM()	Return the sample variance.
VARIANCE()	Return the population standard variance.
*/

# MySQL Comparison Functions
SELECT COALESCE(NULL, 0);  -- 0
SELECT COALESCE(NULL, NULL); -- NULL;

SELECT GREATEST(10, 20, 30),  -- 30
       LEAST(10, 20, 30); -- 10 
 
SELECT GREATEST(10, null, 30),  -- null
       LEAST(10, null , 30); -- null

CREATE TABLE IF NOT EXISTS revenues (
    company_id INT PRIMARY KEY,
    q1 DECIMAL(19 , 2 ),
    q2 DECIMAL(19 , 2 ),
    q3 DECIMAL(19 , 2 ),
    q4 DECIMAL(19 , 2 )
);

INSERT INTO revenues(company_id,q1,q2,q3,q4)
VALUES (1,100,120,110,130),
       (2,250,260,300,310);
       
SELECT 
    company_id,
    LEAST(q1, q2, q3, q4) low,
    GREATEST(q1, q2, q3, q4) high
FROM
    revenues;

INSERT INTO revenues(company_id,q1,q2,q3,q4)
VALUES (3,100,120,110,null);

SELECT 
    company_id,
    LEAST(q1, q2, q3, q4) low,
    GREATEST(q1, q2, q3, q4) high
FROM
    revenues;

SELECT 
    company_id,
    LEAST(IFNULL(q1, 0),
            IFNULL(q2, 0),
            IFNULL(q3, 0),
            IFNULL(q4, 0)) low,
    GREATEST(IFNULL(q1, 0),
            IFNULL(q2, 0),
            IFNULL(q3, 0),
            IFNULL(q4, 0)) high
FROM
    revenues;
    
SELECT ISNULL(NULL); -- 1    
SELECT ISNULL(1);  -- 0
SELECT ISNULL(1 + NULL); -- 1;
SELECT ISNULL(1 / 0 ); -- 1;

SELECT 
    customerName, 
    COUNT(*) orderCount
FROM
    orders
INNER JOIN customers 
    USING (customerNumber)
GROUP BY customerName
ORDER BY COUNT(*);

WITH cte AS (
    SELECT 
        customerName, 
        COUNT(*) orderCount
    FROM
        orders
    INNER JOIN customers 
        USING (customerNumber)
    GROUP BY customerName
)
SELECT 
    customerName, 
    orderCount,
    CASE orderCount
        WHEN 1 THEN 'One-time Customer'
        WHEN 2 THEN 'Repeated Customer'
        WHEN 3 THEN 'Frequent Customer'
        ELSE 'Loyal Customer'
    end customerType
FROM
    cte
ORDER BY customerName;

SELECT 
    customerName, 
    state, 
    country
FROM
    customers
ORDER BY (
    CASE
    WHEN state IS NULL 
            THEN country
    ELSE state
END);

SELECT 
    SUM(CASE
        WHEN status = 'Shipped' THEN 1
        ELSE 0
    END) AS 'Shipped',
    SUM(CASE
        WHEN status = 'On Hold' THEN 1
        ELSE 0
    END) AS 'On Hold',
    SUM(CASE
        WHEN status = 'In Process' THEN 1
        ELSE 0
    END) AS 'In Process',
    SUM(CASE
        WHEN status = 'Resolved' THEN 1
        ELSE 0
    END) AS 'Resolved',
    SUM(CASE
        WHEN status = 'Cancelled' THEN 1
        ELSE 0
    END) AS 'Cancelled',
    SUM(CASE
        WHEN status = 'Disputed' THEN 1
        ELSE 0
    END) AS 'Disputed',
    COUNT(*) AS Total
FROM
    orders;
    
SELECT IF(1 = 2,'true','false'); -- false
SELECT IF(1 = 1,' true','false'); -- true

SELECT 
    customerNumber,
    customerName,
    IF(state IS NULL, 'N/A', state) state,
    country
FROM
    customers;
    
SELECT 
    SUM(IF(status = 'Shipped', 1, 0)) AS Shipped,
    SUM(IF(status = 'Cancelled', 1, 0)) AS Cancelled
FROM
    orders;

SELECT DISTINCT
    status
FROM
    orders
ORDER BY status;

SELECT 
    COUNT(IF(status = 'Cancelled', 1, NULL)) Cancelled,
    COUNT(IF(status = 'Disputed', 1, NULL)) Disputed,
    COUNT(IF(status = 'In Process', 1, NULL)) 'In Process',
    COUNT(IF(status = 'On Hold', 1, NULL)) 'On Hold',
    COUNT(IF(status = 'Resolved', 1, NULL)) 'Resolved',
    COUNT(IF(status = 'Shipped', 1, NULL)) 'Shipped'
FROM
    orders;
    
SELECT status, COUNT(STATUS)
FROM orders
GROUP BY status;

# IFNULL, NULLIF
# MySQL Date Functions
/*
CURDATE	Returns the current date.
DATEDIFF	Calculates the number of days between two DATE values.
DAY	Gets the day of the month of a specified date.
DATE_ADD	Adds a time value to date value.
DATE_SUB	Subtracts a time value from a date value.
DATE_FORMAT	Formats a date value based on a specified date format.
DAYNAME	Gets the name of a weekday for a specified date.
DAYOFWEEK	Returns the weekday index for a date.
EXTRACT	Extracts a part of a date.
LAST_DAY	Returns the last day of the month of a specified date
NOW	Returns the current date and time at which the statement executed.
MONTH	Returns an integer that represents a month of a specified date.
STR_TO_DATE	Converts a string into a date and time value based on a specified format.
SYSDATE	Returns the current date.
TIMEDIFF	Calculates the difference between two TIME or DATETIME values.
TIMESTAMPDIFF	Calculates the difference between two DATE or DATETIME values.
WEEK	Returns a week number of a date.
WEEKDAY	Returns a weekday index for a date.
YEAR	Return the year for a specified date
*/

# MySQL String Functions
/*
CONCAT	Concatenate two or more strings into a single string
INSTR	Return the position of the first occurrence of a substring in a string
LENGTH	Get the length of a string in bytes and in characters
LEFT	Get a specified number of leftmost characters from a string
LOWER	Convert a string to lowercase
LTRIM	Remove all leading spaces from a string
REPLACE	Search and replace a substring in a string
RIGHT	Get a specified number of rightmost characters from a string
RTRIM	Remove all trailing spaces from a string
SUBSTRING	Extract a substring starting from a position with a specific length.
SUBSTRING_INDEX	Return a substring from a string before a specified number of occurrences of a delimiter
TRIM	Remove unwanted characters from a string.
FIND_IN_SET	Find a string within a comma-separated list of strings
FORMAT	Format a number with a specific locale, rounded to the number of decimals
UPPER	Convert a string to uppercase
*/

# MySQL Math Functions
/*
ABS()	Returns the absolute value of a number
CEIL()	Returns the smallest integer value greater than or equal to the input number (n).
FLOOR()	Returns the largest integer value not greater than the argument
MOD()	Returns the remainder of a number divided by another
ROUND()	Rounds a number to a specified number of decimal places.
TRUNCATE()	Truncates a number to a specified number of decimal places
ACOS(n)	Returns the arc cosine of n or null if n is not in the range -1 and 1.
ASIN(n)	Returns the arcsine of n which is the value whose sine is n. It returns null if n is not in the range -1 to 1.
ATAN()	Returns the arctangent of n.
ATAN2(n,m), ATAN(m,n)	Returns the arctangent of the two variables n and m
CONV(n,from_base,to_base)	Converts a number between different number bases
COS(n)	Returns the cosine of n, where n is in radians
COT(n)	Returns the cotangent of n.
CRC32()	Computes a cyclic redundancy check value and returns a 32-bit unsigned value
DEGREES(n)	Converts radians to degrees of the argument n
EXP(n)	Raises to the power of e raised to the power of n
LN(n)	Returns the natural logarithm of n
LOG(n)	Returns the natural logarithm of the first argument
LOG10()	Returns the base-10 logarithm of the argument
LOG2()	Returns the base-2 logarithm of the argument
PI()	Returns the value of PI
POW()	Returns the argument raised to the specified power
POWER()	Returns the argument raised to the specified power
RADIANS()	Returns argument converted to radians
RAND()	Returns a random floating-point value
SIGN(n)	Returns the sign of n that can be -1, 0, or 1 depending on whether n is negative, zero, or positive.
SIN(n)	Returns the sine of n
SQRT(n)	Returns the square root of n
TAN(n)	Returns the tangent of n
*/

# window functions
DROP TABLE sales;

CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
 
SELECT * FROM sales;

SELECT 
    SUM(sale)
FROM
    sales; 
    
SELECT 
    fiscal_year, 
    SUM(sale)
FROM
    sales
GROUP BY 
    fiscal_year; 
    
# Like the aggregate functions with the GROUP BY clause, 
# window functions also operate on a subset of rows 
# but they do not reduce the number of rows returned by the query.

SELECT 
    fiscal_year, 
    sales_employee,
    sale,
    SUM(sale) OVER (PARTITION BY fiscal_year) total_sales
FROM
    sales; 

/*
   window_function_name(expression) 
    OVER (
        [partition_defintion]
        [order_definition]
        [frame_definition]
    )

PARTITION BY <expression>[{,<expression>...}]
ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
frame_unit {<frame_start>|<frame_between>}

The frame_start contains one of the following:

UNBOUNDED PRECEDING: frame starts at the first row of the partition.
N PRECEDING: a physical N of rows before the first current row. N can be a literal number or an expression that evaluates to a number.
CURRENT ROW: the row of the current calculation

frame_between
BETWEEN frame_boundary_1 AND frame_boundary_2   
frame_start: as mentioned previously.
UNBOUNDED FOLLOWING: the frame ends at the final row in the partition.
N FOLLOWING: a physical N of rows after the current row.
*/
#RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
/*
CUME_DIST	Calculates the cumulative distribution of a value in a set of values.
DENSE_RANK	Assigns a rank to every row within its partition based on the ORDER BY clause. It assigns the same rank to the rows with equal values. If two or more rows have the same rank, then there will be no gaps in the sequence of ranked values.
FIRST_VALUE	Returns the value of the specified expression with respect to the first row in the window frame.
LAG	Returns the value of the Nth row before the current row in a partition. It returns NULL if no preceding row exists.
LAST_VALUE	Returns the value of the specified expression with respect to the last row in the window frame.
LEAD	Returns the value of the Nth row after the current row in a partition. It returns NULL if no subsequent row exists.
NTH_VALUE	Returns value of argument from Nth row of the window frame
NTILE	Distributes the rows for each window partition into a specified number of ranked groups.
PERCENT_RANK	Calculates the percentile rank of a row in a partition or result set
RANK	Similar to the DENSE_RANK() function except that there are gaps in the sequence of ranked values when two or more rows have the same rank.
ROW_NUMBER	Assigns a sequential integer to every row within its partition
*/

CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);
 
INSERT INTO
    scores(name, score)
VALUES
    ('Smith',81),
    ('Jones',55),
    ('Williams',55),
    ('Taylor',62),
    ('Brown',62),
    ('Davies',84),
    ('Evans',87),
    ('Wilson',72),
    ('Thomas',72),
    ('Johnson',100);
    
SELECT
    name,
    score,
    ROW_NUMBER() OVER (ORDER BY score) row_num,
    CUME_DIST() OVER (ORDER BY score) cume_dist_val
FROM
    scores;
    
DROP TABLE IF EXISTS t;

CREATE TABLE t (
    val INT
);
 
INSERT INTO t(val)
VALUES(1),(2),(2),(3),(4),(4),(5);
 
SELECT  * FROM   t;

SELECT
    val,
    DENSE_RANK() OVER (
        ORDER BY val
    ) my_rank
FROM
    t;
    
SELECT
    sales_employee,
    fiscal_year,
    sale,
    DENSE_RANK() OVER (PARTITION BY
                     fiscal_year
                 ORDER BY
                     sale DESC
                ) sales_rank
FROM
    sales;
    
CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);

INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (
        ORDER BY hours
    ) least_over_time
FROM
    overtime;

SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
    ) least_over_time
FROM
    overtime;
    
# LAST_VALUE()
SELECT
    employee_name,
    hours,
    LAST_VALUE(employee_name) OVER (
        ORDER BY hours
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) highest_overtime_employee
FROM
    overtime;
# RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

SELECT
    employee_name,
    department,
    hours,
    LAST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
        RANGE BETWEEN
        UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) most_overtime_employee
FROM
    overtime;

  
# LAG
WITH productline_sales AS (
    SELECT productline,
           YEAR(orderDate) order_year,
           ROUND(SUM(quantityOrdered * priceEach),0) order_value
    FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY productline, order_year
)
SELECT
    productline, 
    order_year, 
    order_value,
    LAG(order_value, 1) OVER (
        PARTITION BY productLine
        ORDER BY order_year
    ) prev_year_order_value
FROM 
    productline_sales;
    
# LEAD
SELECT 
    customerName,
    orderDate,
    LEAD(orderDate,1) OVER (
        PARTITION BY customerNumber
        ORDER BY orderDate ) nextOrderDate
FROM 
    orders
INNER JOIN customers USING (customerNumber);

# NTH_VALUE 
CREATE TABLE basic_pays(
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
 
INSERT INTO 
    basic_pays(employee_name, 
               department, 
               salary)
VALUES
    ('Diane Murphy','Accounting',8435),
    ('Mary Patterson','Accounting',9998),
    ('Jeff Firrelli','Accounting',8992),
    ('William Patterson','Accounting',8870),
    ('Gerard Bondur','Accounting',11472),
    ('Anthony Bow','Accounting',6627),
    ('Leslie Jennings','IT',8113),
    ('Leslie Thompson','IT',5186),
    ('Julie Firrelli','Sales',9181),
    ('Steve Patterson','Sales',9441),
    ('Foon Yue Tseng','Sales',6660),
    ('George Vanauf','Sales',10563),
    ('Loui Bondur','SCM',10449),
    ('Gerard Hernandez','SCM',6949),
    ('Pamela Castillo','SCM',11303),
    ('Larry Bott','SCM',11798),
    ('Barry Jones','SCM',10586);

SELECT
    employee_name,
    salary,
    NTH_VALUE(employee_name, 2) OVER  (
        ORDER BY salary DESC
    ) second_highest_salary
FROM
    basic_pays;

SELECT
    employee_name,
    department,
    salary,
    NTH_VALUE(employee_name, 2) OVER  (
        PARTITION BY department
        ORDER BY salary DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) second_highest_salary
FROM
    basic_pays;
    
# NTILE
DROP TABLE IF EXISTS t;
CREATE TABLE t (
    val INT NOT NULL
);
 
INSERT INTO t(val) 
VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9);
  
SELECT * FROM t;

SELECT 
    val, 
    NTILE (4) OVER (
        ORDER BY val
    ) bucket_no
FROM 
    t;

SELECT 
    val, 
    NTILE (3) OVER (
        ORDER BY val
    ) bucket_no
FROM 
    t;
    
WITH productline_sales AS (
    SELECT productline,
           year(orderDate) order_year,
           ROUND(SUM(quantityOrdered * priceEach),0) order_value
    FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY productline, order_year
)
SELECT
    productline, 
    order_year, 
    order_value,
    NTILE(3) OVER (
        PARTITION BY order_year
        ORDER BY order_value DESC
    ) product_line_group
FROM 
    productline_sales;
    
# PERCENT_RANK
CREATE TABLE productLineSales
SELECT
    productLine,
    YEAR(orderDate) orderYear,
    quantityOrdered * priceEach orderValue
FROM
    orderDetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine ,
    YEAR(orderDate);
    
WITH t AS (
    SELECT
        productLine,
        SUM(orderValue) orderValue
    FROM
        productLineSales
    GROUP BY
        productLine
)
SELECT
    productLine,
    orderValue,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY orderValue
       )
    ,2) percentile_rank
FROM
    t;
    
SELECT
    productLine,
    orderYear,
    orderValue,
    ROUND(
    PERCENT_RANK()
    OVER (
        PARTITION BY orderYear
        ORDER BY orderValue
    ),2) percentile_rank
FROM
    productLineSales;
    
# RANK
INSERT INTO t (val) VALUES (2), (5), (0);
SELECT
    val,
    RANK() OVER (
        ORDER BY val
    ) my_rank
FROM
    t;
 
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
      ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
 
SELECT * FROM sales;
SELECT
    sales_employee,
    fiscal_year,
    sale,
    RANK() OVER (PARTITION BY
                     fiscal_year
                 ORDER BY
                     sale DESC
                ) sales_rank
FROM
    sales;

WITH order_values AS(
    SELECT 
        orderNumber, 
        YEAR(orderDate) order_year,
        quantityOrdered*priceEach AS order_value,
        RANK() OVER (
            PARTITION BY YEAR(orderDate)
            ORDER BY quantityOrdered*priceEach DESC
        ) order_value_rank
    FROM
        orders
    INNER JOIN orderDetails USING (orderNumber)
)
SELECT 
    * 
FROM 
    order_values
WHERE 
    order_value_rank <=3;
    
# ROW_NUMBER
SELECT 
    ROW_NUMBER() OVER (
        ORDER BY productName
    ) row_num,
    productName,
    msrp
FROM 
    products
ORDER BY 
    productName;
    
WITH inventory
AS (SELECT 
       productLine,
       productName,
       quantityInStock,
       ROW_NUMBER() OVER (
          PARTITION BY productLine 
          ORDER BY quantityInStock DESC) row_num
    FROM 
       products
   )
SELECT 
   productLine,
   productName,
   quantityInStock
FROM 
   inventory
WHERE 
   row_num <= 3;
   
# remove duplicate rows
DROP TABLE t;
CREATE TABLE t (
    id INT,
    name VARCHAR(10) NOT NULL
);
 
INSERT INTO t(id,name) 
VALUES(1,'A'),
      (2,'B'),
      (2,'B'),
      (3,'C'),
      (3,'C'),
      (3,'C'),
      (4,'D');
      
SELECT 
    id,
    name,
    ROW_NUMBER() OVER (PARTITION BY id, name ORDER BY id) AS row_num
FROM t;

WITH dups AS (SELECT 
        id,
        name,
        ROW_NUMBER() OVER(PARTITION BY id, name ORDER BY id) AS row_num
    FROM t)
 
DELETE FROM t USING t JOIN dups ON t.id = dups.id
WHERE dups.row_num <> 1;

# Pagination using  ROW_NUMBER()
SELECT *
FROM 
    (SELECT productName,
         msrp,
         row_number()
        OVER (order by msrp) AS row_num
    FROM products) t
WHERE row_num BETWEEN 11 AND 20; 