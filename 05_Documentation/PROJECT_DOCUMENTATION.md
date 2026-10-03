# PROJECT DOCUMENTATION
## Telecom Customer Churn Analysis — SQL + Python + Power BI

## 1. Executive Summary

This project is an end-to-end telecom customer churn analytics solution designed to demonstrate practical Data Analyst / Business Intelligence skills.

The solution connects three technical layers:

**MySQL → Python → Power BI**

- **MySQL** provides database setup, data loading, validation, cleaning, reusable analytical views, business analysis and rule-based customer-risk logic.
- **Python** provides exploratory data analysis, feature engineering, segmentation, visualization, business KPI generation and supervised machine-learning analysis.
- **Power BI** provides interactive reporting, KPI cards, slicers, navigation, report-page tooltips, conditional formatting and executive business storytelling.

The project therefore demonstrates more than a standalone dashboard or notebook: it shows a complete analytical workflow from raw data through data preparation, analysis, modeling and business communication.

---

# 2. Business Objective

Telecom companies need to understand customer churn because losing customers can affect recurring revenue and retention performance.

The project addresses the following business questions:

1. What is the observed customer churn rate?
2. Which customer segments show higher observed churn?
3. How does churn vary by contract type?
4. How does churn vary across tenure cohorts?
5. How does churn differ by internet service?
6. How does churn differ by payment method?
7. How are customer-service factors such as tech support, online security and online backup associated with churn?
8. What recurring monthly revenue is associated with churn?
9. Which active customers meet the rule-based risk criteria?
10. Can machine-learning models provide an additional churn-classification perspective?
11. How can all findings be presented in an executive-friendly dashboard?

---

# 3. Source Data

The project uses a telecom customer churn CSV dataset stored locally under:

```text
01_Dataset/
└── telco_data.csv
```

The Python notebook documents a **7,043-row** source population in its project objectives.

The project should preserve the distinction between:

- the original/raw dataset,
- the cleaned/validated analytical dataset,
- SQL analytical views,
- Python analytical outputs,
- Power BI reporting outputs.

### Data publication note

Before making the repository public, verify that the source dataset can legally be redistributed. If redistribution rights are unclear, keep the raw CSV outside the public GitHub repository and document how the reviewer can obtain the dataset.

---

# 4. End-to-End Architecture

```text
                    RAW TELECOM DATA
                           │
                           ▼
                    ┌─────────────┐
                    │   MySQL     │
                    │             │
                    │ DB Setup    │
                    │ Table Setup │
                    │ Data Load   │
                    │ Validation  │
                    │ Cleaning    │
                    │ SQL Views   │
                    │ Analysis    │
                    │ Risk Logic  │
                    └──────┬──────┘
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
       ┌─────────────┐           ┌─────────────┐
       │   Python    │           │  Power BI   │
       │             │           │             │
       │ EDA         │           │ Data Model  │
       │ Segments    │           │ DAX / KPIs  │
       │ KPIs        │           │ Slicers     │
       │ ML Models   │           │ Tooltips    │
       │ Evaluation  │           │ Navigation  │
       └──────┬──────┘           └──────┬──────┘
              │                         │
              └────────────┬────────────┘
                           ▼
                  BUSINESS INSIGHTS
                           │
                           ▼
                 RETENTION / RISK /
                 REVENUE ANALYSIS
```

---

# 5. Repository Structure

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

---

# 6. SQL / MySQL Implementation

## 6.1 Database Setup

Folder:

```text
02-SQL/01_Database_Setup/
```

Purpose:

- Create the telecom churn database.
- Establish the project database context.

Example workflow:

```sql
CREATE DATABASE telecom_churn;
USE telecom_churn;
```

---

## 6.2 Table Setup

Folder:

```text
02-SQL/02_Table_Setup/
```

Purpose:

- Define the customer table.
- Assign appropriate data types.
- Establish the analytical table structure before loading data.

Important data fields include customer identifiers, demographic fields, tenure, contract information, services, payment method, monthly charges, total charges and churn status.

---

# 7. Data Loading

Folder:

```text
02-SQL/03_Data_Load/
```

The project encountered MySQL local-file restrictions during development, including:

