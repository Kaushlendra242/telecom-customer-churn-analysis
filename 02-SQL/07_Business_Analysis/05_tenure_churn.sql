/* =========================================================
   FILE: 05_tenure_churn.sql
   PURPOSE: Churn analysis by tenure cohort
   ========================================================= */

USE telecom_churn;

SELECT
    tenure_cohort,

    tenure_cohort_sort,

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct

FROM vw_customer_churn_analysis

GROUP BY
    tenure_cohort,
    tenure_cohort_sort

ORDER BY
    tenure_cohort_sort;