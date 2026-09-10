-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Provider Performance KPIs and ranking.
WITH provider_stats AS (
    SELECT
        provider_key,
        COUNT(DISTINCT encounter_key) AS encounter_count,
        COUNT(DISTINCT patient_key) AS distinct_patients,
        SUM(CASE WHEN readmission_30d_flag = 1 THEN 1 ELSE 0 END) AS readmissions_30d,
        AVG(total_claim_cost) AS avg_cost_per_encounter,
        SUM(CASE WHEN LOWER(encounter_class) = 'inpatient' THEN 1 ELSE 0 END) AS inpatient_encounters
    FROM gold.fact_encounter
    GROUP BY provider_key
)
SELECT
    p.provider_name,
    s.encounter_count,
    s.distinct_patients,
    s.avg_cost_per_encounter,
    s.inpatient_encounters,
    CASE
        WHEN s.encounter_count = 0 THEN NULL
        ELSE s.readmissions_30d * 1.0 / s.encounter_count
    END AS readmission_rate_30d
FROM provider_stats s
LEFT JOIN gold.dim_provider p
    ON s.provider_key = p.provider_key
ORDER BY encounter_count DESC;
