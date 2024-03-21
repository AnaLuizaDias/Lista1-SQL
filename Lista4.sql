SELECT DISTINCT NMPRODUCT  FROM PRODUCT P
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT

SELECT NMPRODUCT  FROM PRODUCT P
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT
GROUP BY NMPRODUCT

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (B)

SELECT NMPRODUCT, COUNT(PR.CDPRODUCT) AS VEZESPED, SUM(PR.QTAMOUNT) AS QTTOTALPED FROM PRODUCT P
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT
GROUP BY NMPRODUCT


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (C)

SELECT NMSUPPLIER, SUM(QTSTOCK) AS TOTALSTOCK, AVG(VLPRICE) AS MEDIA, COUNT(CDPRODUCT) AS PRODFORNECIDO FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
GROUP BY NMSUPPLIER

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (D)

SELECT NMCUSTOMER, IDFONE, MAX(VLTOTAL) AS VLMAX, MIN(VLTOTAL) AS VLMIN, SUM(VLTOTAL) AS TOTALP, AVG(VLTOTAL) AS MEDIA
FROM CUSTOMER C
INNER JOIN REQUEST R ON C.CDCUSTOMER=R.CDCUSTOMER
GROUP BY NMCUSTOMER, IDFONE

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (E)

SELECT DTREQUEST, NMCUSTOMER, 
COUNT(DISTINCT(CDPRODUCT))AS QTPED,
SUM(QTAMOUNT * VLUNITARY) AS TOTALPED,
AVG(QTAMOUNT * VLUNITARY) AS MEDIAPED
FROM REQUEST R
INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
GROUP BY C.NMCUSTOMER, R.DTREQUEST 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (F)

SELECT NMSUPPLIER, COUNT(CDPRODUCT) AS QTPRODFOR
FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
GROUP BY NMSUPPLIER
HAVING COUNT(P.CDPRODUCT) > 1

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (G)

SELECT NMPRODUCT, COUNT(CDREQUEST) AS VEZPED, SUM(QTAMOUNT) AS QTPED
FROM PRODUCTREQUEST PR INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT
GROUP BY NMPRODUCT
HAVING COUNT(CDREQUEST) < 2

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 4 (H)


SELECT NMCUSTOMER, NMPRODUCT, (QTAMOUNT * VLUNITARY) AS VLG, COUNT(DISTINCT(PR.CDPRODUCT)) AS VEZPED, NMSUPPLIER
FROM CUSTOMER C

INNER JOIN REQUEST R ON C.CDCUSTOMER = R.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT
INNER JOIN SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER

WHERE (QTAMOUNT * VLUNITARY) > 1000
GROUP BY NMCUSTOMER, NMPRODUCT, NMSUPPLIER, QTAMOUNT, VLUNITARY
ORDER BY NMCUSTOMER, NMPRODUCT
