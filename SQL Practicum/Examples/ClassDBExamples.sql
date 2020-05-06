/*
Write a query that returns a list of suppliers that have 'textile' in their name
*/

SELECT * 
FROM SUPPLIERS
WHERE SUPPLIER_NAME LIKE '%textile%'
;

/*
returns noting due to case sensitivity.  Make it case insensitive...
*/

SELECT * 
FROM SUPPLIERS
WHERE UPPER(SUPPLIER_NAME) LIKE '%TEXTILE%'
;


/*
write a query that returns a derived string that forms a message of the form:
[customers.full_name]'s email address is: [customers.email_address]
*/

SELECT RTRIM(FULL_NAME) || '''s email address is: ' || RTRIM(EMAIL_ADDRESS)
FROM CUSTOMERS;


/*
Write a query that returns name, email, and 
their associated orders (show order_id, order_datetime, 
order_status) for customer_id =1.
*/

SELECT FULL_NAME, EMAIL_ADDRESS, ORDER_ID, ORDER_DATETIME, ORDER_STATUS
FROM CUSTOMERS C, ORDERS O
WHERE C.CUSTOMER_ID = O.CUSTOMER_ID
      AND C.CUSTOMER_ID = 1
;     


/* 
So, now we know that Tammy Bryant has 5 orders...
Show a list of customer_id and names with each customer's count of orders.
*/

SELECT C.CUSTOMER_ID, FULL_NAME, COUNT(*) AS NUMBER_OF_ORDERS
FROM CUSTOMERS C, ORDERS O
WHERE C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, FULL_NAME
ORDER BY C.CUSTOMER_ID
;

/*
Extend the query above to show the total dollar value of each customer's orders.
Sort in descending dollar value.
*/

SELECT C.CUSTOMER_ID, FULL_NAME, SUM(QUANTITY * UNIT_PRICE) AS TOTAL_ORDER_VALUE
FROM CUSTOMERS C, ORDERS O, ORDER_ITEMS OI
WHERE C.CUSTOMER_ID = O.CUSTOMER_ID
    AND O.ORDER_ID = OI.ORDER_ID
GROUP BY C.CUSTOMER_ID, FULL_NAME
ORDER BY TOTAL_ORDER_VALUE DESC
;

/*
Now write a similar query to count the total number of shipments per customer
*/

SELECT C.CUSTOMER_ID, FULL_NAME, COUNT(*) AS TOTAL_SHIPMENTS_TO_CUST
FROM CUSTOMERS C, ORDERS O, ORDER_ITEMS OI, SHIPMENTS S
WHERE C.CUSTOMER_ID = O.CUSTOMER_ID
    AND O.ORDER_ID = OI.ORDER_ID
    AND OI.LINE_ID = S.LINE_ID
GROUP BY C.CUSTOMER_ID, FULL_NAME
ORDER BY TOTAL_SHIPMENTS_TO_CUST DESC
;

/*
How about total shipments per order? Show only order_id and shipment count.
*/
SELECT O.ORDER_ID, COUNT(*) AS TOTAL_SHIPMENTS_FOR_ORDER
FROM CUSTOMERS C, ORDERS O, ORDER_ITEMS OI, SHIPMENTS S
WHERE C.CUSTOMER_ID = O.CUSTOMER_ID
    AND O.ORDER_ID = OI.ORDER_ID
    AND OI.LINE_ID = S.LINE_ID
GROUP BY O.ORDER_ID
ORDER BY TOTAL_SHIPMENTS_FOR_ORDER DESC
;

/*
Write a query that uses a subquery to show which suppliers had shipments 
on January 5, 2019.  Show supplier_id, supplier_name.  Sort by supplier_id asc.
*/

SELECT SUPPLIER_ID, SUPPLIER_NAME
FROM SUPPLIERS 
WHERE SUPPLIER_ID IN
   (SELECT SUPPLIER_ID
   FROM SHIPMENTS
   WHERE SHIPDATE = '01-MAR-2018')
   ;
   
/* 
Write a query to do the samething as the query above but use a join 
*/

SELECT DISTINCT S.SUPPLIER_ID, SUPPLIER_NAME
FROM SUPPLIERS S, SHIPMENTS SH
WHERE S.SUPPLIER_ID = SH.SUPPLIER_ID
   AND SHIPDATE = '01-MAR-2018'
   ;

/* Or using JOIN ON syntax */
   
SELECT DISTINCT S.SUPPLIER_ID, SUPPLIER_NAME
FROM SUPPLIERS S JOIN SHIPMENTS SH ON S.SUPPLIER_ID = SH.SUPPLIER_ID
WHERE SHIPDATE = '01-MAR-2018'
   ;  

/* 
Now, show the same result but this time, also show the suppliers who do NOT
have shipments on that day.  Include the shipdate attribute.  The suppliers 
who did not ship that date will have null for date.
(hint: LEFT OUTER JOIN)
*/

SELECT DISTINCT S.SUPPLIER_ID, SUPPLIER_NAME, SHIPDATE
FROM SUPPLIERS S LEFT JOIN SHIPMENTS SH ON S.SUPPLIER_ID = SH.SUPPLIER_ID
WHERE SHIPDATE = '01-MAR-2018'
;

/* That does not work because the criteria comes after the table join.
use a subquery to creat a table of only shipments on that date.*/

SELECT DISTINCT S.SUPPLIER_ID, SUPPLIER_NAME, SHIPDATE
FROM SUPPLIERS S LEFT JOIN (SELECT * FROM SHIPMENTS SH WHERE SHIPDATE = '01-MAR-2018') D 
ON S.SUPPLIER_ID = D.SUPPLIER_ID
;

/* Above: This uses a subquery as a derived table */


/*
Use an outer join to show products that have been ordered and their quantity ordered.  
Show products that have not been ordered with null for quantity.
*/

SELECT P.PRODUCT_ID, PRODUCT_NAME, QUANTITY
FROM PRODUCTS P LEFT JOIN ORDER_ITEMS OI ON
P.PRODUCT_ID = OI.PRODUCT_ID
;