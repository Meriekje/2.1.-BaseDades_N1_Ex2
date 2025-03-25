- Drinks sold - Girona
SELECT 
    e.first_name AS employee_name, 
    COUNT(o.id_order) AS total_orders
FROM orders o
JOIN employees e USING (id_employee)
WHERE e.first_name = 'Laura'  
GROUP BY e.first_name;

- Orders via Laura
SELECT 
    e.first_name AS employee_name, 
    COUNT(o.id_order) AS total_orders
FROM orders o
JOIN employees e USING (id_employee)
WHERE e.first_name = 'Laura'  
GROUP BY e.first_name;
