
-- LISTA 3 (A)
SELECT NMPRODUCT, NMSUPPLIER, VLPRICE,
VLPRICE-(VLPRICE*0.1) AS VLDESC,
VLPRICE-(VLPRICE*0.2) AS VLDESC2,
VLPRICE-(VLPRICE*0.3) AS VLDESC3  FROM PRODUCT P
INNER JOIN SUPPLIER S ON P.CDPRODUCT= S.CDSUPPLIER
WHERE (VLPRICE-(VLPRICE*0.1)) > 15
ORDER BY  NMPRODUCT, VLPRICE

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (B)
SELECT NMPRODUCT, NMSUPPLIER, VLPRICE,
VLPRICE * QTSTOCK AS VLTOTAL,
VLPRICE * (QTSTOCK*2) AS VLTOTAL2
FROM PRODUCT P
INNER JOIN SUPPLIER S ON P.CDPRODUCT = S.CDSUPPLIER

WHERE VLPRICE * QTSTOCK > 12000
ORDER BY  NMSUPPLIER, NMPRODUCT

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (C)
SELECT * FROM CUSTOMER
WHERE NMADRESS NOT LIKE 'NULL'
AND NMCUSTOMER LIKE 'J%'
ORDER BY NMCUSTOMER

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (D)

SELECT NMPRODUCT, VLPRICE, NMSUPPLIER FROM PRODUCT P 
INNER JOIN SUPPLIER S ON P.CDPRODUCT = S.CDSUPPLIER
WHERE NMSUPPLIER LIKE '%ica%'
ORDER BY NMSUPPLIER,VLPRICE

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (E)

SELECT NMSUPPLIER, IDFONE, NMPRODUCT, VLPRICE,QTSTOCK, (VLPRICE*QTSTOCK) AS VLTOTAL FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDPRODUCT
WHERE NMPRODUCT LIKE 'S%' AND VLPRICE > 50
ORDER BY NMSUPPLIER,VLPRICE

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (F)

SELECT
NMCUSTOMER, NMPRODUCT, DTREQUEST, DTDELIVER, QTAMOUNT, VLUNITARY,
(VLPRICE*QTSTOCK) AS VLTOTAL
FROM CUSTOMER C

INNER JOIN REQUEST R ON C.CDCUSTOMER = R.CDREQUEST
INNER JOIN PRODUCT P ON R.CDREQUEST = P.CDPRODUCT
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT

WHERE QTAMOUNT < 600
AND DTREQUEST BETWEEN '2003-08-01' AND '2003-08-31'
AND NMPRODUCT LIKE 'm%'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LISTA 2 (G)

SELECT NMCUSTOMER, NMPRODUCT, NMSUPPLIER, DTREQUEST, DTDELIVER, VLPRICE FROM CUSTOMER C
INNER JOIN PRODUCT P ON C.CDCUSTOMER = P.CDPRODUCT
INNER JOIN SUPPLIER S ON CDPRODUCT = S.CDSUPPLIER
INNER JOIN REQUEST R ON C.CDCUSTOMER = R.CDREQUEST

WHERE S.IDFONE LIKE '%(011)%' AND VLPRICE > 20
;





