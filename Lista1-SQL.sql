-- LISTA 1 (A)

CREATE TABLE PRODUCTREQUEST(
	QT_AMOUNT INT ,
	VL_UNITARY DECIMAL 
);

CREATE TABLE REQUEST(
	CD_REQUEST INT IDENTITY(1,1), 
	DT_REQUEST DATE, 
	DT_DELIVER DATE, 
	VL_TOTAL DECIMAL

);

CREATE TABLE CUSTOMER(
	CD_CUSTOMER INT IDENTITY(1,1), 
	NM_CUSTOMER VARCHAR(100) , 
	NR_FONE NUMERIC(12),
	DS_ADRESS VARCHAR(150) 
);

CREATE TABLE PRODUCT(
	CD_PRODUCT INT IDENTITY(1,1), 
	NM_PRODUCT VARCHAR(100), 
	VL_PRICE DECIMAL, 
	QT_STOCK INT,
);

CREATE TABLE SUPPLIER(
	CD_SUPPLIER INT IDENTITY(1,1), 
	NM_SUPPLIER VARCHAR(100),
	NR_FONE NUMERIC
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ADC NOTNULL

ALTER TABLE CUSTOMER
ALTER COLUMN NM_CUSTOMER VARCHAR(100) NOT NULL;
ALTER TABLE CUSTOMER
ALTER COLUMN NR_FONE NUMERIC(12) NOT NULL;
ALTER TABLE CUSTOMER
ALTER COLUMN DS_ADRESS VARCHAR(100) NOT NULL;


ALTER TABLE PRODUCT
ALTER COLUMN NM_PRODUCT VARCHAR(100) NOT NULL;
ALTER TABLE PRODUCT
ALTER COLUMN VL_PRICE DECIMAL NOT NULL;
ALTER TABLE PRODUCT
ALTER COLUMN QT_STOCK INT NOT NULL;


ALTER TABLE REQUEST
ALTER COLUMN DT_REQUEST DATE NOT NULL;
ALTER TABLE REQUEST
ALTER COLUMN DT_DELIVER DATE NOT NULL;
ALTER TABLE REQUEST
ALTER COLUMN VL_TOTAL DECIMAL NOT NULL;

ALTER TABLE SUPPLIER
ALTER COLUMN NM_SUPPLIER VARCHAR(100) NOT NULL;
ALTER TABLE SUPPLIER
ALTER COLUMN NR_FONE NUMERIC(12) NOT NULL;

ALTER TABLE PRODUCTREQUEST
ALTER COLUMN QT_AMOUNT INT NOT NULL;
ALTER TABLE PRODUCTREQUEST
ALTER COLUMN VL_UNITARY INT NOT NULL;


--------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (B)

-- ADC CHAVE PRIMARIA

ALTER TABLE CUSTOMER
ADD PRIMARY KEY (CD_CUSTOMER);

ALTER TABLE SUPPLIER
ADD PRIMARY KEY (CD_SUPPLIER);

ALTER TABLE REQUEST
ADD PRIMARY KEY (CD_REQUEST);

ALTER TABLE PRODUCT
ADD PRIMARY KEY (CD_PRODUCT);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (C)

ALTER TABLE PRODUCT
	ADD CD_SUPPLIER INT
	CONSTRAINT FK_SUPPLIER
	FOREIGN KEY (CD_SUPPLIER)
	REFERENCES SUPPLIER(CD_SUPPLIER)
;

ALTER TABLE REQUEST
	ADD CD_CUSTOMER INT
	CONSTRAINT FK_CUSTOMER
	FOREIGN KEY (CD_CUSTOMER)
	REFERENCES CUSTOMER(CD_CUSTOMER)
;

ALTER TABLE PRODUCTREQUEST
	ADD CD_REQUEST INT
	CONSTRAINT FK_REQUEST
	FOREIGN KEY (CD_REQUEST)
	REFERENCES REQUEST(CD_REQUEST)
;

ALTER TABLE PRODUCTREQUEST
	ADD CD_PRODUCT INT
	CONSTRAINT FK_PRODUCT
	FOREIGN KEY (CD_PRODUCT)
	REFERENCES PRODUCT(CD_PRODUCT)
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (D-E)
CREATE INDEX INDEX_PRODUCT ON PRODUCT (CD_SUPPLIER);
CREATE INDEX INDEX_REQUEST ON REQUEST (CD_CUSTOMER);

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (F)
ALTER TABLE SUPPLIER
ADD SP_ADDRESS VARCHAR(150) NOT NULL;
SELECT * FROM SUPPLIER

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (G)
INSERT INTO CUSTOMER VALUES ( 'Fabiano', 99879375 , 'Rua Tijucas, 110, Centro,Joinville - S.C')
SELECT * FROM CUSTOMER

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (H)

INSERT INTO REQUEST VALUES ( '2008-01-31' , '2008-02-05', 54.00, 1)

SELECT
R.DT_REQUEST,
R.DT_DELIVER,
R.VL_TOTAL,
C.NM_CUSTOMER

FROM REQUEST R
INNER JOIN CUSTOMER C ON R.CD_REQUEST = C.CD_CUSTOMER;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (I)
UPDATE CUSTOMER
SET NR_FONE = 99012567
WHERE CD_CUSTOMER = 1;

SELECT * FROM CUSTOMER

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (J)

DELETE FROM REQUEST WHERE CD_REQUEST=1;
DELETE FROM CUSTOMER WHERE CD_CUSTOMER=1;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 1 (K)

DROP TABLE PRODUCTREQUEST
DROP TABLE REQUEST
DROP TABLE PRODUCT
DROP TABLE CUSTOMER
DROP TABLE SUPPLIER

