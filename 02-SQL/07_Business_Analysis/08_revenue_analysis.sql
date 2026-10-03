/* =========================================================
   FILE: 08_revenue_analysis.sql
   PURPOSE:
   Revenue exposure and customer value analysis
   ========================================================= */

USE telecom_churn;


/* -----------------------------------------
   1. Total monthly revenue
   ----------------------------------------- */

SELECT
    ROUND(
        SUM(monthly_charges),
        2
    ) AS total_monthly_revenue

FROM vw_customer_churn_analysis;


/* -----------------------------------------
   2. Monthly revenue from churned customers
   ----------------------------------------- */

SELECT
    ROUND(
        SUM(
            CASE
                WHEN is_churned = 1
                THEN monthly_charges
                ELSE 0
            END
        ),
        2
    ) AS churned_monthly_revenue

FROM vw_customer_churn_analysis;


/* -----------------------------------------
   3. Revenue at risk %
   ----------------------------------------- */

SELECT

    ROUND(
        SUM(
            CASE
                WHEN is_churned = 1
                THEN monthly_charges
                ELSE 0
            END
        ),
        2
    ) AS churned_monthly_revenue,

    ROUND(
        SUM(monthly_charges),
        2
    ) AS total_monthly_revenue,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN is_churned = 1
                THEN monthly_charges
                ELSE 0
            END
        )
        / SUM(monthly_charges),
        2
    ) AS revenue_at_risk_pct

FROM vw_customer_churn_analysis;


/* -----------------------------------------
   4. Monthly revenue lost by tenure cohort
   ----------------------------------------- */

SELECT

    tenure_cohort,

    tenure_cohort_sort,

    ROUND(
        SUM(
            CASE
                WHEN is_churned = 1
                THEN monthly_charges
                ELSE 0
            END
        ),
        2
    ) AS monthly_revenue_lost

FROM vw_customer_churn_analysis

GROUP BY
    tenure_cohort,
    tenure_cohort_sort

ORDER BY
    tenure_cohort_sort;