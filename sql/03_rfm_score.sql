CREATE OR REPLACE VIEW `rfmanalysis-496611.sales_dataset.rfm_score` 
AS

SELECT 
  *,
  NTILE(4) OVER(ORDER BY r_rank DESC) AS r_score,
  NTILE(4) OVER(ORDER BY f_rank DESC) AS f_score,
  NTILE(4) OVER(ORDER BY m_rank DESC) AS m_score

FROM `sales_dataset.rfm_metrics`
