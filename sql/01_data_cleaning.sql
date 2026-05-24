WITH payments AS (
  SELECT 
    order_id,
    SUM(payment_value) AS total_payment
  FROM `sales_dataset.order_payments_dataset`
  GROUP BY order_id
),

base AS (
  SELECT
    c.customer_unique_id,
    s.order_id,
    s.order_delivered_customer_date,
    p.total_payment
  FROM `sales_dataset.orders_dataset` s
  JOIN `sales_dataset.customers_dataset` c
    ON s.customer_id = c.customer_id
  LEFT JOIN payments p
    ON s.order_id = p.order_id
  WHERE s.order_status = "delivered"
),

cutoff AS (
  SELECT MAX(order_delivered_customer_date) AS last_date
  FROM base
)

SELECT
  b.customer_unique_id,

  DATE_DIFF(
    (SELECT last_date FROM cutoff),
    MAX(b.order_delivered_customer_date),
    DAY
  ) AS recency,

  COUNT(DISTINCT b.order_id) AS frequency,

  SUM(b.total_payment) AS monetary

FROM base b
GROUP BY b.customer_unique_id
