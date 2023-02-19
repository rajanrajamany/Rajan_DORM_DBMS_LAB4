#
# Q6. 6)	Find the least expensive product from each category and print the table with category id, 
#           name, product name and price of the product
#
SELECT G.CAT_ID, G.CAT_NAME, E.PRO_NAME, G.PRICE FROM product E, supplier_pricing F , 
(SELECT A.CAT_ID, A.CAT_NAME, MIN(C.SUPP_PRICE) PRICE FROM category A, product B, supplier_pricing C 
WHERE
A.CAT_ID = B.CAT_ID
AND B.PRO_ID = C.PRO_ID
GROUP BY A.CAT_ID, A.CAT_NAME) G
WHERE
E.CAT_ID = G.CAT_ID
AND E.PRO_ID = F.PRO_ID
AND G.PRICE = F.SUPP_PRICE
order by CAT_ID;
