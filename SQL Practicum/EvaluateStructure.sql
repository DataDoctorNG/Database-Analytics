/*
Running this script creates a procedure in your database
that evaluates much of the practicum's database structure. 
Running this script only installs the procedure (and if you
Have compiling errors in the script then your table and/or 
attribute names have errors - you probably recieved errors 
when inserting data as well).

To run the procedure and evaluate your structure, 
first run this file as a script (in SQL Dev.), installing the 
procedure.  THEN find the 'Procedures' entry in your DB structure 
to the left. Refresh 'Procedures' and then select the procedure 
we just installed (likely the only one there).  Right click it 
and select run or click the green arrow above the procedure text 
(not the procedure sql file). Click OK on the dialog that opens. 
The procedure should run and provide output concerning many of the 
required structural elements.

The guarantee I provide you with is that if this script shows 
no errors(says 'Congratulations' at the bottom) then you will 
receive all the points associated with this part of the practicum. 
The exception is that if a script error is found early, students 
will need to pass the revised script.  I do test the script but 
it is basically in Beta test when released - if something becomes 
evident very quickly (max 2 days from release).
This guarantee covers 50% of the practicum points (everything 
except SQL DML).

Finally, a warning concerning this (added only because someone tried 
to pull this in a previous term).  The evaluation script is plain 
text and you technically could change it so that your database 'passes' 
everything on the script.  Please do note I run my own copy of the 
evaluation script as the final evaluation.  The one installed in your 
database is only for your use. Therefore, changing the script is both 
pointless and could be considered academic dishonesty.
*/

create or replace PROCEDURE EVALUATE_STRUCTURE 
			
	
AS 
      VARROWCOUNT				INT;
      IncorrectCount    INT;
      COUNT1             INT;
      VARDATE           DATE;
      VARSTRING         STRING(30);
      VARNUMBER         NUMBER(5,2);

BEGIN
  INCORRECTCOUNT := 0;
  --first commit all uncommitted work so it is not unintentionally rolled back
  COMMIT;
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING EXISTENCE OF TABLES AND RECORDS----------');


  -- CHECK TABLE CUSTOMERS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS
	;
	-- IF varRowCount =392 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table CUSTOMERS exists.');
			DBMS_OUTPUT.PUT_LINE('Table CUSTOMERS has '||VARROWCOUNT||' records (should have 392).');
		END;
  IF (VARROWCOUNT <> 392) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;

	 -- CHECK TABLE ORDER_ITEMS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDER_ITEMS
	;
	-- IF varRowCount = 3832 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table ORDER_ITEMS exists.');
			DBMS_OUTPUT.PUT_LINE('Table ORDER_ITEMS has '||VARROWCOUNT||' records (should have 3832).');
		END;
  IF (VARROWCOUNT <> 3832) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
  
-- CHECK TABLE ORDERS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDERS
	;
	-- IF varRowCount = 1950 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table ORDERS exists.');
			DBMS_OUTPUT.PUT_LINE('Table ORDERS has '||VARROWCOUNT||' records (should have 1950).');
		END;
  IF (VARROWCOUNT <> 1950) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
  
 -- CHECK TABLE PRODUCTS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		PRODUCTS
	;
	-- IF varRowCount = 45 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table PRODUCTS exists.');
			DBMS_OUTPUT.PUT_LINE('Table PRODUCTS has '||VARROWCOUNT||' records (should have 45).');
		END;
  IF (VARROWCOUNT <> 45) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
 

 -- CHECK TABLE SHIPMENTS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SHIPMENTS
	;
	-- IF varRowCount = 112 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table SHIPMENTS exists.');
			DBMS_OUTPUT.PUT_LINE('Table SHIPMENTS has '||VARROWCOUNT||' records (should have 112).');
		END;
	IF (VARROWCOUNT <> 112) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;

 -- CHECK TABLE SUPPLIER_MANU
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_MANU
	;
	-- IF varRowCount = 5 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIER_MANU exists.');
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIER_MANU has '||VARROWCOUNT||' records (should have 5).');
		END;
	IF (VARROWCOUNT <> 5) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
 -- CHECK TABLE SUPPLIER_WS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_WS
	;
	-- IF varRowCount = 5 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIER_WS exists.');
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIER_WS has '||VARROWCOUNT||' records (should have 5).');
		END;
	IF (VARROWCOUNT <> 5) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
 -- CHECK TABLE SUPPLIERS
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIERS
	;
	-- IF varRowCount = 10 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIERS exists.');
			DBMS_OUTPUT.PUT_LINE('Table SUPPLIERS has '||VARROWCOUNT||' records (should have 10).');
		END;
	IF (VARROWCOUNT <> 10) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
