CREATE OR REPLACE VIEW `rfmanalysis-496611.sales_dataset.rfm_metrics` 
AS

SELECT 
  
  *,
  ROW_NUMBER() OVER(ORDER BY recency ASC) AS r_rank,
  ROW_NUMBER() OVER(ORDER BY frequency DESC) AS f_rank,
  ROW_NUMBER() OVER(ORDER BY monetary DESC) AS m_rank

FROM `sales_dataset.rfm_data`

WHERE monetary IS NOT NULL
  AND recency IS NOT NULL
