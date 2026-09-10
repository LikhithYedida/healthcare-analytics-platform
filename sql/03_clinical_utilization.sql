-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Clinical utilization summary.
-- The Gold procedure/clinical event layer supports the Tableau Clinical Utilization page.
SELECT
    COUNT(*) AS total_clinical_events,
    SUM(COALESCE(event_cost, 0)) AS total_clinical_event_cost,
    AVG(COALESCE(event_cost, 0)) AS avg_cost_per_event,
    COUNT(DISTINCT clinical_code) AS distinct_clinical_codes
FROM gold.fact_procedure;

-- Event volume by month and event type.
SELECT
    DATE_TRUNC('MONTH', event_date) AS event_month,
    event_type,
    COUNT(*) AS event_count,
    SUM(COALESCE(event_cost, 0)) AS event_cost
FROM gold.fact_procedure
GROUP BY 1, 2
ORDER BY 1, 2;

-- Utilization by event type.
SELECT
    event_type,
    COUNT(*) AS event_count
FROM gold.fact_procedure
GROUP BY event_type
ORDER BY event_count DESC;
