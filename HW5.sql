USE classicmodels;

/* Query 1*/
SELECT count(*)
FROM offices
WHERE country = "USA";

/* Query 2 (10 Results) */
SELECT 
    o.city,
    CONCAT(e.firstName, ' ', e.lastName) AS 'Employee Name'
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
WHERE e.officeCode IN
    (SELECT officeCode
    FROM offices 
    WHERE country = 'USA')
ORDER BY e.lastName;

/* Query 3 (7 Results) */
SELECT 
    o.city,
    COUNT(*)
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
GROUP BY o.city
ORDER BY COUNT(*) DESC;

/* Query 4 (273 Results) */
SELECT 
    c.customerName,
    CONCAT(c.contactFirstName, ' ', c.contactLastName) as 'Contact Name',
    c.phone,
    p.paymentDate, 
    p.amount
FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber
ORDER BY p.paymentDate DESC;   

/* Query 5 (98 Results) */
SELECT 
    c.customerName,   
    CONCAT(c.contactFirstName, ' ', c.contactLastName) as 'Contact Name',
    c.phone,
    SUM(p.amount) AS 'Total_Payments'
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName;

/* Query 6 (122 Results) */
SELECT 
    c.customerName,   
    CONCAT(c.contactFirstName, ' ', c.contactLastName) as 'Contact Name',
    c.phone,
    SUM(p.amount) AS 'Total_Payments'
FROM customers c
LEFT OUTER JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName;

/* Query 7 (24 Results) */
SELECT 
    c.customerName,   
    CONCAT(c.contactFirstName, ' ', c.contactLastName) as 'Contact Name',
    c.phone,
    SUM(p.amount) AS 'Total_Payments'
FROM customers c
LEFT OUTER JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount IS NULL
GROUP BY c.customerName;

/* Query 8 (15 Results) */
SELECT 
    CONCAT(e.lastName, ', ', e.firstName) as 'Sales Rep',
    SUM(p.amount) AS 'Total_Payments'
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber
ORDER BY SUM(p.amount) DESC;

/* Query 9 (23 Results) */
SELECT
    CONCAT(m.firstName, ' ', m.lastName) AS 'Manager',
    COUNT(e.employeeNumber)
FROM employees e
RIGHT OUTER JOIN employees m ON m.employeeNumber = e.reportsTo
GROUP BY m.employeeNumber
ORDER BY m.lastName;

/* Query 10 (7 Results) */
SELECT 
    pl.productLine,
    MAX(p.MSRP)
FROM products p
JOIN productlines pl ON pl.productLine = p.productLine
GROUP BY pl.productLine
ORDER BY MAX(p.MSRP) DESC;