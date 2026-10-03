/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   FILE: 00_create_customer_table.sql
   PURPOSE: Create raw customer table
   ========================================================= */

USE telecom_churn;

DROP TABLE IF EXISTS customer_churn_raw;

CREATE TABLE customer_churn_raw
(
    customer_id       VARCHAR(20),
    gender           VARCHAR(20),
    senior_citizen    VARCHAR(10),
    partner          VARCHAR(10),
    dependents       VARCHAR(10),
    tenure           VARCHAR(20),
    phone_service     VARCHAR(30),
    multiple_lines    VARCHAR(30),
    internet_service  VARCHAR(30),
    online_security   VARCHAR(30),
    online_backup     VARCHAR(30),
    device_protection VARCHAR(30),
    tech_support      VARCHAR(30),
    streaming_tv      VARCHAR(30),
    streaming_movies  VARCHAR(30),
    contract_type     VARCHAR(30),
    paperless_billing VARCHAR(10),
    payment_method    VARCHAR(50),
    monthly_charges   VARCHAR(30),
    total_charges     VARCHAR(30),
    churn_status      VARCHAR(10)
);