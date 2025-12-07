/* ============================================
   COVID-19 Analysis SQL Script  
   Author: Likhith Yedida  
   Project: COVID-19 Analytics Dashboard (USA)
   ============================================ */

/* 1. Total new confirmed cases */
SELECT 
    SUM(new_confirmed) AS total_cases
FROM google_epidemiology;

/* 2. Total deaths */
SELECT 
    SUM(new_deceased) AS total_deaths
FROM google_epidemiology;

/* 3. Total tests */
SELECT 
    SUM(new_tested) AS total_tests
FROM google_epidemiology;

/* 4. Daily positivity rate */
SELECT 
    date,
    new_confirmed,
    new_tested,
    CASE 
        WHEN new_tested = 0 THEN NULL
        ELSE (new_confirmed * 1.0 / new_tested)
    END AS positivity_rate
FROM google_epidemiology;

/* 5. Cumulative confirmed cases over time */
SELECT
    date,
    cumulative_confirmed
FROM google_epidemiology
ORDER BY date;

/* 6. New cases by year */
SELECT
    YEAR(date) AS yyyy,
    SUM(new_confirmed) AS total_new_cases
FROM google_epidemiology
GROUP BY YEAR(date)
ORDER BY yyyy;

/* 7. Monthly trends */
SELECT
    YEAR(date) AS yyyy,
    MONTH(date) AS mm,
    SUM(new_confirmed) AS monthly_cases,
    SUM(new_deceased) AS monthly_deaths,
    SUM(new_tested) AS monthly_tests
FROM google_epidemiology
GROUP BY YEAR(date), MONTH(date)
ORDER BY yyyy, mm;

/* 8. Case Fatality Rate (CFR) */
SELECT
    (SUM(new_deceased) * 1.0 / SUM(new_confirmed)) AS cfr
FROM google_epidemiology;

/* 9. Recovery estimate */
SELECT
    SUM(new_confirmed) - SUM(new_deceased) AS estimated_recoveries
FROM google_epidemiology;

/* 10. Recovery rate */
SELECT
    (SUM(new_confirmed) - SUM(new_deceased)) * 1.0 / SUM(new_confirmed)
    AS recovery_rate
FROM google_epidemiology;

/* 11. Peak day for new cases */
SELECT TOP 1
    date,
    new_confirmed
FROM google_epidemiology
ORDER BY new_confirmed DESC;

/* 12. Daily case growth (difference from previous day) */
SELECT
    date,
    new_confirmed,
    new_confirmed - LAG(new_confirmed) OVER (ORDER BY date) AS daily_case_change
FROM google_epidemiology;

/* END */
