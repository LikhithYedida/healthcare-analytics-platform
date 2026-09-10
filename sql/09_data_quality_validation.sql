-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Gold table inventory.
SELECT
    table_name,
    table_type
FROM healthcare_analytics.information_schema.tables
WHERE table_schema = 'gold'
ORDER BY table_name;

-- Duplicate patient keys.
SELECT patient_key, COUNT(*) AS row_count
FROM gold.dim_patient
GROUP BY patient_key
HAVING COUNT(*) > 1;

-- Duplicate encounter keys.
SELECT encounter_key, COUNT(*) AS row_count
FROM gold.fact_encounter
GROUP BY encounter_key
HAVING COUNT(*) > 1;

-- Null critical encounter keys.
SELECT COUNT(*) AS invalid_rows
FROM gold.fact_encounter
WHERE encounter_key IS NULL
   OR patient_key IS NULL;

-- Encounter timestamps must be valid.
SELECT COUNT(*) AS invalid_time_rows
FROM gold.fact_encounter
WHERE encounter_stop < encounter_start;

-- Costs should not be negative.
SELECT COUNT(*) AS negative_cost_rows
FROM gold.fact_claim
WHERE total_claim_cost < 0
   OR payer_coverage < 0
   OR patient_responsibility < 0;

-- Referential integrity: encounter -> patient.
SELECT COUNT(*) AS orphan_patient_rows
FROM gold.fact_encounter e
LEFT JOIN gold.dim_patient p
    ON e.patient_key = p.patient_key
WHERE p.patient_key IS NULL;

-- Referential integrity: encounter -> provider.
SELECT COUNT(*) AS orphan_provider_rows
FROM gold.fact_encounter e
LEFT JOIN gold.dim_provider p
    ON e.provider_key = p.provider_key
WHERE e.provider_key IS NOT NULL
  AND p.provider_key IS NULL;
