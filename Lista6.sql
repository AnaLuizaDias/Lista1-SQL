-- LISTA 6.1 (A)

DELETE FROM CUSTOMER WHERE CDCUSTOMER NOT IN (SELECT DISTINCT CDCUSTOMER FROM REQUEST)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (B)

DELETE FROM SUPPLIER  WHERE CDSUPPLIER NOT IN (SELECT DISTINCT CDSUPPLIER FROM PRODUCT)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (C)

UPDATE PRODUCTREQUEST
SET	PRODUCTREQUEST.VLUNITARY = PRODUCT.VLPRICE   -- SET COLUMNNAME = NEWVALUE
FROM PRODUCTREQUEST
INNER JOIN PRODUCT ON PRODUCTREQUEST.CDPRODUCT = PRODUCT.CDPRODUCT

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (D)

ALTER TABLE SUPPLIER
ADD DSSTATUS
VARCHAR(10)
SELECT * FROM SUPPLIER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (E)

UPDATE SUPPLIER
SET DSSTATUS = 'INATIVO'
FROM SUPPLIER
WHERE CDSUPPLIER NOT IN(SELECT DISTINCT CDSUPPLIER FROM PRODUCT)

SELECT * FROM SUPPLIER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (F)

UPDATE CUSTOMER
SET NMADRESS = 'DESCONHECIDO'
FROM CUSTOMER
WHERE NMADRESS IS NULL

SELECT * FROM CUSTOMER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.1 (G)

INSERT INTO PRODUCTREQUEST(CDREQUEST, CDPRODUCT, QTAMOUNT,VLUNITARY) 
SELECT PR.CDREQUEST, PR.CDPRODUCT, 10, P.VLPRICE
FROM PRODUCTREQUEST PR
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.2 (A)

SELECT NMCUSTOMER, NMPRODUCT, COUNT(QTAMOUNT) AS PRODCOMP, SUM(QTAMOUNT) AS QTTOTAL, SUM(VLUNITARY * QTAMOUNT) AS VLTOTALPROD

FROM PRODUCT P
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT
INNER JOIN REQUEST R ON PR.CDREQUEST = R.CDREQUEST
INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
GROUP BY  NMPRODUCT, NMCUSTOMER


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.2 (B)

SELECT NMCUSTOMER,
COUNT(CDREQUEST) AS NUMPED,
SUM(VLTOTAL) AS TOTALCUSTOMER
FROM CUSTOMER C
INNER JOIN REQUEST R ON C.CDCUSTOMER = R.CDCUSTOMER

WHERE DTREQUEST BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY NMCUSTOMER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.2 (C)

SELECT NMSUPPLIER, IDFONE, NMPRODUCT, VLPRICE, QTSTOCK
FROM SUPPLIER S
LEFT JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 6.2 (D)

SELECT NMCUSTOMER, DTREQUEST, VLTOTAL
FROM CUSTOMER C
LEFT JOIN REQUEST R ON C.CDCUSTOMER = R.CDCUSTOMER
