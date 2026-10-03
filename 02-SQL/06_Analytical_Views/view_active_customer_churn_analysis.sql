/* =========================================================
   ACTIVE CUSTOMER RISK VIEW
   Purpose:
   Identify currently active customers who are potential
   retention targets.

   Source:
   vw_customer_risk

   Important:
   Only customers with is_churned = 0 are included.
   ========================================================= */

USE telecom_churn;

DROP VIEW IF EXISTS vw_active_customer_risk;

CREATE VIEW vw_active_customer_risk AS

SELECT
    *
FROM vw_customer_churn_analysis
WHERE is_churned = 0;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(CASE WHEN is_churned = 1 THEN 1 ELSE 0 END) AS churned,
    SUM(CASE WHEN is_churned = 0 THEN 1 ELSE 0 END) AS active,
    MIN(risk_score) AS min_risk_score,
    MAX(risk_score) AS max_risk_score
FROM vw_active_customer_risk;



SELECT
    risk_category,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM vw_active_customer_risk),
        2
    ) AS percentage
FROM vw_active_customer_risk
GROUP BY risk_category
ORDER BY
    CASE risk_category
        WHEN 'High Risk' THEN 1
        WHEN 'Medium Risk' THEN 2
        WHEN 'Low Risk' THEN 3
    END;
    
    
    SELECT
    risk_score,
    COUNT(*) AS customer_count
FROM vw_active_customer_risk
GROUP BY risk_score
ORDER BY risk_score;