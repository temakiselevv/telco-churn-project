-- =============================================
-- Script: 03_raw_check.sql
-- Project: telco-churn-project
-- Author: Artyom K. (Junior Data Analyst)
-- Date: 2026-03-27
-- Description: Импорт сырых данных в схему raw и проверка
-- =============================================

-- ИНСТРУКЦИЯ ПО ИМПОРТУ ДАННЫХ

/*
   - В DBeaver правой кнопкой мыши по схеме "raw" → Import Data
   - Выбрать файл: data/raw/wa_fn_usec.csv
   - Target table: wa_fn_usec
   - Encoding: UTF-8
   - Header row: включено (First row contains column names)
   - Delimiter: , (запятая)
   - На шаге Mapping проверить соответствие колонок
   - Запустить импорт
*/

-- Общее количество загруженных строк
SELECT COUNT(*) AS total_rows FROM raw.wa_fn_usec;

-- Первые 10 строк для проверки
SELECT * FROM raw.wa_fn_usec LIMIT 10;

-- Проверка структуры таблицы
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_schema = 'raw' 
  AND table_name = 'wa_fn_usec'
ORDER BY ordinal_position;