
-- LISTA 7 (C)

DELETE FROM REQUEST 
WHERE VLTOTAL < 1000 AND 
CDREQUEST NOT IN (SELECT CDREQUEST FROM PRODUCTREQUEST) AND 
MONTH(DTREQUEST) = 6 AND YEAR(DTREQUEST) = 2003

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 7 (C)

UPDATE PRODUCT
SET PRODUCT.VLPRICE = (SELECT AVG(VLUNITARY) FROM PRODUCTREQUEST)
FROM PRODUCT P
INNER JOIN PRODUCTREQUEST PR ON PR.CDPRODUCT = P.CDPRODUCT
WHERE P.CDPRODUCT IN (SELECT CDPRODUCT FROM PRODUCTREQUEST 
GROUP BY CDPRODUCT
HAVING SUM(PRODUCTREQUEST.QTAMOUNT) < 800)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 7 (C)

INSERT INTO CUSTOMER (CDCUSTOMER,NMCUSTOMER,NMADRESS,IDFONE)
SELECT (SELECT MAX(CDCUSTOMER)FROM CUSTOMER) + CDSUPPLIER AS NEWCDCUSTOMER, CDSUPPLIER, NMSUPPLIER, IDFONE 
FROM SUPPLIER

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 7 (D)

UPDATE REQUEST
SET DTDELIVER = DTREQUEST + 30
WHERE ((DTREQUEST + 30) - (DTDELIVER)) < 10 AND REQUEST.VLTOTAL < 10000