/*   
 -- CHECK TABLE P_VACCINATION
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		P_VACCINATION
	;
	-- IF varRowCount = 131 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table P_VACCINATION exists.');
			DBMS_OUTPUT.PUT_LINE('Table P_VACCINATION has '||VARROWCOUNT||' records (should have 131).');
		END;
	IF (VARROWCOUNT <> 131) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;

  -- CHECK TABLE P_VACCINE
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		P_VACCINE
	;
	-- IF varRowCount = 79 THEN CORRECT.
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Table P_VACCINE exists.');
			DBMS_OUTPUT.PUT_LINE('Table P_VACCINE has '||VARROWCOUNT||' records (should have 79).');
		END;
	IF (VARROWCOUNT <> 79) THEN 
    INCORRECTCOUNT := INCORRECTCOUNT + 1;
    DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
  END IF;
*/


DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING ATTRIBUTE AND PRIMARY KEY STRUCTURE----------');

BEGIN  
Insert into CUSTOMERS (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (9152,'ali.brengle5@internalmail','Ali5 Brengle');
DBMS_OUTPUT.PUT_LINE('CUSTOMERS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('CUSTOMERS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN 
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS
  WHERE CUSTOMER_ID = '152' 
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into CUSTOMERS (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (152,'ali.brengle5@internalmail','Ali5 Brengle');
DBMS_OUTPUT.PUT_LINE('CUSTOMERS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('CUSTOMERS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY,LINE_ID) values (1200,8,32,5.65,5,1053989);
DBMS_OUTPUT.PUT_LINE('ORDER_ITEMS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ORDER_ITEMS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDER_ITEMS
  WHERE LINE_ID = '103989'
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY,LINE_ID) values (1200,8,32,5.65,5,103989);
DBMS_OUTPUT.PUT_LINE('ORDER_ITEMS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ORDER_ITEMS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,IMAGE_MIME_TYPE,IMAGE_FILENAME,IMAGE_CHARSET,IMAGE_LAST_UPDATED) values (111111111,'Boy''s Shirt (White)',29.55,null,null,null,null);
DBMS_OUTPUT.PUT_LINE('PRODUCTS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('PRODUCTS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		PRODUCTS
  WHERE PRODUCT_ID = 1
 	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,IMAGE_MIME_TYPE,IMAGE_FILENAME,IMAGE_CHARSET,IMAGE_LAST_UPDATED) values (1,'Boy''s Shirt (WShite)',29.65,null,null,null,null);
DBMS_OUTPUT.PUT_LINE('PRODUCTS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('PRODUCTS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,ORDER_STATUS,STORE_ID) values (99999991,to_timestamp('04-FEB-18 01.20.22.245677000 PM','DD-MON-RR HH.MI.SSXFF AM'),3,'CANCELLED',1);
DBMS_OUTPUT.PUT_LINE('ORDERS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ORDERS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDERS
  WHERE ORDER_ID = 1;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,ORDER_STATUS,STORE_ID) values (1,to_timestamp('04-FEB-18 01.20.22.245677000 PM','DD-MON-RR HH.MI.SSXFF AM'),3,'CANCELLED',1);
DBMS_OUTPUT.PUT_LINE('ORDERS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ORDERS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into SHIPMENTS (LINE_ID,SUPPLIER_ID,QUANTITY_SHIPPED,SHIPPER,TRACKING_NUM,SHIPDATE) values (104024,121210,2,'UPS','1Z 292501',to_date('22-FEB-18','DD-MON-RR'));
DBMS_OUTPUT.PUT_LINE('SHIPMENTS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SHIPMENTS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SHIPMENTS
  WHERE LINE_ID = 104024 AND SUPPLIER_ID = 121201
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into SHIPMENTS (LINE_ID,SUPPLIER_ID,QUANTITY_SHIPPED,SHIPPER,TRACKING_NUM,SHIPDATE) values (104024,121201,12,'UPS','1Z 2192501',to_date('22-FEB-18','DD-MON-RR'));
DBMS_OUTPUT.PUT_LINE('SHIPMENTS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SHIPMENTS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into SUPPLIER_MANU (SUPPLIER_MANU_ID,IS_ISO9000CERT,IS_SME_LEAN_CERT) values (121201,'Y','Y');
DBMS_OUTPUT.PUT_LINE('SUPPLIER_MANU ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIER_MANU REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_MANU
  WHERE SUPPLIER_MANU_ID = 121202;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into SUPPLIER_MANU (SUPPLIER_MANU_ID,IS_ISO9000CERT,IS_SME_LEAN_CERT) values (121202,'Y','Y');
DBMS_OUTPUT.PUT_LINE('SUPPLIER_MANU DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIER_MANU HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into SUPPLIER_WS (SUPPLIER_WS_ID,WHOLESALE_LICENSE,EIN) values (121202,'QW3456','24-456345');
DBMS_OUTPUT.PUT_LINE('SUPPLIER_WS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIER_WS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_WS
  WHERE SUPPLIER_WS_ID = 121201;
  IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into SUPPLIER_WS (SUPPLIER_WS_ID,WHOLESALE_LICENSE,EIN) values (121201,'QW3D456','24-4563D45');
DBMS_OUTPUT.PUT_LINE('SUPPLIER_WS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIER_WS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into SUPPLIERS (SUPPLIER_ID,SUPPLIER_NAME,MAIN_CONTACT,MAIN_PHONE,MAIN_EMAIL) values (921201,'Acme33 Supply Inc','Ange3lika Latufuipeka TUKU''A3HO','(4330)672-1234','alEatuf@acme.com');
DBMS_OUTPUT.PUT_LINE('SUPPLIERS ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIERS REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIERS
  WHERE SUPPLIER_ID = '121201'
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into SUPPLIERS (SUPPLIER_ID,SUPPLIER_NAME,MAIN_CONTACT,MAIN_PHONE,MAIN_EMAIL) values (121201,'OB Supply Inc','Angelika LAatufuipeka TUKU''AHO','(330)672-5234','alatuf2@acme.com');
DBMS_OUTPUT.PUT_LINE('SUPPLIERS DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('SUPPLIERS HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;
/*
BEGIN  
Insert into P_VACCINATION (DIN,PERSON_ID,VAC_DATE,LOCATION) values ('b-B-TY6-D:45','10002',to_date('14-OCT-09','DD-MON-RR'),'Primary Care Physician');
DBMS_OUTPUT.PUT_LINE('P_VACCINATION ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('P_VACCINATION REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		P_VACCINATION
  WHERE DIN = 'b-B-TY6-D:45' AND PERSON_ID = '10002' AND VAC_DATE = '13-OCT-09'
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into P_VACCINATION (DIN,PERSON_ID,VAC_DATE,LOCATION) values ('b-B-TY6-D:45','10002',to_date('13-OCT-09','DD-MON-RR'),'Primary Care Physician');
DBMS_OUTPUT.PUT_LINE('P_VACCINATION DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('P_VACCINATION HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

BEGIN  
Insert into P_VACCINE (DIN,VACCINE_NAME,TRADE_NAME,SPONSOR) values ('2G-q-5N6-1:S','Adenovirus Type 4 and Type 7 Vaccine, Live, Oral','No Trade Name','Barr Labs, Inc.');
DBMS_OUTPUT.PUT_LINE('P_VACCINE ACCEPTS APPROPRIATE INSERTS');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('P_VACCINE REJECTS APPROPRIATE INSERTS');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
END;
BEGIN  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		P_VACCINE
  WHERE DIN = '2G-C-5N6-1:S' 
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Primary Key Test Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into P_VACCINE (DIN,VACCINE_NAME,TRADE_NAME,SPONSOR) values ('2G-C-5N6-1:S','Adenovirus Type 7 Vaccine, Live, Oral','No Trade Name','Barr Labs, Inc.');
DBMS_OUTPUT.PUT_LINE('P_VACCINE DOES NOT SEEM TO HAVE A PRIMARY KEY SPECIFIED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('P_VACCINE HAS A PRIMARY KEY SPECIFIED');
END;
END IF;
END;

*/

--Check Foreign keys


BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING FOREIGN KEYS----------');
DBMS_OUTPUT.PUT_LINE('CHECKING ORDERS.CUSTOMER_ID references CUSTOMERS.CUSTOMER_ID...');
--BEGIN
--Insert into CUSTOMERS (ADDRESS_ID,STREET_ADDRESS,CITY,PROVINCE_ID,POSTAL_CODE) values ('50232','1501 Silver Berry Boulevard',' Nanty Glo','50017',' Y5X-9P2');
--EXCEPTION
--WHEN OTHERS THEN
-- ROLLBACK;
--DO NOTHING 
--END;  
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS, ORDERS
  WHERE ORDERS.CUSTOMER_ID = '200'
  AND CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE ORDERS SET CUSTOMER_ID = '50232' WHERE CUSTOMER_ID = '200';
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
end if;
END; 
ROLLBACK;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING ORDER_ITEMS.ORDER_ID references ORDERS.ORDER_ID...');
--BEGIN
--Insert into SUPPLIER_MANU (PERSON_ID,ADDRESS_ID,DATE_BEG,DATE_END) values ('10002','40225',to_date('12-AUG-90','DD-MON-RR'),null);
--EXCEPTION
--WHEN OTHERS THEN
-- ROLLBACK;
--DO NOTHING 
--END;  
SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDERS, ORDER_ITEMS
  WHERE ORDER_ITEMS.ORDER_ID = ORDERS.ORDER_ID AND ORDERS.ORDER_ID = 10;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE ORDER_ITEMS SET ORDER_ITEMS.ORDER_ID = -1 WHERE ORDER_ITEMS.ORDER_ID = 10;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING ORDER_ITEMS.PRODUCT_ID references PRODUCTS.PRODUCT_ID...');

SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDER_ITEMS, PRODUCTS
  WHERE ORDER_ITEMS.PRODUCT_ID = PRODUCTS.PRODUCT_ID AND PRODUCTS.PRODUCT_ID = 10
;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE ORDER_ITEMS SET PRODUCT_ID = -1 WHERE PRODUCT_ID = 10
;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;





BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING SHIPMENTS.LINE_ID references ORDER_ITEMS.LINE_ID...');

  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SHIPMENTS,ORDER_ITEMS
  WHERE SHIPMENTS.LINE_ID = ORDER_ITEMS.LINE_ID AND SHIPMENTS.LINE_ID =104024
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SHIPMENTS SET LINE_ID = -1 WHERE LINE_ID = 104024;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
end if;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING SHIPMENTS.SUPPLIER_ID references SUPPLIERS.SUPPLIER_ID...');

  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SHIPMENTS, SUPPLIERS
  WHERE SHIPMENTS.SUPPLIER_ID = SUPPLIERS.SUPPLIER_ID AND SUPPLIERS.SUPPLIER_ID = 121201 
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SHIPMENTS SET SUPPLIER_ID = -1 WHERE SUPPLIER_ID = 121201  ;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
end if;
END;


BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING SUPPLIER_MANU.SUPPLIER_MANU_ID references SUPPLIERS.SUPPLIER_ID...');

  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_MANU, SUPPLIERS
  WHERE SUPPLIER_MANU.SUPPLIER_MANU_ID = SUPPLIERS.SUPPLIER_ID AND SUPPLIERS.SUPPLIER_ID = 121202
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SUPPLIER_MANU SET SUPPLIER_MANU_ID = -1 WHERE SUPPLIER_MANU_ID = 121202  ;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
end if;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING SUPPLIER_WS.SUPPLIER_WS_ID references SUPPLIERS.SUPPLIER_ID...');

  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_WS, SUPPLIERS
  WHERE SUPPLIER_WS.SUPPLIER_WS_ID = SUPPLIERS.SUPPLIER_ID AND SUPPLIERS.SUPPLIER_ID = 121201
	;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SUPPLIER_WS SET SUPPLIER_WS_ID = -1 WHERE SUPPLIER_WS_ID = 121201  ;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
end if;
END;





BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING CHECK CONSTRAINTS----------');
DBMS_OUTPUT.PUT_LINE('CHECKING check constraint on CUSTOMERS.EMAIL_ADDRESS...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS
  WHERE CUSTOMER_ID = 1 
;
IF VARROWCOUNT = 0 THEN
   DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
   INCORRECTCOUNT := INCORRECTCOUNT + 1;
   DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
   BEGIN
   COUNT1 := 0;
   UPDATE CUSTOMERS SET EMAIL_ADDRESS = 'FF@EEE' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET EMAIL_ADDRESS = '@EEECDD' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET EMAIL_ADDRESS = 'CDSSS' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET EMAIL_ADDRESS = 'EEE@' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;

   DBMS_OUTPUT.PUT_LINE('    ....FAILED');
   INCORRECTCOUNT := INCORRECTCOUNT + 1;
   DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
   EXCEPTION 
   WHEN OTHERS THEN
      IF COUNT1 = 1 THEN
      DBMS_OUTPUT.PUT_LINE('    ....PASSED');
      ELSE
      INCORRECTCOUNT := INCORRECTCOUNT + 1;
      DBMS_OUTPUT.PUT_LINE('    ....FAILED');
      DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
      --DBMS_OUTPUT.PUT_LINE(COUNT1);
      END IF;
    END; 
   END IF;
COUNT1 := 0;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING check constraint on CUSTOMERS.FULL_NAME...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS
  WHERE CUSTOMER_ID = 1 
;
IF VARROWCOUNT = 0 THEN
   DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
   INCORRECTCOUNT := INCORRECTCOUNT + 1;
   DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
   BEGIN
   COUNT1 := 0;
   UPDATE CUSTOMERS SET FULL_NAME = 'FFRFGSFGS' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET FULL_NAME = '1' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET FULL_NAME = 'D' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;
   UPDATE CUSTOMERS SET FULL_NAME = 'H' WHERE CUSTOMER_ID = 1;
   COUNT1 := COUNT1 + 1;

   DBMS_OUTPUT.PUT_LINE('    ....FAILED');
   INCORRECTCOUNT := INCORRECTCOUNT + 1;
   DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
   EXCEPTION 
   WHEN OTHERS THEN
      IF COUNT1 = 1 THEN
      DBMS_OUTPUT.PUT_LINE('    ....PASSED');
      ELSE
      INCORRECTCOUNT := INCORRECTCOUNT + 1;
      DBMS_OUTPUT.PUT_LINE('    ....FAILED');
      DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
      --DBMS_OUTPUT.PUT_LINE(COUNT1);
      END IF;
    END; 
   END IF;
COUNT1 := 0;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING check constraint on SUPPLIER_MANU.IS_ISO9000CERT...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIER_MANU
  WHERE SUPPLIER_MANU_ID = 121202 
;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SUPPLIER_MANU SET IS_ISO9000CERT = 'Q' WHERE SUPPLIER_MANU_ID = 121202
;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
END;
END IF;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING check constraint on PRODUCTS.UNIT_PRICE...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		PRODUCTS
  WHERE PRODUCT_ID = 1  
;
IF VARROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE PRODUCTS SET UNIT_PRICE = 0.00 WHERE PRODUCT_ID = 1
;
DBMS_OUTPUT.PUT_LINE('    ....FAILED LOWER BOUND');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED LOWER BOUND');
END;
BEGIN
UPDATE PRODUCTS SET UNIT_PRICE = 10000.01 WHERE PRODUCT_ID = 1
;
DBMS_OUTPUT.PUT_LINE('    ....FAILED UPPER BOUND');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED UPPER BOUND');
end;
END IF;
END;


BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING UNIQUE CONSTRAINTS----------');
DBMS_OUTPUT.PUT_LINE('CHECKING UNIQUE CONSTRAINT FOR CUSTOMERS(EMAIL_ADDRESS)...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		CUSTOMERS
  WHERE CUSTOMER_ID = 1 OR CUSTOMER_ID = 40
  ;
IF VARROWCOUNT <> 2 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test records not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE CUSTOMERS SET EMAIL_ADDRESS = 'ernest.foster@internalmail' WHERE CUSTOMER_ID = 1;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING UNIQUE CONSTRAINT FOR SUPPLIERS(SUPPLIER_NAME)...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		SUPPLIERS
  WHERE SUPPLIER_ID = 121201 OR SUPPLIER_ID = 121210
  ;
IF VARROWCOUNT <> 2 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test records not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE SUPPLIERS SET SUPPLIER_NAME = 'Pluto Textiles' WHERE SUPPLIER_ID = 121201;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING UNIQUE CONSTRAINT FOR ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID)...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDER_ITEMS
  WHERE LINE_ID = 103832 OR LINE_ID = 103833
	;
IF VARROWCOUNT <> 2 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test records not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE ORDER_ITEMS SET LINE_ITEM_ID = 1 WHERE LINE_ID = 103833;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;

BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING UNIQUE CONSTRAINT FOR ORDER_ITEMS(PRODUCT_ID, ORDER_ID)...');
  SELECT	COUNT(*) INTO VARROWCOUNT
	FROM		ORDER_ITEMS
  WHERE LINE_ID = 103832 OR LINE_ID = 103833
	;
IF VARROWCOUNT <> 2 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test records not found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
UPDATE ORDER_ITEMS SET PRODUCT_ID = 25 WHERE LINE_ID = 103832;
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
end;
END IF;
END;



BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('----------CHECKING DEFAULT VALUES----------');
DBMS_OUTPUT.PUT_LINE('CHECKING DEFAULT VALUE FOR SUPPLIER_MANU.IS_ISO9000CERT...');
  SELECT	COUNT(*) INTO VARROWCOUNT
  FROM		SUPPLIER_MANU
  WHERE SUPPLIER_MANU_ID = 121201 
;
IF VARROWCOUNT <> 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into SUPPLIER_MANU (SUPPLIER_MANU_ID, IS_SME_LEAN_CERT) values (121201,'Y');
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....ERROR1');
END;
BEGIN
 BEGIN
  VARSTRING := 'Y';
  SELECT	IS_ISO9000CERT INTO VARSTRING
  FROM		SUPPLIER_MANU
  WHERE SUPPLIER_MANU_ID = 121201  
;
EXCEPTION 
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('    ....ERROR2');
 END;
IF VARSTRING <> 'N' THEN
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
END IF;
END;
END IF;
END;


BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING DEFAULT VALUE FOR ORDERS.ORDER_STATUS...');
  SELECT	COUNT(*) INTO VARROWCOUNT
  FROM		ORDERS
  WHERE ORDER_ID = 11111111 
;
IF VARROWCOUNT <> 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID) values (11111111,to_timestamp('03-MAR-18 09.30.59.972993000 AM','DD-MON-RR HH.MI.SSXFF AM'),126,1);
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....ERROR1');
END;
BEGIN
 BEGIN
  VARSTRING := 'EMPTY';
  SELECT	ORDER_STATUS INTO VARSTRING
	FROM		ORDERS
  WHERE ORDER_ID = '11111111'  
;
EXCEPTION 
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('    ....ERROR2');
 END;
IF (VARSTRING <> 'PROCESSING') OR VARSTRING = 'EMPTY' OR VARSTRING IS NULL THEN
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
END IF;
END;
END IF;
END;


BEGIN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('CHECKING DEFAULT VALUE FOR ORDER_ITEMS.QUANTITY...');
  SELECT	COUNT(*) INTO VARROWCOUNT
  FROM		ORDER_ITEMS
  WHERE LINE_ID = 1 
;
IF VARROWCOUNT <> 0 THEN
DBMS_OUTPUT.PUT_LINE('    ....Aborted - test record found');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
BEGIN
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,LINE_ID) values (5,22,19,14.34,1);
EXCEPTION 
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('    ....ERROR1');
END;
BEGIN
 BEGIN
  VARNUMBER := 5;
  SELECT	QUANTITY INTO VARNUMBER
  FROM		ORDER_ITEMS
  WHERE LINE_ID = 1 
;
EXCEPTION 
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('    ....ERROR2');
 END;
IF VARNUMBER<> 1 OR (VARNUMBER IS NULL) THEN
DBMS_OUTPUT.PUT_LINE('    ....FAILED');
INCORRECTCOUNT := INCORRECTCOUNT + 1;
DBMS_OUTPUT.PUT_LINE('##### NOTE ERROR ABOVE #####');
ELSE
DBMS_OUTPUT.PUT_LINE('    ....PASSED');
END IF;
END;
END IF;
END;

  ROLLBACK ;

BEGIN
	DBMS_OUTPUT.PUT_LINE('********************************************************************');
	DBMS_OUTPUT.PUT_LINE('********************************************************************');
	DBMS_OUTPUT.PUT_LINE('***  You have '||INCORRECTCOUNT||' errors that need to be fixed (see detail above)  ***');
    IF INCORRECTCOUNT = 0 THEN
    	DBMS_OUTPUT.PUT_LINE('***             C O N G R A T U L A T I O N S ! ! !              ***');
    	DBMS_OUTPUT.PUT_LINE('*** (Do not forget to submit your DDL statements on Blackboard!) ***');
    END IF;
	DBMS_OUTPUT.PUT_LINE('********************************************************************');
	DBMS_OUTPUT.PUT_LINE('********************************************************************');

END;

  RETURN;
END;


/*copyright 2015-2020 Alan Brandyberry*/