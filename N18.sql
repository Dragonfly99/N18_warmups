SELECT c.customer_id, country, SUM(order_details.unit_price) as total, RANK() OVER(partition by country Order By SUM(order_details.unit_price) desc) ranking
FROM customers as c
join orders
using(customer_id)
join order_details
using (order_id)
join products
using (product_id)
group by c.customer_id
limit 15;


SELECT c.customer_id, country, SUM(order_details.unit_price) as total, RANK() OVER(partition by country Order By SUM(order_details.unit_price) desc) ranking
FROM customers as c
join orders
using(customer_id)
join order_details
using (order_id)
join products
using (product_id)
where ranking in (1,2,3)
group by c.customer_id
limit 15;