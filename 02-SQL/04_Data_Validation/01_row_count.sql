/* =========================================================
   FILE: 01_row_count.sql
   PURPOSE: Validate record count
   EXPECTED: 7043
   ========================================================= */

USE telecom_churn;


SELECT COUNT(*) AS total_rows
FROM customer_churn_raw;

-- Check the columns

DESCRIBE customer_churn_raw;

-- Check the first 10 records

SELECT *
FROM customer_churn_raw
LIMIT 10;
