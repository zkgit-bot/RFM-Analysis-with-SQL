# Customer Segmentation Using RFM Analysis (SQL + PowerBI)

## Project Overview
This project analyzes customer purchasing behavior using RFM (Recency, Frequency, Monetary) analysis to identify high-value and at-risk customer segments.

## Business Problem
The goal is to understand customer purchasing behavior and identify which segments generate the most revenue and which customers are at risk of churn.

## Dataset
Source: Kaggle — Brazilian E-Commerce Public Dataset by Olist

Key tables:
- orders_dataset  
- order_payments_dataset  
- customers_dataset  

## Explanation
RFM (Recency, Frequency, Monetary) analysis is a customer segmentation method that is used to evaluate customer behavior based on:

- Recency — how recently a customer made their last purchase  
- Frequency — how often a customer makes purchases  
- Monetary — how much money a customer spends  

## Methodology
- Calculated Recency, Frequency, and Monetary values using SQL  
- Recency is calculated based on a reference date defined as the latest order date in the dataset  
- Scored customers using quantile-based ranking  
- Segmented customers into RFM groups  
- Visualized insights in Power BI  

## Key insides

1) During the analysis, I identified that Frequency is not a suitable metric for this dataset. Over ~90% of customers made only one purchase, resulting in extremely low variability of this feature. Because of this, segmentation using SQL NTILE() on Frequency does not provide meaningful differentiation between customer groups. To ensure the analysis remains informative and actionable, I decided to focus on Recency and Monetary (RM segmentation), which better capture customer behavior and value distribution in this dataset.  

2) The bar chart shows that the largest share of total revenue comes from the At-Risk customer segment. Although this group has relatively low average monetary value per customer, it represents the largest portion of the customer base, which drives its overall revenue contribution. However, this segment also has a very high average recency (~340 days), indicating that most of these customers have not made a purchase for a long time and are unlikely to return without intervention.  

3) The two largest customer groups by Recency are those within the 0–50 days and 100–150 days ranges. These bins contain a significant share of Top and Loyal customers, indicating that a large portion of high-value customers are either recently active or still within a recoverable inactivity window. This highlights the importance of these segments, as they represent both current active revenue drivers and customers with potential for re-engagement.  
