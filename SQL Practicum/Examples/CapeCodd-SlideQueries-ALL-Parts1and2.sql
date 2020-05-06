/* *** SQL-Query-CH02-01 *** */

SELECT	SKU, SKU_Description, Department, Buyer
FROM	SKU_DATA;

/* *** SQL-Query-CH02-02 *** */

SELECT	*
FROM	SKU_DATA;

/* *** SQL-Query-CH02-03 *** */

SELECT	Department, Buyer
FROM	SKU_DATA;

/* *** SQL-Query-CH02-04 *** */

SELECT	Buyer, Department
FROM	SKU_DATA;

/* *** SQL-Query-CH02-05 *** */

SELECT	DISTINCT Buyer, Department
FROM	SKU_DATA;

/* *** SQL-Query-CH02-06 *** */

/*  The query below only works in SQL Server

SELECT 	TOP 5 Buyer, Department
FROM SKU_DATA;
*/
/*  This does the same thing in Oracle:
*/
SELECT Buyer, Department
FROM SKU_DATA
WHERE Rownum < 6;

/* *** SQL-Query-CH02-07 *** */
/* Method shown does not work in Oracle */

/* *** SQL-Query-CH02-08 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Department = 'Water Sports';

/* *** SQL-Query-CH02-09 *** */

SELECT *
FROM CATALOG_SKU_2014
WHERE DateOnWebSite = '01-JAN-2014';

/* *** SQL-Query-CH02-10 *** */

SELECT *
FROM SKU_DATA
WHERE SKU > 200000;

/* *** SQL-Query-CH02-11 *** */

SELECT	SKU_Description, Department
FROM		SKU_DATA
WHERE	Department = 'Climbing';

/* *** SQL-Query-CH02-13 *** */

SELECT	*
FROM		ORDER_ITEM
ORDER BY	OrderNumber; 

/* *** SQL-Query-CH02-16 *** */
/* Result on slide wrong! */

SELECT	*
FROM		ORDER_ITEM
ORDER BY	Price DESC, OrderNumber ASC;

/* *** SQL-Query-CH02-18 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Department = 'Water Sports'
	AND	Buyer = 'Nancy Meyers';

/* *** SQL-Query-CH02-19 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Department = 'Camping'
	OR Department = 'Climbing';

/* *** SQL-Query-CH02-20 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Department = 'Water Sports'
	AND NOT	Buyer = 'Nancy Meyers';

/* *** SQL-Query-CH02-21 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Buyer IN ('Nancy Meyers',
			'Cindy Lo', 'Jerry Martin');

/* *** SQL-Query-CH02-18 *** */

SELECT	*
FROM		SKU_DATA
WHERE	Buyer NOT IN ('Nancy Meyers',
			'Cindy Lo', 'Jerry Martin');

/* *** SQL-Query-CH02-23 *** */

SELECT	*
FROM		ORDER_ITEM
WHERE	ExtendedPrice >= 100
	AND 	ExtendedPrice <= 200
ORDER BY ExtendedPrice;

/* *** SQL-Query-CH02-24 *** */

SELECT	*
FROM		ORDER_ITEM
WHERE	ExtendedPrice
			BETWEEN 100 AND 200
ORDER BY ExtendedPrice;

/* *** SQL-Query-CH02-25 *** */

SELECT	*
FROM		ORDER_ITEM
WHERE	ExtendedPrice
			NOT BETWEEN 100 AND 200
ORDER BY ExtendedPrice;

/* *** SQL-Query-CH02-26 *** */

SELECT	*
FROM	SKU_DATA
WHERE	Buyer LIKE 'Pete%';

/* *** SQL-Query-CH02-27 *** */

SELECT	*
FROM	SKU_DATA
WHERE	SKU_Description LIKE '%Tent%';

/* *** SQL-Query-CH02-29 *** */

SELECT	*
FROM	SKU_DATA
WHERE	SKU LIKE '%2__';

/* *** SQL-Query-CH02-30 *** */

SELECT *
FROM CATALOG_SKU_2015
WHERE CatalogPage IS NULL;

/* *** SQL-Query-CH02-31 *** */

