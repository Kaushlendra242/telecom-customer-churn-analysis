/* =========================================================
   FILE: 05_category_validation.sql
   PURPOSE: Validate categorical fields
   ========================================================= */

USE telecom_churn;

/* Gender */
SELECT
    gender,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY gender
ORDER BY customers DESC;


/* Senior Citizen */
SELECT
    senior_citizen,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY senior_citizen
ORDER BY senior_citizen;


/* Partner */
SELECT
    Partner,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY Partner
ORDER BY customers DESC;


/* Dependents */
SELECT
    Dependents,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY Dependents
ORDER BY customers DESC;


/* Contract */
SELECT
    contract_type,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY contract_type
ORDER BY customers DESC;


/* Internet Service */
SELECT
    internet_service,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY internet_service
ORDER BY customers DESC;


/* Payment Method */
SELECT
    payment_method,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY payment_method
ORDER BY customers DESC;


/* Churn */
SELECT
    churn_status,
    COUNT(*) AS customers
FROM customer_churn_raw
GROUP BY churn_status
ORDER BY customers DESC;




-- Check tenure

SELECT
    MIN(tenure) AS minimum_tenure,
    MAX(tenure) AS maximum_tenure,
    AVG(tenure) AS average_tenure
FROM customer_churn_raw;

-- Check monthly charges

SELECT
    MIN(monthly_charges) AS minimum_monthly_charge,
    MAX(monthly_charges) AS maximum_monthly_charge,
    AVG(monthly_charges) AS average_monthly_charge
FROM customer_churn_raw;
