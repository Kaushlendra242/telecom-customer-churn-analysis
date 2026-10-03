/* =========================================================
   FILE: 07_online_backup_churn.sql
   PURPOSE: Churn analysis by online backup
   ========================================================= */

USE telecom_churn;

SELECT
    online_backup,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY online_backup

ORDER BY churn_rate_pct DESC;