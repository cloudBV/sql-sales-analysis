-- 1. Total Revenue
SELECT ROUND(SUM(payment_value), 2) AS total_revenue 
FROM order_payments;

-- 2. Average Order Value (AOV)
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) AS order_totals;

-- 3. Top 10 Best-Selling Product Categories
SELECT 
    t.product_category_name_english AS category,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY items_sold DESC
LIMIT 10;

-- 4. Average Delivery Time by State (Top 10 slowest)
SELECT 
    c.customer_state,
    ROUND(AVG(EXTRACT(DAY FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))), 1) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 10;

-- 5. Average Review Score
SELECT ROUND(AVG(review_score), 2) AS average_review_score 
FROM order_reviews;

-- 6. Top 10 Sellers by Revenue
SELECT 
    s.seller_id,
    s.seller_state,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_state
ORDER BY total_revenue DESC
LIMIT 10;