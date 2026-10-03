/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS

   FILE: view_customer_risk_analysis.sql

   PURPOSE:
   Create a customer-level rule-based churn risk view.

   IMPORTANT:
   This is a BUSINESS RULE risk score.
   It is NOT a machine-learning prediction.
   ========================================================= */

USE telecom_churn;

DROP VIEW IF EXISTS vw_customer_churn_analysis;


/* =========================================================
   CREATE CUSTOMER RISK VIEW
   ========================================================= */

CREATE VIEW vw_customer_churn_analysis AS

SELECT

    customer_id,

    gender,

    senior_citizen,

    partner,

    dependents,

    tenure,
    
        /* -----------------------------
       Tenure cohort
       ----------------------------- */

    CASE
        WHEN tenure BETWEEN 0 AND 12
            THEN '0-12 Months'

        WHEN tenure BETWEEN 13 AND 24
            THEN '13-24 Months'

        WHEN tenure BETWEEN 25 AND 48
            THEN '25-48 Months'

        ELSE 'Over 48 Months'
    END AS tenure_cohort,


    /* -----------------------------
       Sort order for tenure cohort
       ----------------------------- */

    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN 1
        WHEN tenure BETWEEN 13 AND 24 THEN 2
        WHEN tenure BETWEEN 25 AND 48 THEN 3
        ELSE 4
    END AS tenure_cohort_sort,


    contract_type,

    internet_service,

    online_security,

    online_backup,

    device_protection,

    tech_support,

    payment_method,

    monthly_charges,

    total_charges,

    churn_status,
       /* -----------------------------
       Binary churn flag
       ----------------------------- */

    CASE
        WHEN churn_status = 'Yes' THEN 1
        ELSE 0
    END AS is_churned,


    /* =====================================================
       RISK SCORE
       ===================================================== */

    (
        /* Month-to-month contract */
        CASE
            WHEN contract_type = 'Month-to-month'
            THEN 3
            ELSE 0
        END

        +

        /* Short tenure */
        CASE
            WHEN tenure <= 12
            THEN 2
            WHEN tenure <= 24
            THEN 1
            ELSE 0
        END

        +

        /* Fiber optic */
        CASE
            WHEN internet_service = 'Fiber optic'
            THEN 2
            ELSE 0
        END

        +

        /* No online security */
        CASE
            WHEN online_security = 'No'
            THEN 1
            ELSE 0
        END

        +

        /* No tech support */
        CASE
            WHEN tech_support = 'No'
            THEN 1
            ELSE 0
        END

        +

        /* Electronic check */
        CASE
            WHEN payment_method = 'Electronic check'
            THEN 2
            ELSE 0
        END

        +

        /* Higher monthly charges */
        CASE
            WHEN monthly_charges >= 80
            THEN 1
            ELSE 0
        END
    ) AS risk_score,


    /* =====================================================
       RISK CATEGORY
       ===================================================== */

    CASE

        WHEN
        (
            CASE
                WHEN contract_type = 'Month-to-month'
                THEN 3 ELSE 0
            END

            +

            CASE
                WHEN tenure <= 12
                THEN 2
                WHEN tenure <= 24
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN internet_service = 'Fiber optic'
                THEN 2 ELSE 0
            END

            +

            CASE
                WHEN online_security = 'No'
                THEN 1 ELSE 0
            END

            +

            CASE
                WHEN tech_support = 'No'
                THEN 1 ELSE 0
            END

            +

            CASE
                WHEN payment_method = 'Electronic check'
                THEN 2 ELSE 0
            END

            +

            CASE
                WHEN monthly_charges >= 80
                THEN 1 ELSE 0
            END
        ) >= 7

        THEN 'High Risk'


        WHEN
        (
            CASE
                WHEN contract_type = 'Month-to-month'
                THEN 3 ELSE 0
            END

            +

            CASE
                WHEN tenure <= 12
                THEN 2
                WHEN tenure <= 24
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN internet_service = 'Fiber optic'
                THEN 2 ELSE 0
            END

            +

            CASE
                WHEN online_security = 'No'
                THEN 1 ELSE 0
            END

            +

            CASE
                WHEN tech_support = 'No'
                THEN 1 ELSE 0
            END

            +

            CASE
                WHEN payment_method = 'Electronic check'
                THEN 2 ELSE 0
            END

            +

            CASE
                WHEN monthly_charges >= 80
                THEN 1 ELSE 0
            END
        ) >= 4

        THEN 'Medium Risk'


        ELSE 'Low Risk'

    END AS risk_category


FROM customer_churn_clean;



SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- Check the risk view

SELECT
    customer_id,
    risk_score,
    risk_category
FROM vw_customer_churn_analysis
LIMIT 20;

-- Check the risk distribution

SELECT
    risk_category,
    COUNT(*) AS customers
FROM vw_customer_churn_analysis
GROUP BY risk_category
ORDER BY
    CASE risk_category
        WHEN 'High Risk' THEN 1
        WHEN 'Medium Risk' THEN 2
        WHEN 'Low Risk' THEN 3
    END;
    
-- Checking risk score range    

SELECT
    MIN(risk_score) AS minimum_score,
    MAX(risk_score) AS maximum_score,
    AVG(risk_score) AS average_score
FROM vw_customer_churn_analysis;
