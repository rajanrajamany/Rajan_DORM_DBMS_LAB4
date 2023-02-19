#
# Q7. 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
#
SELECT A.PRO_ID, A.PRO_NAME FROM product A, supplier_pricing C
WHERE 
A.PRO_ID = C.PRO_ID
AND 
C.PRICING_ID IN ( 
SELECT PRICING_ID FROM `order` WHERE ORD_DATE > '2021-10-05');
