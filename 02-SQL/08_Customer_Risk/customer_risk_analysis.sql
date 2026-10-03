/* =========================================================
   FILE: customer_risk_analysis.sql
   PURPOSE:
   Identify active customers with rule-based churn risk
   ========================================================= */

USE telecom_churn;


/* =========================================================
   STEP 1: Calculate risk score
   ========================================================= */

WITH customer_risk AS
(
    SELECT

        customer_id,

        tenure,

        contract_type,

        internet_service,

        payment_method,

        monthly_charges,

        tech_support,

        online_backup,

        online_security,

        is_churned,

        /* -----------------------------------------
           Contract risk
           ----------------------------------------- */

        CASE
            WHEN contract_type = 'Month-to-month'
                THEN 3

            WHEN contract_type = 'One year'
                THEN 1

            ELSE 0
        END AS contract_risk,


        /* -----------------------------------------
           Tenure risk
           ----------------------------------------- */

        CASE
            WHEN tenure <= 12
                THEN 3

            WHEN tenure <= 24
                THEN 1

            ELSE 0
        END AS tenure_risk,


        /* -----------------------------------------
           Tech support risk
           ----------------------------------------- */

        CASE
            WHEN tech_support = 'No'
                THEN 2
            ELSE 0
        END AS tech_support_risk,


        /* -----------------------------------------
           Online backup risk
           ----------------------------------------- */

        CASE
            WHEN online_backup = 'No'
                THEN 1
            ELSE 0
        END AS backup_risk,


        /* -----------------------------------------
           Monthly charge risk
           ----------------------------------------- */

        CASE
            WHEN monthly_charges >= 80
                THEN 2
            ELSE 0
        END AS charge_risk

    FROM vw_customer_churn_analysis

    /* Only active customers */
    WHERE is_churned = 0
)


/* =========================================================
   STEP 2: Calculate total score and risk category
   ========================================================= */

SELECT

    customer_id,

    tenure,

    contract_type,

    internet_service,

    payment_method,

    monthly_charges,

    tech_support,

    online_backup,

    online_security,

    (
        contract_risk
        + tenure_risk
        + tech_support_risk
        + backup_risk
        + charge_risk
    ) AS risk_score,


    CASE

        WHEN
            (
                contract_risk
                + tenure_risk
                + tech_support_risk
                + backup_risk
                + charge_risk
            ) >= 8
            THEN 'High Risk'

        WHEN
            (
                contract_risk
                + tenure_risk
                + tech_support_risk
                + backup_risk
                + charge_risk
            ) >= 5
            THEN 'Medium Risk'

        ELSE 'Low Risk'

    END AS risk_category

FROM customer_risk

ORDER BY
    risk_score DESC,
    monthly_charges DESC;
    
    
/* =========================================================
   STEP 3: High-risk customer summary
   ========================================================= */

WITH customer_risk AS
(
    SELECT

        customer_id,

        monthly_charges,

        is_churned,

        (
            CASE
                WHEN contract_type = 'Month-to-month' THEN 3
                WHEN contract_type = 'One year' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN tenure <= 12 THEN 3
                WHEN tenure <= 24 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN tech_support = 'No' THEN 2
                ELSE 0
            END
            +
            CASE
                WHEN online_backup = 'No' THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN monthly_charges >= 80 THEN 2
                ELSE 0
            END
        ) AS risk_score

    FROM vw_customer_churn_analysis

    WHERE is_churned = 0
)

SELECT

    COUNT(*) AS high_risk_active_customers,

    ROUND(
        SUM(monthly_charges),
        2
    ) AS high_risk_monthly_revenue_at_risk,

    ROUND(
        AVG(monthly_charges),
        2
    ) AS avg_monthly_charge_high_risk

FROM customer_risk

WHERE risk_score >= 8;