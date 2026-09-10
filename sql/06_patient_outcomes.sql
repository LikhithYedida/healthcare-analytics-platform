-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Patient Outcomes KPIs.
SELECT
    COUNT(DISTINCT patient_key) AS total_patients,
    COUNT(DISTINCT CASE WHEN deceased_flag = 1 THEN patient_key END) AS deceased_patients,
    AVG(CASE WHEN deceased_flag = 1 THEN 1.0 ELSE 0.0 END) AS mortality_rate,
    AVG(patient_age) AS avg_patient_age
FROM gold.dim_patient;

-- Mortality risk by age band and gender.
SELECT
    age_band,
    gender,
    COUNT(DISTINCT patient_key) AS patients,
    AVG(CASE WHEN deceased_flag = 1 THEN 1.0 ELSE 0.0 END) AS mortality_rate
FROM gold.dim_patient
GROUP BY age_band, gender
ORDER BY
    CASE age_band
        WHEN '0-17' THEN 1
        WHEN '18-34' THEN 2
        WHEN '35-49' THEN 3
        WHEN '50-64' THEN 4
        WHEN '65-79' THEN 5
        WHEN '80+' THEN 6
        ELSE 99
    END,
    gender;

-- Living vs deceased outcome by age band.
SELECT
    age_band,
    CASE WHEN deceased_flag = 1 THEN 'Deceased' ELSE 'Living' END AS outcome_status,
    COUNT(DISTINCT patient_key) AS patient_count
FROM gold.dim_patient
GROUP BY age_band,
         CASE WHEN deceased_flag = 1 THEN 'Deceased' ELSE 'Living' END;
