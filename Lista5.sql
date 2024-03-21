--LISTA 5 (A)

SELECT NMPRODUCT, COUNT(PR.CDPRODUCT) AS QTVENDIDO FROM PRODUCT P
LEFT JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT
GROUP BY NMPRODUCT

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (B)
SELECT NMSUPPLIER, COUNT(P.CDPRODUCT) AS PRODFORNECIDO FROM SUPPLIER S
LEFT JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
GROUP BY NMSUPPLIER

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (C)

SELECT NMSUPPLIER,NMPRODUCT, COUNT(PR.QTAMOUNT) AS TOTALVENDIDO FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT

GROUP BY NMSUPPLIER, NMPRODUCT WITH ROLLUP

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (D)

SELECT NMCUSTOMER, NMPRODUCT, SUM(VLPRICE) AS TOTALGASTO FROM CUSTOMER C
INNER JOIN REQUEST R ON C.CDCUSTOMER = R.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT

GROUP BY NMCUSTOMER, NMPRODUCT WITH ROLLUP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (E)

SELECT NMCUSTOMER, IDFONE FROM CUSTOMER C
LEFT JOIN REQUEST R ON C.CDCUSTOMER = R.CDCUSTOMER
WHERE R.CDREQUEST IS NULL

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (F)

SELECT NMSUPPLIER, IDFONE FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
WHERE NMPRODUCT LIKE '%leite em po%' OR NMPRODUCT LIKE '%agua mineral%'

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LISTA 5 (G)

SELECT P.NMPRODUCT ,S.NMSUPPLIER FROM SUPPLIER S
INNER JOIN PRODUCT P ON S.CDSUPPLIER = P.CDSUPPLIER
INNER JOIN PRODUCTREQUEST PR ON P.CDPRODUCT = PR.CDPRODUCT
GROUP BY P.NMPRODUCT, S.NMSUPPLIER
HAVING COUNT(PR.CDREQUEST) > 3












