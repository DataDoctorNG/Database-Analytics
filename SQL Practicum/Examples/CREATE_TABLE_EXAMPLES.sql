DROP TABLE P_DO_SITE;
DROP TABLE P_RECYCLING_ORG;


CREATE TABLE P_RECYCLING_ORG (	
ORG_ID CHAR(5 BYTE) NOT NULL, 
ORG_NAME VARCHAR2(50 BYTE) NOT NULL, 
ORG_STREET1 VARCHAR2(50 BYTE) NOT NULL, 
ORG_STREET2 VARCHAR2(50 BYTE) NOT NULL, 
ORG_CITY VARCHAR2(20 BYTE) DEFAULT 'San Diego' NOT NULL, 
ORG_STATE CHAR(2 BYTE) DEFAULT 'CA' NOT NULL, 
ORG_ZIP CHAR(5 BYTE) NOT NULL, 
DATE_ADDED DATE DEFAULT SYSDATE NOT NULL, 
CONTACT_LNAME VARCHAR2(50 BYTE) NULL, 
CONTACT_FNAME VARCHAR2(30 BYTE) NULL, 
CONTACT_EMAIL VARCHAR2(100 BYTE) NULL
)   ;
 
ALTER TABLE P_RECYCLING_ORG ADD CONSTRAINT P_RECYCLING_ORG_CHK1 CHECK (DATE_ADDED > '01-JAN-1998') ;

ALTER TABLE P_RECYCLING_ORG ADD CONSTRAINT P_RECYCLING_ORG_PK PRIMARY KEY (ORG_ID);

ALTER TABLE P_RECYCLING_ORG ADD CONSTRAINT P_RECYCLING_ORG_STATE_CHK CHECK (ORG_STATE IN ('CA','NV','AZ')) ;
 
ALTER TABLE P_RECYCLING_ORG ADD CONSTRAINT P_RECYCLING_ORG_UK1 UNIQUE (ORG_NAME, ORG_STREET1, ORG_CITY, ORG_STATE); 
 
 
   
CREATE TABLE P_DO_SITE (	
ORG_ID CHAR(5 BYTE) NOT NULL, 
SITE_NUM CHAR(3 BYTE) NOT NULL, 
GPS_LAT NUMBER(10,7) NOT NULL, 
GPS_LON NUMBER(10,7) NOT NULL, 
SITE_STREET1 VARCHAR2(50 BYTE) NULL, 
SITE_STREET2 VARCHAR2(50 BYTE) NULL, 
SITE_CITY VARCHAR2(20 BYTE) DEFAULT 'San Diego' NULL, 
SITE_STATE CHAR(2 BYTE) DEFAULT 'CA' NULL, 
SITE_ZIP CHAR(5 BYTE) NULL);

  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_CHK1 CHECK (GPS_LAT BETWEEN 32.5 AND 33) ;
 
  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_CHK2 CHECK (GPS_LON BETWEEN -117.3 AND -116.8);
 
  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_PK PRIMARY KEY (ORG_ID, SITE_NUM);
 
  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_UK1 UNIQUE (GPS_LAT, GPS_LON);
 
  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_UK2 UNIQUE (SITE_STREET1, SITE_CITY, SITE_STATE);
  
  ALTER TABLE P_DO_SITE ADD CONSTRAINT P_DO_SITE_RECYCLING_ORG_FK1 FOREIGN KEY (ORG_ID)
	  REFERENCES P_RECYCLING_ORG (ORG_ID);
 
  ALTER TABLE P_DO_SITE MODIFY (SITE_ZIP NOT NULL);