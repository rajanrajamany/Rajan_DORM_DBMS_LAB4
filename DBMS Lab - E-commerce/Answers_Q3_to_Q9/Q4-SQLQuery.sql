#Q4. 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
#
SELECT c.cus_id, c.cus_name, p.pro_name, ord.ord_id, ord.ord_date
FROM product p, supplier_pricing sp, `order` ord, customer c
WHERE
p.PRO_ID = sp.PRO_ID
AND sp.PRICING_ID = ord.PRICING_ID
and ord.cus_id = c.cus_id
AND c.cus_id =2;