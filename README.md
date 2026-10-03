# 📊 Telecom Customer Churn Analysis
### End-to-End SQL + Python + Power BI Analytics Project

> **A business-focused analytics portfolio project demonstrating the complete workflow from raw customer data to SQL data engineering, Python analysis and machine learning, and an interactive Power BI dashboard.**

## 🎯 Project Overview

Customer churn is a major challenge for subscription-based telecom businesses. This project analyzes customer behavior, identifies churn patterns, quantifies revenue exposure, creates customer-risk logic, and presents decision-ready insights through Power BI.

### End-to-end workflow

**Raw Data → MySQL Data Engineering → Analytical SQL Views → Python EDA & ML → Power BI Dashboard → Business Insights**

The project demonstrates practical skills in:

- **SQL / MySQL:** database setup, data loading, validation, cleaning, analytical views, aggregations and business-risk logic
- **Python:** data preparation, EDA, feature engineering, segmentation, visualization, classification and model evaluation
- **Power BI:** data modeling, DAX/KPIs, slicers, tooltips, navigation, conditional formatting and business storytelling
- **Business Analysis:** churn drivers, customer segments, retention opportunities and revenue exposure
- **Documentation:** reproducible folder structure, scripts, notebooks and structured outputs

---

# 📊 Power BI Dashboard

The Power BI report contains an executive overview, churn-driver analysis, revenue/contract analysis and customer-risk insights.

> **GitHub image-path convention:** screenshots are stored under `03_PowerBI/Screenshots/`.

### Executive Overview

![Executive Overview](03_PowerBI/Screenshots/Executive-Overview.png)

### Customer Drivers

![Customer Drivers](03_PowerBI/Screenshots/Customer-Drivers.png)

### Revenue & Contracts

![Revenue & Contracts](03_PowerBI/Screenshots/Revenue-Contracts.png)

### Risk & Retention

![Risk & Retention](03_PowerBI/Screenshots/Risk-Retention.png)

> **Important:** The four screenshot filenames above should match the files committed to `03_PowerBI/Screenshots/` exactly. GitHub paths are case-sensitive.

---

## 🏢 Business Problem

The analysis is designed to answer:

1. How many customers are churning?
2. Which customer segments have higher churn rates?
3. How do contract type, tenure, internet service and payment method relate to churn?
4. Which customer characteristics are associated with higher churn risk?
5. What recurring revenue is exposed to churn?
6. How can customer risk be translated into actionable segments?
7. How can the findings be communicated through an executive dashboard?

# 🛠️ Technology Stack

| Area | Tools / Techniques |
|---|---|
| Database | MySQL |
| SQL | SELECT, WHERE, GROUP BY, CASE, CTEs, aggregations, views |
| Python | Python 3, Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| Machine Learning | Scikit-learn |
| Models | Logistic Regression, Random Forest, Gradient Boosting |
| Evaluation | Accuracy, Precision, Recall, F1, ROC-AUC, Confusion Matrix, ROC Curve |
| BI | Microsoft Power BI |
| BI Modeling | Data model, DAX/KPIs, slicers, tooltips, navigation |
| Version Control | Git / GitHub |

# 🗂️ Project Architecture

```text
Telecom-Customer-Churn-Analysis/
│
├── 01_Dataset/
│   └── telco_data.csv
│
├── 02-SQL/
│   ├── 01_Database_Setup/
│   ├── 02_Table_Setup/
│   ├── 03_Data_Load/
│   ├── 04_Data_Validation/
│   ├── 05_Data_Cleaning/
│   ├── 06_Analytical_Views/
│   ├── 07_Business_Analysis/
│   └── 08_Customer_Risk/
│
├── 03_PowerBI/
│   ├── Telecom_Customer_Churn.pbix
│   └── Screenshots/
│
├── 04_Python/
│   ├── Telecom_Customer_Churn_Analysis.ipynb
│   ├── Telecom_Customer_Churn_Analysis.py
│   ├── requirements.txt
│   └── outputs/
│       ├── KPI/
│       ├── Charts/
│       ├── Segment_Analysis/
│       ├── Model/
│       ├── Data_Quality/
│       └── Insights/
│
└── 05_Documentation/
    ├── README.md
    ├── PROJECT_DOCUMENTATION.md
    ├── Business_Insights.txt
    └── PowerBI_Documentation.md
```

# 1️⃣ SQL / MySQL — Data Engineering & Business Analysis

