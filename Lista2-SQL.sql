-- LISTA 2 (A)
SELECT NMCUSTOMER, IDFONE FROM CUSTOMER
WHERE IDFONE LIKE '4%'
;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (B)

SELECT * FROM CUSTOMER
WHERE IDFONE = NULL

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (C)
SELECT * FROM SUPPLIER
WHERE LEN(IDFONE)<7

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (D)

SELECT NMPRODUCT,QTSTOCK,VLPRICE-(VLPRICE*0.1) AS VLPRICE FROM PRODUCT
WHERE QTSTOCK>2000

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (E)
SELECT NMPRODUCT,VLPRICE FROM PRODUCT
WHERE VLPRICE BETWEEN 10 AND 20;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (F)
SELECT NMPRODUCT, VLPRICE,QTSTOCK, VLPRICE*QTSTOCK AS TOTALSTOCK FROM PRODUCT
WHERE VLPRICE > 50;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (G)

SELECT NMPRODUCT, NMSUPPLIER, IDFONE,VLPRICE, QTSTOCK FROM PRODUCT P
INNER JOIN SUPPLIER S ON P.CDPRODUCT = S.CDSUPPLIER
WHERE VLPRICE>20 AND QTSTOCK>1500
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (H)

SELECT NMCUSTOMER, DTREQUEST,VLTOTAL,DTREQUEST FROM REQUEST R
INNER JOIN CUSTOMER C ON R.CDREQUEST = C.CDCUSTOMER
WHERE DTREQUEST BETWEEN '2003-06-01' AND '2003-07-31'
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (I)

SELECT NMCUSTOMER, NMPRODUCT, DTREQUEST, QTAMOUNT, VLUNITARY, VLTOTAL FROM CUSTOMER C
INNER JOIN REQUEST R ON C.CDCUSTOMER= R.CDREQUEST
INNER JOIN PRODUCT P ON R.CDREQUEST= P.CDPRODUCT
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT= PR.CDPRODUCT

WHERE QTAMOUNT>500
;



