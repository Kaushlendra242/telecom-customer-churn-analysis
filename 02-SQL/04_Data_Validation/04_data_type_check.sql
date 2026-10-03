/* =========================================================
   FILE: 04_data_type_check.sql
   PURPOSE: Validate values before type conversion
   ========================================================= */

USE telecom_churn;

/* -----------------------------------------
   1. Invalid SeniorCitizen values
   ----------------------------------------- */

SELECT DISTINCT
    senior_citizen
FROM customer_churn_raw
WHERE TRIM(senior_citizen) NOT IN ('0', '1');

SELECT
    customer_id,
    senior_citizen
FROM customer_churn_raw
WHERE TRIM(senior_citizen) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';


/* -----------------------------------------
   2. Invalid tenure values
   ----------------------------------------- */

SELECT
    customer_id,
    tenure
FROM customer_churn_raw
WHERE TRIM(tenure) = ''
   OR TRIM(tenure) NOT REGEXP '^[0-9]+$';


/* -----------------------------------------
   3. Invalid MonthlyCharges values
   ----------------------------------------- */

SELECT
    customer_id,
    monthly_charges
FROM customer_churn_raw
WHERE TRIM(monthly_charges) = ''
   OR TRIM(monthly_charges) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';


/* -----------------------------------------
   4. Invalid TotalCharges values
   Blank values are allowed and will become NULL.
   ----------------------------------------- */

SELECT
    customer_id,
    total_charges
FROM customer_churn_raw
WHERE TRIM(total_charges) <> ''
  AND TRIM(total_charges) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';


/* -----------------------------------------
   5. Invalid Churn values
   ----------------------------------------- */

SELECT DISTINCT
    churn_status
FROM customer_churn_raw
WHERE TRIM(churn_status) NOT IN ('Yes', 'No');


SELECT
    customer_id,
    senior_citizen,
    tenure,
    monthly_charges,
    total_charges
FROM customer_churn_raw
WHERE
    TRIM(senior_citizen) = ''
    OR TRIM(tenure) = ''
    OR TRIM(monthly_charges) = ''
    OR TRIM(total_charges) = ''
LIMIT 20;