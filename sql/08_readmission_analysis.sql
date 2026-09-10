-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- 30-day readmission analysis.
SELECT
    COUNT(*) AS eligible_encounters,
    SUM(CASE WHEN readmission_30d_flag = 1 THEN 1 ELSE 0 END) AS readmissions_30d,
    AVG(CASE WHEN readmission_30d_flag = 1 THEN 1.0 ELSE 0.0 END) AS readmission_rate_30d
FROM gold.fact_readmission;

-- Readmissions by facility.
SELECT
    f.facility_name,
    COUNT(*) AS eligible_encounters,
    SUM(CASE WHEN r.readmission_30d_flag = 1 THEN 1 ELSE 0 END) AS readmissions_30d,
    AVG(CASE WHEN r.readmission_30d_flag = 1 THEN 1.0 ELSE 0.0 END) AS readmission_rate_30d
FROM gold.fact_readmission r
LEFT JOIN gold.dim_facility f
    ON r.facility_key = f.facility_key
GROUP BY f.facility_name
ORDER BY readmission_rate_30d DESC;
