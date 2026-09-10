-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Hospital Operations KPIs.
SELECT
    COUNT(DISTINCT encounter_key) AS total_encounters,
    AVG(CASE WHEN LOWER(encounter_class) = 'emergency' THEN 1.0 ELSE 0.0 END)
        AS emergency_encounter_pct,
    AVG(CASE WHEN LOWER(encounter_class) = 'inpatient' THEN 1.0 ELSE 0.0 END)
        AS inpatient_encounter_pct,
    AVG(encounter_duration_hours) AS avg_encounter_duration_hours
FROM gold.fact_encounter;

-- Encounter mix by facility and care setting.
SELECT
    f.facility_name,
    e.encounter_class,
    COUNT(DISTINCT e.encounter_key) AS encounter_count
FROM gold.fact_encounter e
LEFT JOIN gold.dim_facility f
    ON e.facility_key = f.facility_key
GROUP BY f.facility_name, e.encounter_class
ORDER BY encounter_count DESC;

-- Facility efficiency matrix.
SELECT
    f.facility_name,
    AVG(e.total_claim_cost) AS avg_cost_per_encounter,
    AVG(e.encounter_duration_hours) AS avg_encounter_duration_hours,
    COUNT(DISTINCT e.encounter_key) AS encounter_count
FROM gold.fact_encounter e
LEFT JOIN gold.dim_facility f
    ON e.facility_key = f.facility_key
GROUP BY f.facility_name;
