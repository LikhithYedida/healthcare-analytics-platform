-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Executive Overview KPI query.
-- Uses the rolling 12-month reporting window used by the Tableau dashboard.
WITH bounds AS (
    SELECT
        MAX(encounter_date) AS max_date,
        ADD_MONTHS(MAX(encounter_date), -12) AS min_date
    FROM gold.fact_encounter
),
enc AS (
    SELECT e.*
    FROM gold.fact_encounter e
    CROSS JOIN bounds b
    WHERE e.encounter_date > b.min_date
      AND e.encounter_date <= b.max_date
)
SELECT
    COUNT(DISTINCT patient_key) AS total_patients,
    COUNT(DISTINCT encounter_key) AS total_encounters,
    COUNT(DISTINCT CASE WHEN LOWER(encounter_class) = 'inpatient'
                        THEN encounter_key END) AS total_inpatient_encounters,
    AVG(CASE WHEN readmission_30d_flag = 1 THEN 1.0 ELSE 0.0 END) AS readmission_rate_30d,
    AVG(total_claim_cost) AS avg_cost_per_encounter,
    SUM(total_claim_cost) AS total_claim_cost
FROM enc;

-- Monthly encounter-volume trend by care setting.
SELECT
    DATE_TRUNC('MONTH', encounter_date) AS encounter_month,
    encounter_class,
    COUNT(DISTINCT encounter_key) AS encounter_count
FROM gold.fact_encounter
GROUP BY 1, 2
ORDER BY 1, 2;
