/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   FILE: 06_clean_customer_data.sql
   PURPOSE: Clean and standardize customer data
   ========================================================= */

USE telecom_churn;

DROP TABLE IF EXISTS customer_churn_clean;

CREATE TABLE customer_churn_clean
(
    customer_id        VARCHAR(20) NOT NULL,
    gender            VARCHAR(20),
    senior_citizen     TINYINT,
    partner           VARCHAR(10),
    dependents        VARCHAR(10),
    tenure            INT,
    phone_service      VARCHAR(30),
    multiple_lines      VARCHAR(30),
    internet_service   VARCHAR(30),
    online_security    VARCHAR(30),
    online_backup      VARCHAR(30),
    device_protection  VARCHAR(30),
    tech_support       VARCHAR(30),
    streaming_tv       VARCHAR(30),
    streaming_movies   VARCHAR(30),
    contract_type          VARCHAR(30),
    paperless_billing  VARCHAR(10),
    payment_method     VARCHAR(50),
    monthly_charges    DECIMAL(10,2),
    total_charges      DECIMAL(12,2),
    churn_status             VARCHAR(10),

    PRIMARY KEY (customer_id)
);



TRUNCATE TABLE customer_churn_clean;

INSERT INTO customer_churn_clean
(
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    tenure,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract_type,
    paperless_billing,
    payment_method,
    monthly_charges,
    total_charges,
    churn_status
)

SELECT

    /* Customer ID */
    TRIM(customer_id),

    /* Demographics */
    NULLIF(TRIM(gender), ''),

    CASE
        WHEN TRIM(senior_citizen) IN ('0', '0.0')
            THEN 0
        WHEN TRIM(senior_citizen) IN ('1', '1.0')
            THEN 1
        ELSE NULL
    END,

    NULLIF(TRIM(partner), ''),

    NULLIF(TRIM(dependents), ''),

    /* Tenure */
    CASE
        WHEN TRIM(tenure) REGEXP '^[0-9]+(\\.0)?$'
            THEN CAST(CAST(TRIM(tenure) AS DECIMAL(10,1)) AS UNSIGNED)
        ELSE NULL
    END,

    /* Services */
    NULLIF(TRIM(phone_service), ''),
    NULLIF(TRIM(multiple_lines), ''),
    NULLIF(TRIM(internet_service), ''),
    NULLIF(TRIM(online_security), ''),
    NULLIF(TRIM(online_backup), ''),
    NULLIF(TRIM(device_protection), ''),
    NULLIF(TRIM(tech_support), ''),
    NULLIF(TRIM(streaming_tv), ''),
    NULLIF(TRIM(streaming_movies), ''),

    /* Account */
    NULLIF(TRIM(contract_type), ''),
    NULLIF(TRIM(paperless_billing), ''),
    NULLIF(TRIM(payment_method), ''),

    /* Monthly Charges */
    CASE
        WHEN TRIM(monthly_charges) REGEXP '^[0-9]+(\\.[0-9]+)?$'
            THEN CAST(TRIM(monthly_charges) AS DECIMAL(10,2))
        ELSE NULL
    END,

    /* Total Charges */
    CASE
        WHEN TRIM(total_charges) REGEXP '^[0-9]+(\\.[0-9]+)?$'
            THEN CAST(TRIM(total_charges) AS DECIMAL(12,2))
        ELSE NULL
    END,

    /* Churn */
    NULLIF(TRIM(churn_status), '')

FROM customer_churn_raw;





SELECT
    customer_id,
    senior_citizen,
    tenure,
    monthly_charges,
    total_charges
FROM customer_churn_clean
WHERE
    TRIM(senior_citizen) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$'
    OR
    TRIM(tenure) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$'
    OR
    TRIM(monthly_charges) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$'
    OR
    (
        TRIM(total_charges) <> ''
        AND TRIM(total_charges) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$'
    );
    
    
SELECT
    COUNT(*) AS total_rows,

    SUM(
        CASE
            WHEN TRIM(tenure) = '' OR tenure IS NULL
            THEN 1 ELSE 0
        END
    ) AS missing_tenure,

    SUM(
        CASE
            WHEN TRIM(monthly_charges) = '' OR monthly_charges IS NULL
            THEN 1 ELSE 0
        END
    ) AS missing_monthly_charges,

    SUM(
        CASE
            WHEN TRIM(Total_Charges) = '' OR Total_Charges IS NULL
            THEN 1 ELSE 0
        END
    ) AS missing_total_charges

FROM customer_churn_clean;


SELECT
    COUNT(*) AS total_customers,
    COUNT(tenure) AS non_null_tenure,
    COUNT(Monthly_Charges) AS non_null_monthly_charges,
    COUNT(Total_Charges) AS non_null_total_charges
FROM customer_churn_clean;

SELECT COUNT(*) AS clean_rows
FROM customer_churn_clean;


SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customer_churn_clean;
