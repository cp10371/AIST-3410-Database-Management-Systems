USE classicmodels;

SELECT c.customerName, c.contactFirstName, c.contactLastName
FROM customers c
WHERE c.customerNumber < 120;

SELECT productCode, productName, productDescription
FROM products;

SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice < 25;

SELECT productCode, productName, quantityInStock, productVendor
FROM products
WHERE quantityInStock < 200;

SELECT territory, city, state, country, phone
FROM offices
GROUP BY territory, city;

SELECT COUNT(*)
FROM customers;

SELECT c.customerName, c.city, c.state, c.country, e.firstName, e.lastName
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT customerNumber, customerName, city, state, country
FROM customers 
WHERE salesRepEmployeeNumber is NULL;

SELECT COUNT(*)
FROM employees;

SELECT
    CONCAT(e.firstName, ' ', e.lastName) AS 'Employee',
    e.jobtitle,
    CONCAT(m.firstName, ' ', m.lastName) AS 'Manager'
FROM employees e
JOIN employees m ON m.employeeNumber = e.reportsTo;

SELECT firstName, lastName, jobTitle
FROM employees
WHERE reportsTo is NULL;