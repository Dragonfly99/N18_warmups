SELECT customers.customer_id, country, SUM(order_details.unit_price), RANK() OVER(partition by customers.customer_id) total
FROM customers
join orders
using(customer_id)
join order_details
using (order_id)
join products
using (product_id)
order by total desc
limit 5;