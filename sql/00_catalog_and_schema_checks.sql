-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

SHOW SCHEMAS;

SHOW TABLES IN bronze;
SHOW TABLES IN silver;
SHOW TABLES IN gold;

-- Useful inventory query for GitHub/reconciliation.
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM healthcare_analytics.information_schema.tables
WHERE table_schema IN ('bronze', 'silver', 'gold')
ORDER BY table_schema, table_name;