The SQL layer establishes the analytical foundation before Python modeling and Power BI reporting.

## SQL workflow

```text
Raw CSV → Database Setup → Table Creation → Data Load →
Data Validation → Data Cleaning → Analytical Views →
Business Analysis → Customer Risk Analysis
```

## SQL skills demonstrated

- Database and table creation
- Data loading and validation
- Row-count and null checks
- Data-type and consistency checks
- Data cleaning
- `CASE`-based business logic
- `GROUP BY` and aggregations
- Reusable analytical views
- Churn-rate calculations
- Customer segmentation
- Rule-based customer risk scoring

The SQL analysis includes overall churn KPIs and churn analysis by contract, internet service, payment method and tech support.

### Analytical views

The project uses reusable views such as:

```text
vw_customer_churn_analysis
vw_customer_risk
```

### Customer risk framework

The customer-risk logic considers business factors including:

- Contract type
- Tenure
- Internet service
- Online security
- Tech support
- Payment method
- Monthly charges

The framework produces:

```text
Customer → Risk Score → Risk Category
                    → High / Medium / Low Risk
```

> **Important:** The SQL risk score is a business-rule framework, not an ML prediction.

# 2️⃣ Python — EDA, Segmentation & Machine Learning

Python provides the analytical and modeling layer.

## Python workflow

```text
Load Dataset → Data Profiling → Missing-Value Analysis →
Data Cleaning → Feature Engineering → EDA & Visualization →
Segment Analysis → Train/Test Split → Model Development →
Model Evaluation → Business KPI & Insight Export
```

### Data preparation

The notebook covers:

- Dataset profiling
- Missing-value assessment
- Numeric conversion of `TotalCharges`
- Handling invalid/incomplete records
- Binary encoding
- One-hot encoding
- Numerical imputation
- Model-ready feature creation

### Exploratory analysis

Python analysis includes churn by:

- Contract type
- Tenure
- Monthly charges
- Gender
- Senior-citizen status
- Internet service
- Payment method
- Tech support
- Tenure cohorts

### Segment outputs

Reusable churn-rate logic produces:

```text
Segment | Total Customers | Churned Customers | Churn Rate
```

Outputs are stored under:

```text
04_Python/outputs/Segment_Analysis/
```

# 3️⃣ Machine Learning

The project includes supervised churn classification using:

- Logistic Regression
- Random Forest
- Gradient Boosting

Models are evaluated using:

- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- Confusion Matrix
- ROC Curve

The project also creates model-comparison outputs so model performance can be reviewed consistently.

# 4️⃣ Power BI — Interactive Business Intelligence

Power BI converts the analytical results into an executive-friendly reporting layer.

The dashboard focuses on:

- Executive churn overview
- Customer churn drivers
- Revenue and contract analysis
- Customer-risk/business segments
- KPI reporting
- Interactive filtering

Power BI capabilities demonstrated include:

- Data modeling
- DAX measures/KPIs
- Slicers
- Conditional formatting
- Report navigation
- Tooltip pages
- Smart narrative / insight text
- Reset-filter functionality
- Business-focused visual design

# 🔗 How SQL, Python and Power BI Work Together

This is one integrated analytics project, not three disconnected exercises.

| Layer | Responsibility |
|---|---|
| **SQL / MySQL** | Data engineering, validation, reusable views and business logic |
| **Python** | EDA, segmentation, visualization and machine learning |
| **Power BI** | Interactive reporting, KPI monitoring and executive storytelling |
| **Business Analysis** | Converts technical output into retention and risk insights |

```text
                 ┌────────────────────┐
                 │   Raw Customer CSV  │
                 └─────────┬──────────┘
                           │
                           ▼
                 ┌────────────────────┐
                 │      MySQL         │
                 │ Validation/Cleaning│
                 │ Analytical Views   │
                 └─────────┬──────────┘
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
   ┌────────────────────┐    ┌────────────────────┐
   │       Python       │    │      Power BI      │
   │ EDA + Segmentation │    │ KPI + Dashboard    │
   │ ML + Evaluation    │    │ Interactive BI     │
   └─────────┬──────────┘    └─────────┬──────────┘
             │                         │
             └────────────┬────────────┘
                          ▼
                ┌─────────────────────┐
                │ Business Insights   │
                │ Churn Drivers       │
                │ Risk Segments       │
                │ Revenue Exposure    │
                └─────────────────────┘
```

