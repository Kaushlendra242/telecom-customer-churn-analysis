/* =========================================================
   FILE: 01_overall_churn.sql
   PURPOSE: Overall customer and churn KPIs
   ========================================================= */

USE telecom_churn;


/* Total customers */

SELECT
    COUNT(*) AS total_customers
FROM vw_customer_churn_analysis;


/* Churned customers */

SELECT
    SUM(is_churned) AS churned_customers
FROM vw_customer_churn_analysis;


/* Retained customers */

SELECT
    SUM(
        CASE
            WHEN is_churned = 0 THEN 1
            ELSE 0
        END
    ) AS retained_customers
FROM vw_customer_churn_analysis;


/* Overall churn KPIs */

SELECT

    COUNT(*) AS total_customers,

    SUM(is_churned) AS churned_customers,

    COUNT(*) - SUM(is_churned) AS retained_customers,

    ROUND(
        100.0 * SUM(is_churned) / COUNT(*),
        2
    ) AS churn_rate_pct,

    ROUND(
        100.0 *
        (COUNT(*) - SUM(is_churned))
        / COUNT(*),
        2
    ) AS retention_rate_pct

FROM vw_customer_churn_analysis;


