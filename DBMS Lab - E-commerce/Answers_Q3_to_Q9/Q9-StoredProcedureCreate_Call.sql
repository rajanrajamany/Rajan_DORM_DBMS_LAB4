#
# Q9. 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
#           For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
#           If rating >2 print “Average Service” else print “Poor Service”.
#
DROP PROCEDURE IF EXISTS supplier_rating;
DELIMITER $$
CREATE PROCEDURE `supplier_rating` ()
BEGIN
	select t1.SUPP_ID ID, t1.SUPP_NAME Name, t1.rating, 
	CASE
			WHEN t1.rating >=5	THEN "EXCELLENT SERVICE"
			WHEN t1.rating >4	THEN "GOOD SERVICE"
			WHEN t1.rating >2	THEN "AVERAGE SERVICE"
			ELSE "POOR SERVICE"
		END TYPE_OF_SERVICE
	from
	(SELECT A.SUPP_ID, A.SUPP_NAME, sum(D.RAT_RATSTARS)/count(D.RAT_RATSTARS) rating
	FROM 
		supplier A, supplier_pricing B, `order` C, rating D 
	WHERE
			A.SUPP_ID = B.SUPP_ID
			AND B.PRICING_ID = C.PRICING_ID
			AND C.ORD_ID = D.ORD_ID
	GROUP BY
			A.SUPP_ID , A.SUPP_NAME
	) AS t1;
END$$
DELIMITER ;

call supplier_rating();