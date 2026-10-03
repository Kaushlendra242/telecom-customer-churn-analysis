/* =========================================================
   FILE: 02_contract_churn.sql
   PURPOSE: Churn analysis by contract type
   ========================================================= */
   
USE telecom_churn;

SELECT
    contract_type,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    COUNT(*) - SUM(is_churned) AS retained_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY contract_type

ORDER BY churn_rate_pct DESC;