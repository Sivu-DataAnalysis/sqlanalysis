CREATE DATABASE Spend_Analysis;

SELECT * FROM spend;

UPDATE spend
SET PurchaseDate = STR_TO_DATE(PuchaseDate,'%Y/%d/%m');

ALTER TABLE spend
ADD COLUMN Transaction_ID VARCHAR(255) UNIQUE PRIMARY KEY;

SELECT TransactionID,COUNT(TransactionID) AS Count FROM spend GROUP BY TransactionID HAVING Count > 1;

SELECT Category,Quantity,ROUND(AVG(Quantity) OVER(PARTITION BY Category ORDER BY Quantity DESC), 2) AS Avg_Quantity FROM spend;

SELECT ItemName,Category FROM spend WHERE Quantity >15;

SELECT Category,ROUND(SUM(UnitPrice), 2) AS Total_Expenditure FROM spend GROUP BY Category ORDER BY Total_Expenditure DESC;

SELECT Category,ROUND(SUM(TotalCost), 2) AS Total_Expenditure FROM spend GROUP BY Category ORDER BY Total_Expenditure DESC;

SELECT ItemName,Category, Max(TotalCost) FROM spend GROUP BY ItemName,Category HAVING Category ='Software';

SELECT ItemName,Category,MAX(Quantity),ROUND(SUM(TotalCost), 2) AS Total_Expenditure from spend GROUP BY ItemName,Category;

SELECT Category,Supplier,ROUND(SUM(TotalCost), 2) AS Total_Expenditure FROM spend GROUP BY Category,Supplier ORDER BY Total_Expenditure DESC;

SELECT Buyer,ItemName,Quantity,TotalCost FROM spend WHERE Buyer LIKE 's%';