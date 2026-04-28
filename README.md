# Telco Customer Churn Analysis & Prediction

[![Python 3.8+](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Jupyter Notebook](https://img.shields.io/badge/Jupyter-Notebook-orange.svg)](https://jupyter.org/)
[![SQL](https://img.shields.io/badge/SQL-%20-blue?logo=postgresql)](https://www.postgresql.org/docs/current/tutorial.html)
[![Docker](https://img.shields.io/badge/Docker-2CA5E0?logo=docker&logoColor=white)](https://hub.docker.com/)
[![HTML5](https://img.shields.io/badge/HTML5-%20-orange?logo=html5)](https://developer.mozilla.org/en-US/docs/Web/HTML)

**Прогнозирование оттока клиентов телекоммуникационной компании с помощью машинного обучения**

Проект направлен на прогнозирование оттока клиентов телеком‑компании на основе их поведения, тарифов и использования услуг.

## Цели проекта:

- Провести глубокий разведочный анализ данных оттока клиентов.
- Построить точную модель прогнозирования оттока клиентов телеком-компании.
- Обеспечить высокую интерпретируемость результатов с помощью SHAP.
- Выявить основные причины оттока и предложить практические рекомендации по удержанию клиентов.
- Создать полный, чистый и воспроизводимый ML-проект.

## 🏆 Основные результаты

### EDA

- Обработан датасет из 7 043 клиентов телеком-компании
- Уровень оттока (Churn) составляет 26.54% (1 869 клиентов ушли)
- Средняя длительность пользования услугами (tenure) — 32.4 месяца
- Средний ежемесячный платёж (MonthlyCharges) — 64.76 у.е.
- Клиенты с помесячным контрактом (Month-to-month) составляют 55% от всех клиентов

### Feature Engineering

- Создано несколько новых значимых признаков
- Наиболее полезным оказался признак avg_monthly_per_tenure_month (средний чек за месяц использования)
- Построен комбинированный признак high_risk_combination, вошедший в топ-3 по важности

### Моделирование

- Модель: XGBoost Classifier
- Оптимизация гиперпараметров проведена с помощью Bayesian Optimization
- Подобран оптимальный порог вероятности для максимизации F1-score: 0.4632
- ROC-AUC на тестовом наборе: 0.8549
- F1-score: 0.6508 (после подбора порога)
- Recall: 0.8021
- Precision: 0.5474

### Интерпретируемость (SHAP-анализ)
**Топ-10 наиболее важных признаков:**

Contract — 0.6658  
avg_monthly_per_tenure_month — 0.4620  
high_risk_combination — 0.2576  
OnlineSecurity — 0.2114  
MonthlyCharges — 0.1736  
TechSupport — 0.1525  
PaymentMethod — 0.1333  
tenure — 0.1236  
PaperlessBilling — 0.0896  
month_to_month_flag — 0.0863  

## 📁 Структура проекта

```text
telco-churn-project/
├── dashboards/               # визуализации/отчёты
├── data/
│   ├── raw/                  # исходные данные (загружаются вручную)
│   └── processed/            # обработанные данные
├── models/                   # сохранённые модели
├── notebooks/                # Jupyter‑ноутбуки
│   ├── 01_data_loading.ipynb  
│   ├── 02_eda.ipynb           
│   ├── 03_feature_engineering.ipynb        
│   └── 04_churn_modeling.ipynb         
├── sql/                      # sql-файлы (предобработка данных, базовый eda и feature_engineering)
│   ├── 01_create_schemas.sql   
│   ├── 02_raw_create_table.sql 
│   ├── 03_raw_import_check.sql
│   ├── 04_clean_data.sql 
│   ├── 05_eda_basic_statistics.sql          
│   ├── 06_churn_by_segments.sql      
│   └── 07_create_main_view.sql
├── utils/                  
│   └── visualization.py      
├── .gitattributes
├── .gitignore
├── docker-compose.yml
├── Telco Customer Churn Analysis presentation.pdf
├── requirements.txt        
└── README.md
```

## 📊 Данные

Используется набор данных телеком‑компании, включающий:
* демографические данные клиентов;
* тип контракта;
* тарифные планы;
* ежемесячные и суммарные платежи;
* подключённые услуги.

**Целевая переменная:**
* `Churn` (1 — клиент ушёл, 0 — остался).

**Источник данных:**
https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data

> **Примечание:** сырые данные не включены в репозиторий из‑за объёма.

---

## 🛠 Технологический стек

### Библиотеки Python
* Pandas, NumPy;
* Scikit‑learn;
* XGBoost;
* SciPy (`scipy.stats`).

### Визуализация
* Plotly Express;
* Matplotlib.

### Оптимизация и интерпретация
* Bayesian Optimization (`bayes_opt`);
* SHAP (TreeExplainer).

### Утилиты
* SQLAlchemy;
* Joblib;
* JSON, OS, datetime.

---

## Методология

### 1. Исследовательский анализ данных (EDA)
* одномерный анализ (распределения, выбросы);
* двумерный анализ (зависимость признаков от churn);
* многомерный анализ (корреляции и взаимодействия признаков).

### 2. Статистический анализ
* t‑test (сравнение групп churn / non‑churn);
* Point‑Biserial корреляция (числовые признаки vs целевая переменная).

### 3. Предобработка данных
* обработка пропусков;
* кодирование категориальных признаков;
* подготовка признаков для моделей.

### 4. Построение моделей
**Основная модель:** XGBoost Classifier.

### 5. Подбор гиперпараметров
Используется **Bayesian Optimization** для настройки XGBoost:
* глубина деревьев;
* learning rate;
* количество деревьев;
* subsample;
* colsample_bytree;
* gamma;
* баланс классов.

### 6. Стратегия валидации
* Train‑test split (стратифицированный);
* StratifiedKFold (5 фолдов).

### 7. Оценка качества модели
**Метрики:**
* Accuracy;
* Precision;
* Recall;
* F1‑score;
* ROC‑AUC.

**Дополнительно:**
* Confusion Matrix;
* подбор оптимального порога (threshold tuning).

### 8. Интерпретация модели
**SHAP TreeExplainer:**
* глобальная важность признаков;
* локальные объяснения предсказаний;
* влияние признаков на риск оттока.

---

## Ключевые выводы

* Краткосрочные контракты значительно увеличивают вероятность оттока.
* Высокие ежемесячные платежи повышают риск ухода клиента.
* Чем дольше клиент пользуется услугами, тем ниже вероятность churn.
* Способ оплаты и набор услуг также влияют на удержание.

---

## Pipeline проекта

1. Загрузка данных (Pandas, SQLAlchemy).
2. Предобработка данных.
3. EDA + статистический анализ.
4. Train‑test split.
5. Обучение моделей.
6. Bayesian Optimization (XGBoost).
7. StratifiedKFold validation.
8. Финальное обучение модели.
9. Threshold tuning.
10. Оценка качества (Confusion Matrix, ROC‑AUC).
11. Интерпретация (SHAP).
12. Сохранение модели (Joblib).

---

## Сохранение модели

* `joblib` — сохранение модели;
* `json` — сохранение метрик и параметров.

## Как запустить проект

Скачайте датасет по ссылке:
https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data

Положите csv-файл в папку `data/raw/`