SELECT *
FROM CATALOG_SKU_2015
WHERE CatalogPage IS NOT NULL;

/* *** SQL-Query-CH02-33 *** */

SELECT SUM(OrderTotal) AS OrderSum
FROM RETAIL_ORDER;

/* *** SQL-Query-CH02-35 *** */

SELECT	SUM (ExtendedPrice) AS OrderItemSum,
			AVG (ExtendedPrice) AS OrderItemAvg,
			MIN (ExtendedPrice) AS OrderItemMin,
			MAX (ExtendedPrice) AS OrderItemMax
FROM		ORDER_ITEM;

/* *** SQL-Query-CH02-36 *** */

SELECT	COUNT(*) AS NumberOfRows
FROM	ORDER_ITEM;

/* *** SQL-Query-CH02-38 *** */

SELECT	COUNT
			(DISTINCT Department)
			AS DeptCount
FROM	SKU_DATA;

/* *** SQL-Query-CH02-42 *** */

SELECT	OrderNumber, SKU, (Quantity * Price) AS EP
FROM	ORDER_ITEM
ORDER BY OrderNumber, SKU;

/* *** SQL-Query-CH02-45 *** */
/* USE '||' FOR CONCATENATION IN ORACLE - NOT '+' !!!    */

SELECT	SKU, SKU_Description, (Buyer || ' in ' || Department)
			AS Sponsor
FROM		SKU_DATA;

/* *** SQL-Query-CH02-46 *** */

SELECT	SKU, SKU_Description, (RTRIM(Buyer) || ' in ' || RTRIM(Department))
			AS Sponsor
FROM		SKU_DATA;

/* *** SQL-Query-CH02-48 *** */

SELECT Department, COUNT(SKU) AS NumberOfCatalogItems
FROM CATALOG_SKU_2014
WHERE CatalogPage IS NOT NULL
GROUP BY Department;

/* *** SQL-Query-CH02-49 *** */

SELECT Department, COUNT(SKU) AS NumberOfCatalogItems
FROM CATALOG_SKU_2014
WHERE CatalogPage IS NOT NULL
GROUP BY Department
HAVING COUNT(SKU) > 2;

/* *** SQL-Query-CH02-50 *** */

SELECT	Department, Buyer,
			COUNT(SKU) AS
			Dept_Buyer_SKU_Count
FROM	SKU_DATA
GROUP BY 	Department, Buyer;

/* *** SQL-Query-CH02-51 *** */
/* SEE SLIDE - ERROR IS INTENTIONAL */

SELECT	Department, SKU,
			COUNT(SKU) AS
			Dept_Buyer_SKU_Count
FROM	SKU_DATA
GROUP BY 	Department;

/* *** SQL-Query-CH02-52 *** */

SELECT	Department, COUNT(SKU) AS
			Dept_SKU_Count
FROM		SKU_DATA
WHERE	SKU <> 302000
GROUP BY 	Department
HAVING 		COUNT (SKU) > 1
ORDER BY		Dept_SKU_Count;

/* *** SQL-Query-CH02-53 *** */

SELECT	SUM (ExtendedPrice) AS WaterSportsRevenue
FROM		ORDER_ITEM
WHERE		SKU IN (100100, 100200, 101100, 101200);

/* *** SQL-Query-CH02-54 *** */

SELECT	SKU
FROM		SKU_DATA
WHERE	 Department = 'Water Sports';

/* *** SQL-Query-CH02-55 *** */

SELECT	SUM (ExtendedPrice) AS WaterSportsRevenue
FROM		ORDER_ITEM
WHERE		SKU IN
			(SELECT	SKU
			FROM		SKU_DATA
			WHERE	 Department = 'Water Sports');

/* *** SQL-Query-CH02-57 *** */

SELECT	Buyer, Department, COUNT(SKU) AS Number_Of_SKU_Sold
FROM		SKU_DATA
WHERE		SKU IN
			(SELECT	SKU
			FROM		ORDER_ITEM
			WHERE		OrderNumber IN
					(SELECT	OrderNumber
					FROM		RETAIL_ORDER
					WHERE	OrderMonth = 'January'
					  AND	OrderYear = 2015))
