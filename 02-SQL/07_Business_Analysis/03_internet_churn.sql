/* =========================================================
   FILE: 03_internet_churn.sql
   PURPOSE: Churn analysis by internet service
   ========================================================= */

USE telecom_churn;

SELECT
    internet_service,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY internet_service

ORDER BY churn_rate_pct DESC;