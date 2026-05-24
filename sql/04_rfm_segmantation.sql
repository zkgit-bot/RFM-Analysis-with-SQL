CREATE OR REPLACE TABLE `rfmanalysis-496611.sales_dataset.rfm_segments_final`
AS

SELECT 
  customer_unique_id AS customer_id,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) AS rfm_total_score,
  CASE
    WHEN (r_score + f_score + m_score) >= 12 THEN "Top customer"
    WHEN (r_score + f_score + m_score) >= 9 THEN "Loyal customer"
    WHEN (r_score + f_score + m_score) >= 4 THEN "At-risk customer"
    ELSE "Lost/Inactive"
  END AS rfm_segment

  FROM `sales_dataset.rfm_score`