GROUP BY Buyer, Department
ORDER BY Number_Of_SKU_Sold;

/* *** SQL-Query-CH02-58 *** */

SELECT *
FROM RETAIL_ORDER, ORDER_ITEM;

/* *** SQL-Query-CH02-59 *** */

SELECT *
FROM RETAIL_ORDER, ORDER_ITEM
WHERE RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber;

/* *** SQL-Query-CH02-60 *** */

SELECT *
FROM RETAIL_ORDER, ORDER_ITEM
WHERE RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
ORDER BY RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;

/* *** SQL-Query-CH02-62 *** */

SELECT	BUYER, SKU_DATA.SKU, SKU_DESCRIPTION,
        SUM(ExtendedPrice) AS BuyerSKURevenue
FROM		SKU_DATA, ORDER_ITEM
WHERE		SKU_DATA.SKU = ORDER_ITEM.SKU
GROUP BY	BUYER, SKU_DATA.SKU, SKU_DESCRIPTION
ORDER BY	BuyerSKURevenue DESC;

/* *** SQL-Query-CH02-66 *** */

SELECT	*
FROM		RETAIL_ORDER JOIN ORDER_ITEM 
ON RETAIL_ORDER.ORDERNUMBER = ORDER_ITEM.ORDERNUMBER
WHERE		ORDERYEAR = '2014'
ORDER BY	RETAIL_ORDER.ORDERNUMBER, ORDER_ITEM.SKU;

/* *** SQL-Query-CH02-I1 *** */
/*
SELECT STUDENTPK, STUDENTNAME, LOCKERFK, LOCKERPK, LOCKERTYPE
FROM STUDENT JOIN LOCKER
         ON STUDENT.LOCKERFK = LOCKER.LOCKERPK;

/* *** SQL-Query-CH02-I2 *** */
/*
SELECT STUDENTPK, STUDENTNAME, LOCKERFK, 
         LOCKERPK, LOCKERTYPE
FROM STUDENT LEFT JOIN LOCKER
         ON STUDENT.LOCKERFK = LOCKER.LOCKERPK;
*/
/* *** SQL-Query-CH02-I3 *** */
/*
SELECT STUDENTPK, STUDENTNAME, LOCKERFK, 
         LOCKERPK, LOCKERTYPE
FROM STUDENT, LOCKER
WHERE  STUDENT.LOCKERFK = LOCKER.LOCKERPK (+);
*/
/* *** SQL-Query-CH02-I4 *** */
/*
SELECT STUDENTPK, STUDENTNAME, LOCKERFK, 
         LOCKERPK, LOCKERTYPE
FROM STUDENT RIGHT JOIN LOCKER
         ON STUDENT.LOCKERFK = LOCKER.LOCKERPK;
*/         
/* *** SQL-Query-CH02-I5 *** */
/*
SELECT STUDENTPK, STUDENTNAME, LOCKERFK, 
         LOCKERPK, LOCKERTYPE
FROM STUDENT, LOCKER
WHERE  STUDENT.LOCKERFK (+)= LOCKER.LOCKERPK;
*/     
/* *** SQL-Query-CH02-75 *** */

SELECT OI.ORDERNUMBER, QUANTITY, SD.SKU, 
       SKU_DESCRIPTION, DEPARTMENT, BUYER
FROM   ORDER_ITEM OI RIGHT JOIN SKU_DATA SD
       ON OI.SKU = SD.SKU
ORDER BY OI.ORDERNUMBER, SD.SKU;

/* *** SQL-Query-CH02-76 *** */

SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2014
UNION
SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2015;

/* *** SQL-Query-CH02-76-ALL *** */

SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2014
UNION ALL
SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2015;

/* *** SQL-Query-CH02-77 *** */

SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2014
INTERSECT
SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2015;

/* *** SQL-Query-CH02-78 *** */

SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2014
MINUS --("MINUS" IS ORACLE'S VERSION OF EXCEPT)
SELECT  SKU, SKU_DESCRIPTION, DEPARTMENT
FROM    CATALOG_SKU_2015;
