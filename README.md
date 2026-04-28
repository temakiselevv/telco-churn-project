# Telco Customer Churn Prediction

[![Python 3.8+](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Jupyter Notebook](https://img.shields.io/badge/Jupyter-Notebook-orange.svg)](https://jupyter.org/)
[![SQL](https://img.shields.io/badge/SQL-%20-blue?logo=postgresql)](https://www.postgresql.org/docs/current/tutorial.html)
[![Docker](https://img.shields.io/badge/Docker-2CA5E0?logo=docker&logoColor=white)](https://hub.docker.com/)
[![XGBoost](https://img.shields.io/badge/XGBoost-Used-success)](https://xgboost.readthedocs.io/)
[![SHAP](https://img.shields.io/badge/SHAP-Interpretable-blue)](https://shap.readthedocs.io/)

**Прогнозирование оттока клиентов телекоммуникационной компании с помощью машинного обучения и интерпретируемого AI.**

---

## 🎯 О проекте

Этот проект представляет собой **полноценный end-to-end ML-кейс**: от разведочного анализа данных до построения высокоинтерпретируемой модели прогнозирования оттока клиентов телеком-оператора.

**Основная цель** — не только построить точную модель, но и понять *почему* клиенты уходят, чтобы предложить конкретные рекомендации по удержанию.

### Ключевые результаты

- **ROC-AUC** на тесте: **0.8549**
- **F1-score**: **0.6508** (после тюнинга порога вероятности)
- **Recall**: **0.8021** — модель хорошо ловит уходящих клиентов
- Лучшая модель: **XGBoost Classifier** + Bayesian Optimization
- Глубокий **SHAP-анализ** для интерпретируемости

**Топ-3 самых важных признака (по SHAP):**
1. **Contract** (тип контракта)
2. **avg_monthly_per_tenure_month** (средний чек за месяц лояльности)
3. **high_risk_combination** (комбинированный риск-фактор)

---

## 📊 Основные insights из EDA

- Уровень оттока — **26.54%** (1869 клиентов из 7043)
- Более половины клиентов (55%) используют помесячный контракт — именно они уходят чаще всего
- Средний срок пользования услугами — 32.4 месяца
- Клиенты с высокими ежемесячными платежами и отсутствием услуг безопасности/поддержки — в зоне повышенного риска

**Бизнес-выводы и рекомендации** находятся в презентации (`Telco Customer Churn Analysis presentation.pdf`).

---

## 🛠 Технологический стек

- **База данных и SQL-аналитика**: PostgreSQL, SQL  
- **Python и Machine Learning**: Python 3.8+, Pandas, NumPy, SciPy
- **Моделирование**: XGBoost, Scikit-learn
- **Оптимизация**: Bayesian Optimization (`bayes_opt`)
- **Интерпретируемость**: SHAP (TreeExplainer)
- **Визуализация**: Plotly Express, Matplotlib
- **Дополнительно**:
  SQLAlchemy — подключение Python к PostgreSQL  
  JSON, Joblib — сохранение моделей  
  Docker & docker-compose — контейнеризация и воспроизводимость  
  Jupyter Notebook  
---

## 📁 Структура проекта

```text
telco-churn-project/
├── data/                  # raw + processed данные
├── notebooks/             # 01_data_loading → 04_churn_modeling
├── sql/                   # Предобработка, EDA и витрины в PostgreSQL
├── dashboards/            # Интерактивные отчёты и визуализации
├── models/                # Сохранённые модели (joblib)
├── utils/                 # Вспомогательные скрипты
├── Telco Customer Churn Analysis presentation.pdf
├── docker-compose.yml
├── requirements.txt
└── README.md
```

## 🚀 Как запустить проект

Вариант 1: С помощью Docker Compose (рекомендуется)
# 1. Клонируйте репозиторий
git clone https://github.com/ваш_юзер/telco-churn-project.git
cd telco-churn-project

# 2. Скачайте датасет и положите файл в нужную папку
#    https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data
#    Файл: WA_Fn-UseC_-Telco-Customer-Churn.csv → data/raw/

# 3. Запустите все сервисы (PostgreSQL + Jupyter)
docker-compose up -d

# 4. Откройте Jupyter Notebook по ссылке, которая появится в консоли
После запуска вы можете:

Выполнить SQL-скрипты из папки sql/
Запустить Jupyter-ноутбуки по порядку

Вариант 2: Локально (без Docker)
# 1. Создайте и активируйте виртуальное окружение
python -m venv venv
source venv/bin/activate    # Windows: venv\Scripts\activate

# 2. Установите зависимости
pip install -r requirements.txt

# 3. Положите датасет в data/raw/
# 4. Запустите Jupyter
jupyter notebook

## 📈 Методология

* Предобработка данных (SQL + Pandas)
* Разведочный анализ (EDA) + статистические тесты
* Feature Engineering (включая сильные комбинированные признаки)
* Моделирование → XGBoost с Bayesian Optimization
* Тюнинг порога для максимизации F1-score
* Интерпретация с помощью SHAP (глобальная + локальная)
* Валидация: StratifiedKFold + Train/Test split

📌 Ключевые особенности проекта

* Полная воспроизводимость через Docker
* Комбинация SQL и Python пайплайна
* Высокая интерпретируемость модели (SHAP)
* Бизнес-ориентированные insights и рекомендации
* Чистая, модульная структура проекта

## Дополнительные материалы

Презентация — Telco Customer Churn Analysis presentation.pdf
Jupyter notebooks — подробный разбор каждого этапа
SQL-скрипты — создание схем, очистка и аналитические витрины

Хотите увидеть проект в действии?
Открывайте ноутбуки или презентацию — там вся ценность.
⭐ Если проект был полезен — ставьте звезду!

*Проект создан как демонстрация сильных навыков в end-to-end ML, feature engineering и интерпретируемом машинном обучении.*

## Автор  
Киселев Артём — Junior Data Analyst  
GitHub: Tema Kiselev (temakiselevv) | Telegram: @tema_kiselev
