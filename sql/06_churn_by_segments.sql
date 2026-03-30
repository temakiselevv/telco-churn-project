-- =============================================
-- Script: 06_churn_by_segments.sql
-- Project: telco-churn-project
-- Author: Artyom K. (Junior Data Analyst)
-- Date: 2026-03-27
-- Description: Анализ оттока по основным сегментам
-- =============================================

-- Отток по типу контракта
SELECT 
    "Contract",
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) AS churned,
    ROUND(100.0 * COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) / COUNT(*), 2) AS churn_rate
FROM clean.wa_fn_usec
GROUP BY "Contract"
ORDER BY churn_rate DESC;

-- Отток по способу оплаты
SELECT 
    "PaymentMethod",
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) AS churned,
    ROUND(100.0 * COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) / COUNT(*), 2) AS churn_rate
FROM clean.wa_fn_usec
GROUP BY "PaymentMethod"
ORDER BY churn_rate DESC;

-- Отток по типу интернета
SELECT 
    "InternetService",
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) AS churned,
    ROUND(100.0 * COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) / COUNT(*), 2) AS churn_rate
FROM clean.wa_fn_usec
GROUP BY "InternetService"
ORDER BY churn_rate DESC;

-- Отток по SeniorCitizen
SELECT 
    "SeniorCitizen",
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) AS churned,
    ROUND(100.0 * COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) / COUNT(*), 2) AS churn_rate
FROM clean.wa_fn_usec
GROUP BY "SeniorCitizen";

-- Распределение по tenure (группы)
SELECT 
    CASE 
        WHEN tenure = 0 THEN 'New customer'
	    WHEN tenure <= 6 THEN '1-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        ELSE '37+ months'
    END AS tenure_group,
    COUNT(*) AS customer_count,
    COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END) AS churned,
    ROUND(COUNT(CASE WHEN "Churn" = 'Yes' THEN 1 END)::NUMERIC / COUNT(*) * 100, 2) AS churn_rate_pct
FROM clean.wa_fn_usec
GROUP BY 
    CASE 
        WHEN tenure = 0 THEN 'New customer'
	    WHEN tenure <= 6 THEN '1-6 months'
        WHEN tenure <= 12 THEN '7-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 36 THEN '25-36 months'
        ELSE '37+ months'
    END
ORDER BY churn_rate_pct DESC;