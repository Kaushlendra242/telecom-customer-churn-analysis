-- 1 — Confirm row count

SELECT COUNT(*) AS clean_rows
FROM customer_churn_clean;

-- 2 — Confirm unique customers

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_ID) AS unique_customers
FROM customer_churn_clean;

-- 3 — Check cleaned numeric columns

SELECT
    COUNT(*) AS total_customers,
    COUNT(tenure) AS non_null_tenure,
    COUNT(Monthly_Charges) AS non_null_monthly_charges,
    COUNT(Total_Charges) AS non_null_total_charges
FROM customer_churn_clean;

-- 4 — Check tenure

SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customer_churn_clean;

-- 5 — Check MonthlyCharges

SELECT
    MIN(Monthly_Charges) AS min_monthly_charges,
    MAX(Monthly_Charges) AS max_monthly_charges,
    ROUND(AVG(Monthly_Charges), 2) AS avg_monthly_charges
FROM customer_churn_clean;

-- 6 — Check SeniorCitizen

SELECT
    Senior_Citizen,
    COUNT(*) AS customers
FROM customer_churn_clean
GROUP BY Senior_Citizen
ORDER BY Senior_Citizen;

-- 7 — Check Churn

SELECT
    churn_status,
    COUNT(*) AS customers
FROM customer_churn_clean
GROUP BY churn_status
ORDER BY churn_status;

-- 8 — Check NULLs in the clean table

SELECT
    SUM(customer_ID IS NULL) AS null_customerID,
    SUM(gender IS NULL) AS null_gender,
    SUM(Senior_Citizen IS NULL) AS null_senior_citizen,
    SUM(Partner IS NULL) AS null_partner,
    SUM(Dependents IS NULL) AS null_dependents,
    SUM(tenure IS NULL) AS null_tenure,
    SUM(Monthly_Charges IS NULL) AS null_monthly_charges,
    SUM(Total_Charges IS NULL) AS null_total_charges,
    SUM(churn_status IS NULL) AS null_churn
FROM customer_churn_clean;

-- 9 — Most important QA check

SELECT
    (SELECT COUNT(*)
     FROM customer_churn_raw) AS raw_rows,

    (SELECT COUNT(*)
     FROM customer_churn_clean) AS clean_rows,

    (SELECT COUNT(*)
     FROM customer_churn_raw)
    -
    (SELECT COUNT(*)
     FROM customer_churn_clean) AS row_difference;