- Error 3948 — local data loading disabled
- Error 2068 — `LOAD DATA LOCAL INFILE` request rejected
- Error 1292 — incorrect integer conversion such as `'1.0'`

These issues were treated as data-engineering/configuration problems rather than ignored.

The final workflow should verify:

- File accessibility
- Client/server local-load settings where applicable
- CSV delimiter and encoding
- Column order
- Data types
- Numeric conversion requirements

---

# 8. SQL Data Validation

Folder:

```text
02-SQL/04_Data_Validation/
```

Validation includes:

### Row count

Confirms the number of loaded records.

### Duplicate checks

Checks whether customer identifiers contain unexpected duplicates.

### Null checks

Identifies missing values that could affect analysis.

### Data-type checks

Confirms numeric and categorical fields are loaded in usable formats.

### Category validation

Checks expected business categories such as:

- Contract type
- Internet service
- Payment method
- Churn status
- Support/service categories

---

# 9. SQL Data Cleaning

Folder:

```text
02-SQL/05_Data_Cleaning/
```

Purpose:

- Standardize fields
- Resolve invalid values
- Prepare data for analytical views
- Ensure downstream Power BI and Python analysis uses consistent business definitions

Cleaning should be documented rather than silently changing the source population.

---

# 10. Analytical SQL Views

Folder:

```text
02-SQL/06_Analytical_Views/
```

The project uses reusable views to centralize analytical logic.

Important view:

```text
vw_customer_churn_analysis
```

The view provides standardized fields such as:

- Customer ID
- Demographics
- Tenure
- Contract
- Internet service
- Security/support services
- Payment method
- Monthly charges
- Total charges
- Churn status
- Binary churn flag

This allows the business-analysis queries and Power BI layer to use a consistent analytical definition.

---

# 11. SQL Business Analysis

Folder:

```text
02-SQL/07_Business_Analysis/
```

The project separates business analysis into focused SQL files covering areas such as:

```text
01_overall_churn.sql
02_contract_churn.sql
03_internet_churn.sql
04_payment_churn.sql
05_tenure_churn.sql
06_tech_support_churn.sql
07_online_backup_churn.sql
08_revenue_analysis.sql
```

This structure demonstrates modular SQL development rather than placing the entire analysis in one large script.

---

# 12. Customer Risk Analysis

Folder:

```text
02-SQL/08_Customer_Risk/
```

The project implements a **rule-based risk framework**.

Risk factors include business-defined conditions involving:

- Contract type
- Tenure
- Internet service
- Online security
- Tech support
- Payment method
- Monthly charges

The output includes:

```text
customer_id
risk_score
risk_category
```

with categories such as:

```text
High Risk
Medium Risk
Low Risk
```

### Important distinction

The SQL risk score is **not an ML prediction**.

It is a transparent business-rule score designed to support customer segmentation and retention analysis.

---

# 13. Python Analytics

Folder:

```text
04_Python/
```

Main files:

```text
Telecom_Customer_Churn_Analysis.ipynb
Telecom_Customer_Churn_Analysis.py
requirements.txt
```

---

## 13.1 Python Project Setup

The notebook configures:

- Project root
- Dataset path
- Output directories
- Random seed
- Visualization settings
- Python dependencies

The project is designed around the five-folder architecture so that outputs are separated from the raw dataset and Power BI files.

---

# 14. Python Data Preparation

Python uses Pandas/NumPy for:

- Data loading
- Dataset profiling
- Data-type inspection
- Missing-value analysis
- Numeric conversion
- Feature engineering
- Churn flag creation
- Tenure cohort creation
- Model-ready preprocessing

A key design principle is to avoid using ML imputation to alter financial reporting.

The notebook explicitly distinguishes:

- **Observed revenue KPIs** — based on available `MonthlyCharges`
- **ML preprocessing** — where imputation can be applied inside the model pipeline

This prevents model preprocessing from silently changing business revenue totals.

---

# 15. Exploratory Data Analysis

Python EDA evaluates churn patterns across:

- Contract
- Tenure
- Monthly charges
- Gender
- Senior citizen status
- Internet service
- Payment method
- Tech support
- Online security
- Online backup
- Partner
- Dependents
- Tenure cohorts

Charts are saved under:

```text
04_Python/outputs/Charts/
```

---

# 16. Python Business KPIs

Folder:

```text
04_Python/outputs/KPI/
```

The project generates KPI outputs such as:

- Total customers
- Churned customers
- Retained customers
- Churn rate
- Retention rate
- Observed monthly revenue
- Churned monthly revenue
- Revenue-at-risk percentage

These outputs can be reused in documentation or compared with the Power BI dashboard.

---

# 17. Python Segment Analysis

Folder:

```text
04_Python/outputs/Segment_Analysis/
```

A reusable churn-rate function creates standardized segment tables containing:

```text
Segment
Customers
Churned Customers
Churn Rate
```

The project creates segment-level analysis for dimensions such as:

- Contract
- Tenure cohort
- Internet service
- Payment method
- Tech support
- Online security
- Online backup
- Senior citizen status
- Partner
- Dependents
- Gender

The consolidated portfolio output is:

```text
churn_rate_by_segment.csv
```

This is useful because the analysis becomes reusable outside the notebook.

---

# 18. Machine Learning

The Python project includes classification models:

### Logistic Regression

Provides an interpretable baseline for churn classification.

### Random Forest

Provides a tree-based ensemble model capable of capturing nonlinear relationships.

### Gradient Boosting

Provides another ensemble classification approach for comparison.

---

# 19. ML Preprocessing

The project uses a Scikit-learn preprocessing pipeline.

Typical steps include:

```text
Numeric features
    → Missing-value imputation
    → Standard scaling

Categorical features
    → Missing-value handling
    → One-hot encoding
```

This keeps preprocessing inside the modeling pipeline and reduces the risk of inconsistent train/test transformations.

---

# 20. ML Evaluation

Models are evaluated using:

- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- Confusion matrices
- ROC curve comparison

Outputs are saved under:

```text
04_Python/outputs/Model/
```

### Interpretation

The metrics describe model performance on the evaluated test dataset.

They should not be interpreted as guaranteed production performance.

---

# 21. Data Quality Reporting

Folder:

```text
04_Python/outputs/Data_Quality/
```

The project generates:

```text
data_quality_report.csv
```

This provides a reusable record of data-quality checks.

---

# 22. Automated Business Insights

Folder:

```text
04_Python/outputs/Insights/
```

The project generates:

```text
business_insights.txt
```

This separates the analytical calculations from the final narrative.

The insights should cover:

- Overall churn
- Contract
- Tenure
- Internet service
- Payment method
- Tech support
- Revenue exposure
- Customer risk

The generated insight file should contain actual calculated values from the current run.

---

# 23. Power BI Implementation

Folder:

```text
03_PowerBI/
```

Main deliverable:

```text
Telecom_Customer_Churn.pbix
```

The dashboard is designed as an interactive business-reporting layer.

---

# 24. Power BI Dashboard Pages

## Page 1 — Executive Overview

Purpose:

Provide an executive-level summary of churn and major business dimensions.

Key elements include:

- KPI cards
- Overall churn
- Contract churn
- Tenure churn
- Internet-service churn
- Payment-method churn
- Revenue exposure
- Navigation controls
- Insight text

The page is designed to answer:

> What is happening with customer churn and where should the analyst investigate?

---

## Page 2 — Customer Drivers

Purpose:

Understand customer characteristics associated with different observed churn levels.

Analysis includes:

- Gender
- Partner
- Dependents
- Senior citizen
- Tech support
- Online security
- Online backup
- Other customer/service drivers

The page uses bar-based comparisons and business insight text to make segment differences easier to interpret.

---

## Page 3 — Revenue & Contracts

Purpose:

Connect churn behavior with contract and revenue dimensions.

Analysis includes:

- Revenue KPIs
- Contract analysis
- Churned revenue
- Monthly charge distribution
- Tenure/revenue analysis
- Monthly charge band
- Interactive filters
- Reset Filters functionality

---

## Page 4 — Risk & Retention

Purpose:

Translate the SQL rule-based customer-risk logic into a business-facing retention view.

Key elements include:

- Active customers
- High-risk customers
- High-risk percentage
- High-risk revenue
- Risk category
- Risk score
- Customer detail table
- Risk slicer
- Risk-score sorting
- Semantic risk formatting