# 📈 Structured Outputs

The Python project exports reusable outputs instead of keeping results only inside the notebook.

| Output | Purpose |
|---|---|
| `KPI/` | Business KPI tables |
| `Segment_Analysis/` | Churn by customer segments |
| `Model/` | Model metrics and evaluation |
| `Data_Quality/` | Data validation and quality outputs |
| `Charts/` | Saved Python visualizations |
| `Insights/` | Business-oriented findings |

# 💼 Business Questions Answered

### Customer retention
- Which customer groups show higher churn rates?
- How does tenure relate to churn?
- How do contract structures differ in churn behavior?

### Revenue
- How are monthly charges distributed across churn segments?
- What recurring revenue is associated with churned customers?
- Which segments represent greater revenue exposure?

### Customer experience
- How does tech support relate to churn?
- How does internet service relate to churn?
- How do payment methods differ across churn segments?

### Risk management
- Which active customers meet the business-rule risk criteria?
- How can risk scores be translated into actionable segments?
- How can SQL business risk logic remain distinct from ML prediction?

# 🚀 How to Run

## Python Notebook

Open:

```text
04_Python/Telecom_Customer_Churn_Analysis.ipynb
```

1. Verify the dataset exists in `01_Dataset/`.
2. Install dependencies from `04_Python/requirements.txt`.
3. Restart the Jupyter kernel.
4. Run all cells.
5. Verify the generated folders under `04_Python/outputs/`.

## Python Script

```bash
python Telecom_Customer_Churn_Analysis.py
```

## SQL

Execute the SQL folders in this logical order:

```text
01_Database_Setup
02_Table_Setup
03_Data_Load
04_Data_Validation
05_Data_Cleaning
06_Analytical_Views
07_Business_Analysis
08_Customer_Risk
```

## Power BI

Open:

```text
03_PowerBI/Telecom_Customer_Churn.pbix
```

# 🔐 Data & Repository Note

The raw dataset is stored in `01_Dataset/`.

Before publishing a public GitHub repository, verify that the dataset can legally be redistributed. If redistribution rights are unclear, exclude the raw CSV from the public repository and document how the dataset can be obtained.

Use `.gitignore` to exclude `.ipynb_checkpoints/`, virtual environments, IDE metadata, local paths and temporary files.

# 📚 Documentation

Additional documentation is available under `05_Documentation/`:

- `README.md` — project overview and portfolio showcase
- `PROJECT_DOCUMENTATION.md` — detailed methodology
- `Business_Insights.txt` — business findings
- `PowerBI_Documentation.md` — dashboard methodology and design

# 🧠 Skills Demonstrated

### SQL / Database
`MySQL` · `SQL` · `CTE` · `CASE` · `GROUP BY` · `Aggregations` · `Views` · `Data Validation` · `Data Cleaning` · `Business Logic` · `Risk Scoring`

### Python / Analytics
`Python` · `Pandas` · `NumPy` · `EDA` · `Feature Engineering` · `Segmentation` · `Matplotlib` · `Seaborn`

### Machine Learning
`Scikit-learn` · `Logistic Regression` · `Random Forest` · `Gradient Boosting` · `Classification` · `Model Evaluation` · `ROC-AUC`

### Power BI / BI
`Power BI` · `DAX` · `Data Modeling` · `KPI Design` · `Slicers` · `Tooltips` · `Conditional Formatting` · `Navigation` · `Business Storytelling`

### Professional Analytics
`Business Analysis` · `Customer Retention` · `Revenue Analysis` · `Risk Segmentation` · `Data Quality` · `Insight Generation` · `Documentation`

# ⭐ Portfolio Value

This project demonstrates the ability to move beyond an isolated notebook or dashboard and build a **complete analytics solution**:

> **Engineer → Validate → Analyze → Model → Visualize → Explain**

It showcases how SQL, Python and Power BI can be combined into one business-focused workflow, with each technology solving a different part of the analytical problem.

# 👤 Author

**Kaushlendra Pratap Singh**  
Data Analyst | Business Intelligence | Power BI | SQL | Python | Data Analytics

## Repository Navigation

| Area | Folder |
|---|---|
| Raw Data | `01_Dataset/` |
| SQL / MySQL | `02-SQL/` |
| Power BI | `03_PowerBI/` |
| Python | `04_Python/` |
| Documentation | `05_Documentation/` |

---

⭐ If you find this project useful, consider starring the repository.
