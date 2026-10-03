/* =========================================================
   FILE: 03_null_check.sql
   PURPOSE: Check NULL and blank values
   ========================================================= */

USE telecom_churn;

SELECT
    COUNT(*) AS total_rows,

    SUM(
        CASE
            WHEN customer_id IS NULL
                 OR TRIM(customer_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_customerID,

    SUM(
        CASE
            WHEN gender IS NULL
                 OR TRIM(gender) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_gender,

    SUM(
        CASE
            WHEN tenure IS NULL
                 OR TRIM(tenure) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_tenure,

    SUM(
        CASE
            WHEN monthly_charges IS NULL
                 OR TRIM(monthly_charges) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_monthly_charges,

    SUM(
        CASE
            WHEN total_charges IS NULL
                 OR TRIM(total_charges) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_total_charges,

    SUM(
        CASE
            WHEN churn_status IS NULL
                 OR TRIM(churn_status) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_churn

FROM customer_churn_raw;