The page distinguishes transparent business-rule risk scoring from ML classification.

---

# 25. Power BI Interactivity

The dashboard includes:

### Slicers

Used for controlled filtering of business dimensions.

### Navigation

Allows movement between dashboard pages.

### Reset Filters

Provides a consistent way to return the page to its default state.

### Tooltips

A report-page tooltip concept is used to provide additional context without overcrowding the main dashboard.

The project includes a churn-segment tooltip approach and uses tooltip pages on relevant visuals while avoiding unnecessary tooltip behavior on KPI cards.

### Smart Narrative / Insight Text

Used to provide context alongside visual analysis.

---

# 26. Power BI Visual Design

The dashboard design focuses on:

- Consistent typography
- Consistent spacing
- Alignment
- Clear titles
- Currency formatting
- Semantic risk categories
- Controlled color usage
- Readable labels
- Consistent slicer styling
- Navigation consistency

The objective is to make the dashboard suitable for an executive/business audience rather than presenting a collection of unrelated charts.

---

# 27. SQL vs Python vs Power BI Responsibilities

| Requirement | SQL | Python | Power BI |
|---|:---:|:---:|:---:|
| Database setup | ✅ | | |
| Data loading | ✅ | ✅ | |
| Data validation | ✅ | ✅ | |
| Data cleaning | ✅ | ✅ | |
| Reusable analytical views | ✅ | | |
| Business aggregations | ✅ | ✅ | ✅ |
| Exploratory analysis | | ✅ | |
| Statistical/ML analysis | | ✅ | |
| Model evaluation | | ✅ | |
| Rule-based customer risk | ✅ | | ✅ |
| KPI reporting | ✅ | ✅ | ✅ |
| Interactive dashboard | | | ✅ |
| DAX measures | | | ✅ |
| Slicers | | | ✅ |
| Tooltips | | | ✅ |
| Navigation | | | ✅ |
| Executive storytelling | | | ✅ |

---

# 28. Key Technical Skills Demonstrated

## SQL / MySQL

- Database design
- Table creation
- Data loading
- Data validation
- Data cleaning
- `SELECT`
- `WHERE`
- `GROUP BY`
- `CASE`
- CTEs
- Aggregations
- SQL views
- Business logic
- Customer-risk scoring
- Revenue analysis

## Python

- Python programming
- Pandas
- NumPy
- Data profiling
- Data cleaning
- Feature engineering
- EDA
- Segmentation
- Automated exports
- Matplotlib
- Seaborn
- Reproducible analysis

## Machine Learning

- Scikit-learn
- Classification
- Logistic Regression
- Random Forest
- Gradient Boosting
- Train/test split
- Pipelines
- Imputation
- Scaling
- One-hot encoding
- Confusion matrices
- ROC curves
- ROC-AUC
- Precision
- Recall
- F1-score

## Power BI

- Data modeling
- DAX
- KPI cards
- Interactive visualizations
- Slicers
- Conditional formatting
- Tooltips
- Navigation
- Reset filters
- Smart narrative
- Dashboard UX
- Business storytelling

## Business Analytics

- Customer churn analysis
- Customer segmentation
- Retention analysis
- Revenue exposure
- Risk segmentation
- KPI reporting
- Root-cause-oriented analysis
- Executive reporting

---

# 29. Reproducibility

The project separates:

```text
Raw Data
    ↓
SQL
    ↓
Python
    ↓
Power BI
    ↓
Documentation
```

This makes it easier for another analyst to understand where each output originated.

Python outputs are categorized into:

```text
KPI
Charts
Segment_Analysis
Model
Data_Quality
Insights
```

This is preferable to manually mixing CSV, PNG and TXT files in one output directory.

---

# 30. Quality Assurance Checklist

Before final GitHub submission, verify:

### SQL

- [ ] Database script runs
- [ ] Table script runs
- [ ] Data load is documented
- [ ] Row count validated
- [ ] Duplicate checks completed
- [ ] Null checks completed
- [ ] Data types validated
- [ ] Categories validated
- [ ] Cleaning script completed
- [ ] Analytical views created
- [ ] Business analysis scripts organized
- [ ] Risk view validated

### Python

