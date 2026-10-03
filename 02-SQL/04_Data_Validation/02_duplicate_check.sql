
/* =========================================================
   FILE: 02_duplicate_check.sql
   PURPOSE: Identify duplicate customer IDs
   ========================================================= */
   
USE telecom_churn;

SELECT
    customer_id,
    COUNT(*) AS record_count
FROM customer_churn_raw
GROUP BY customer_id
HAVING COUNT(*) > 1;



