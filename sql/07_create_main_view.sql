-- =============================================
-- Script: 07_create_main_view.sql
-- Project: telco-churn-project
-- Author: Artyom K. (Junior Data Analyst)
-- Date: 2026-03-27
-- Description: Базовая аналитическая витрина для проекта
-- =============================================

DROP VIEW IF EXISTS clean.vw_churn_analysis;

CREATE OR REPLACE VIEW clean.vw_churn_analysis AS
SELECT 
    "customerID",
    "gender",
    "SeniorCitizen",
    "Partner",
    "Dependents",
    tenure,
    "PhoneService",
    "MultipleLines",
    "InternetService",
    "Contract",
    "PaperlessBilling",
    "PaymentMethod",
    "MonthlyCharges",
    "TotalCharges",
    "Churn",
    CASE 
        WHEN tenure = 0 THEN 'New customer'
        WHEN tenure <= 6 THEN '1-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        ELSE '37+ months'
    END AS tenure_group,
    CASE 
        WHEN "TotalCharges" = 0 THEN 'New'
        ELSE 'Existing'
    END AS customer_type,
    ROUND("MonthlyCharges" / NULLIF(tenure, 0), 2) AS avg_monthly_per_tenure_month,
    CASE WHEN "InternetService" = 'Fiber optic' THEN 1 ELSE 0 END AS fiber_optic_flag,
    CASE WHEN "PaymentMethod" = 'Electronic check' THEN 1 ELSE 0 END AS electronic_check_flag,
    CASE WHEN "Contract" = 'Month-to-month' THEN 1 ELSE 0 END AS month_to_month_flag,
    CASE WHEN "SeniorCitizen" = 1 THEN 1 ELSE 0 END AS senior_citizen_flag
FROM clean.wa_fn_usec;