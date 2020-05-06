/*
THE FOLLOWING COMMANDS ARE DESIGNED TO WORK WITH THE VIEW RIDGE GALLERY 
DATABASE WITH ORIGINAL DATA RECORDS
*/

/* 
Try updating the CustomerId field
of the TRANS table.  Are the values constrained by anything?
*/
UPDATE TRANS
SET CUSTOMERID = 1001
WHERE TRANSACTIONID = 126;

UPDATE TRANS
SET CUSTOMERID = NULL 
WHERE TRANSACTIONID = 126;

/*
Now try to run the following update.  What error does it give you? Why?
*/
UPDATE TRANS
SET CUSTOMERID = 2001
WHERE TRANSACTIONID = 126;

UPDATE TRANS
SET CUSTOMERID = NULL 
WHERE TRANSACTIONID = 126;

/*
Drop the constraint.
*/
ALTER TABLE TRANS DROP CONSTRAINT TRANSCUSTOMERFK;

/*
Try the update again.
*/
UPDATE TRANS
SET CUSTOMERID = 2001
WHERE TRANSACTIONID = 126;

/*
Try to add the constraint back.
*/

ALTER TABLE TRANS ADD 
CONSTRAINT TRANSCUSTOMERFK FOREIGN KEY (CUSTOMERID) 
REFERENCES CUSTOMER(CUSTOMERID);

/*
Ooops - forgot we left the violation of referential integrity in
*/

UPDATE TRANS
SET CUSTOMERID = NULL 
WHERE TRANSACTIONID = 126;

ALTER TABLE TRANS ADD 
CONSTRAINT TRANSCUSTOMERFK FOREIGN KEY (CUSTOMERID) 
REFERENCES CUSTOMER(CUSTOMERID);

/*
Now let's try to add a check constraint to make sure that all
dates entered into DATESOLD are on or after January 1st, 2005
*/
/*
First check to see if it is constrained already, try to change a
value to December 15, 2004 (should be allowed if not constrained).
*/
UPDATE TRANS
SET DATESOLD = '15-DEC-2004' /*This is the Oracle Date Default format */ 
WHERE TRANSACTIONID = 126;
/*
hmmm, something else is constraining this.  Lets go look at that constraint
...
It seems this is already constrained by the VALIDTRANSDATE constraint so that 
no DATESOLD can be before the DATEACQUIRED (makes sense).  Looking at the data 
now, all of the DATEACQUIRED values are after Jan 1, 2005 so all of the DATESOLDS
must be as well.  Do we still need to add the constraint?
Our new constraint is REDUNDANT for the DATA in the sample database but if a
record could possibly be entered where the VALIDTRANSDATE would be met but it 
would violate our new constraint then we MUST add it anyway.  
What if DATEACQUIRED = Jan 1, 2003 and DATESOLD = Jan 29, 2003?
So, let's add the constraint:
*/
ALTER TABLE TRANS ADD 
CONSTRAINT DATESOLD_CHK CHECK (DATESOLD >= '01-JAN-2005'); 

/* 
Let's confirm the constraint is there and try to show it working
*/
INSERT INTO TRANS VALUES (255, '01-JAN-2004', 1, '29-JAN-2004', 2, 2, 1001, 596);

/*CONSTRAINT IS PARTIALLY VALIDATED BY THE ERROR*/

/*Now would be a good time to take a look at Oracle Dates and Times in the 
Oracle--> Miscellaneous Folder.  This discusses how to use non-standard formats
and how to read/write dates in any format.  This also gives us the ability
to enter TIME values in and to write constraints pertaining to specific 
times rather than dates.*/


