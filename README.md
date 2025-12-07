# 🦠 COVID-19 Analytics Dashboard (USA)
### End-to-End Data Analytics Project using SQL + Power BI

This project analyzes the progression of COVID-19 in the United States by combining  
📊 **Power BI**, 🗄️ **SQL**, and 📁 **CSV datasets** from Google COVID-19 Open Data.  
It demonstrates a complete analytics pipeline—from raw data → SQL exploration → Power BI modeling → dashboard → insights.

---

# 🚀 Project Overview

| Component | Description |
|----------|-------------|
| **Data Source** | Google Epidemiology Dataset |
| **Technologies Used** | Power BI, DAX, Power Query (M), SQL |
| **KPIs Included** | Total Cases, Total Deaths, Total Recoveries, CFR %, Positivity %, Recovery Rate % |
| **Interactive Features** | Year slicer (2020–2022), trend charts, dynamic KPIs |
| **Business Goal** | Provide a clear, interactive overview of COVID-19 trends in the USA |

---

# 📂 Repository Structure

covid19/
│
├── data/
│ └── google_epidemiology.csv
│
├── images/
│ ├── dashboard_full.png
│ ├── kpi_section.png
│ ├── slicer.png
│ └── data_model.png
│
├── powerbi/
│ └── covid19_report.pbix
│
└── sql/
└── covid_analysis.sql

yaml
Copy code

---

# 📸 Dashboard Preview

### Full Dashboard  
![Dashboard](images/dashboard_full.png)

### KPI Cards  
![KPIs](images/kpi_section.png)

### Year Slicer  
![Slicer](images/slicer.png)

### Data Model  
![Model](images/data_model.png)

---

# 🛠️ Tools & Techniques

### ⚙️ Power Query (M)
- Cleaned NULL, duplicate, and invalid rows  
- Converted text fields to proper numeric types  
- Replaced Infinity and NaN with null  
- Added calculated rate columns  
- Ensured integer/decimal consistency

### 🧮 DAX Measures (Used in the Dashboard)

```DAX
Total Cases =
SUM(google_epidemiology[new_confirmed])

Total Deaths =
SUM(google_epidemiology[new_deceased])

Total Tests =
SUM(google_epidemiology[new_tested])

Estimated_Recoveries =
SUM(google_epidemiology[new_confirmed]) -
SUM(google_epidemiology[new_deceased])

Recovery Rate % =
DIVIDE([Estimated_Recoveries], [Total Cases], 0)

CFR % =
DIVIDE([Total Deaths], [Total Cases], 0)

Positivity % =
DIVIDE([Total Cases], [Total Tests], 0)
🗄️ SQL Analysis (Preview)
Full script available in sql/covid_analysis.sql.

sql
Copy code
SELECT SUM(new_confirmed) AS total_cases
FROM google_epidemiology;

SELECT SUM(new_deceased) AS total_deaths
FROM google_epidemiology;

SELECT
    YEAR(date) AS year,
    SUM(new_confirmed) AS yearly_new_cases
FROM google_epidemiology
GROUP BY YEAR(date)
ORDER BY year;
📊 Key Insights
🟥 Spread Trends
Confirmed cases show strong surge in 2020–2021 before stabilizing.

🟦 Positivity Rate
Positivity high early due to limited testing availability.

🟩 Recovery Pattern
Estimated recovery rate consistently above 95% after early months.

🟨 Severity (CFR%)
CFR remains below 1%, showing healthcare effectiveness.

🧩 Dashboard Features
✔ KPI cards for summary metrics
✔ Year slicer for dynamic filtering
✔ Case trend line chart (yearly)
✔ Cumulative case comparison
✔ Mortality, recovery and positivity metrics
✔ Clean and minimal design for insightful reading

Author: Likhith Yedida.
