/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   FILE: 01_create_database.sql
   PURPOSE: Create project database
   ========================================================= */
   
DROP database telecom_churn;


CREATE DATABASE IF NOT EXISTS telecom_churn
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE telecom_churn;

SELECT DATABASE() AS current_database;
