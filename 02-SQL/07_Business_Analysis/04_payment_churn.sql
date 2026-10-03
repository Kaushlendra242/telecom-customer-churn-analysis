/* =========================================================
   FILE: 04_payment_churn.sql
   PURPOSE: Churn analysis by payment method
   ========================================================= */

USE telecom_churn;

SELECT
    payment_method,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY payment_method

ORDER BY churn_rate_pct DESC;