-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Reconciliation checks intended to be run before Tableau screenshots/publication.

-- Patient population.
SELECT COUNT(DISTINCT patient_key) AS total_patients
FROM gold.dim_patient;

-- Encounter population.
SELECT
    COUNT(DISTINCT encounter_key) AS total_encounters,
    COUNT(DISTINCT patient_key) AS patients_with_encounters
FROM gold.fact_encounter;

-- Financial totals.
SELECT
    SUM(total_claim_cost) AS total_claim_cost,
    SUM(payer_coverage) AS payer_coverage,
    SUM(patient_responsibility) AS patient_responsibility
FROM gold.fact_claim;

-- Provider population.
SELECT
    COUNT(*) AS total_providers,
    COUNT(CASE WHEN active_flag = 1 THEN 1 END) AS active_providers
FROM gold.dim_provider;

-- Readmission rate.
SELECT
    AVG(CASE WHEN readmission_30d_flag = 1 THEN 1.0 ELSE 0.0 END) AS readmission_rate_30d
FROM gold.fact_readmission;

-- Mortality rate.
SELECT
    COUNT(DISTINCT patient_key) AS total_patients,
    SUM(CASE WHEN deceased_flag = 1 THEN 1 ELSE 0 END) AS deceased_patients,
    AVG(CASE WHEN deceased_flag = 1 THEN 1.0 ELSE 0.0 END) AS mortality_rate
FROM gold.dim_patient;