- [ ] Kernel restarted
- [ ] Run All completes without errors
- [ ] Dataset path works
- [ ] KPI CSV generated
- [ ] Segment CSV generated
- [ ] Charts generated
- [ ] Model metrics generated
- [ ] Model comparison generated
- [ ] Data-quality report generated
- [ ] Business insights TXT generated

### Power BI

- [ ] Executive Overview completed
- [ ] Customer Drivers completed
- [ ] Revenue & Contracts completed
- [ ] Risk & Retention completed
- [ ] KPI formatting checked
- [ ] Currency formatting checked
- [ ] Labels checked
- [ ] Alignment checked
- [ ] Slicers checked
- [ ] Reset Filters tested
- [ ] Navigation tested
- [ ] Tooltips tested
- [ ] Cross-filtering tested
- [ ] Risk colors checked

### GitHub

- [ ] Root README added
- [ ] SQL folders organized
- [ ] Power BI file/screenshots organized
- [ ] Python notebook added
- [ ] Python script added
- [ ] requirements.txt added
- [ ] Documentation added
- [ ] `.gitignore` added
- [ ] No unnecessary temporary files
- [ ] No machine-specific paths in committed documentation
- [ ] Dataset redistribution rights checked

---

# 31. Business Interpretation and Limitations

The project should be presented as an analytical portfolio project.

Important limitations:

1. Segment-level churn comparisons are descriptive.
2. An observed association does not establish causation.
3. SQL risk categories are business rules and should not be presented as statistically calibrated probabilities.
4. ML metrics are dependent on the available dataset and evaluation design.
5. Revenue-at-risk methodology should be interpreted according to the project's defined revenue calculation.
6. A model should not be treated as a production retention system without additional validation, monitoring and business testing.

---

# 32. Recommended Business Use

The outputs can support exploratory questions for:

- Customer-retention teams
- Marketing teams
- Customer-service teams
- Revenue teams
- Business-intelligence teams
- Operations leaders

Potential next analytical steps include:

- Cohort retention analysis
- Customer lifetime value analysis
- Survival analysis
- Cost-sensitive churn modeling
- Model calibration
- A/B testing of retention interventions
- Time-series churn monitoring
- Production model monitoring

These are future extensions rather than requirements for the current portfolio project.

---

# 33. Portfolio Story

The strongest way to present this project is:

> **I built an end-to-end telecom customer churn analytics solution using MySQL, Python and Power BI. I validated and transformed the customer data in SQL, created reusable analytical views and rule-based risk logic, performed EDA and churn segmentation in Python, evaluated classification models, and built an interactive Power BI dashboard for executive KPI monitoring, churn-driver analysis, revenue exposure and customer-risk analysis.**

This communicates both technical capability and business understanding.

---

# 34. Final Skill Summary

### Data Engineering
**MySQL | SQL | Data Validation | Data Cleaning | Analytical Views**

### Data Analysis
**Python | Pandas | NumPy | EDA | Segmentation | KPI Analysis**

### Machine Learning
**Scikit-learn | Classification | Logistic Regression | Random Forest | Gradient Boosting | Model Evaluation**

### Business Intelligence
**Power BI | DAX | Data Modeling | KPI Dashboards | Slicers | Tooltips | Navigation**

### Business Skills
**Customer Churn | Retention | Revenue Analysis | Risk Segmentation | Business Insights | Executive Reporting**

---

# 35. Final Deliverables

The completed portfolio should contain:

```text
01_Dataset/
    telco_data.csv

02-SQL/
    SQL scripts organized by workflow

03_PowerBI/
    Telecom_Customer_Churn.pbix
    Screenshots/

04_Python/
    Telecom_Customer_Churn_Analysis.ipynb
    Telecom_Customer_Churn_Analysis.py
    requirements.txt
    outputs/

05_Documentation/
    README.md
    PROJECT_DOCUMENTATION.md
    Business_Insights.txt
    PowerBI_Documentation.md
```

---

## Final Project Statement

**Telecom Customer Churn Analysis is an end-to-end Data Analytics and Business Intelligence portfolio project combining SQL data engineering, Python analytics and machine learning, and Power BI dashboard development to transform customer data into structured, decision-oriented churn, revenue and risk insights.**
