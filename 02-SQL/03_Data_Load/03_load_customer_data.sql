/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   FILE: 01_load_customer_data.sql
   PURPOSE: Load raw CSV data
   ========================================================= */

USE telecom_churn;

SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE
'C:/Users/Kaushlendra P Singh/Documents/Telecom-Customer-Churn-Analysis/Raw/telco_data.csv'

INTO TABLE customer_churn_raw

CHARACTER SET utf8mb4

FIELDS TERMINATED BY ','
ENCLOSED BY '"'

LINES TERMINATED BY '\n'

IGNORE 1 ROWS;

select * from customer_churn_raw;