- Drinks sold - Girona
SELECT 
	COUNT(po.quantity) AS total_drinks_sold
FROM product_orders po
JOIN products p USING(id_product)
JOIN orders o USING(id_order)
JOIN shops s USING(id_shop)
JOIN locations l USING(id_town)
WHERE p.type = 'drink' AND l.name= 'Girona' ;


- Orders via Laura
SELECT 
    e.first_name AS employee_name, 
    COUNT(o.id_order) AS total_orders
FROM orders o
JOIN employees e USING (id_employee)
WHERE e.first_name = 'Laura'  
GROUP BY e.first_name;
