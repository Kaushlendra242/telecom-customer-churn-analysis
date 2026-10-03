/* =========================================================
   FILE: 06_tech_support_churn.sql
   PURPOSE: Churn analysis by tech support
   ========================================================= */

USE telecom_churn;

SELECT
    tech_support,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY tech_support

ORDER BY churn_rate_pct DESC;