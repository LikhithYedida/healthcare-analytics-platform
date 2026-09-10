-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Reference model for the Gold dimensional layer created by
-- notebook 02_gold_dimensional_model.
--
-- Core dimensions used by the analytical marts:
--   dim_patient
--   dim_provider
--   dim_facility
--   dim_diagnosis
--   dim_procedure
--   dim_payer
--   dim_date
--
-- Core facts:
--   fact_encounter
--   fact_claim
--   fact_procedure
--   fact_readmission

-- Inspect final Gold contracts after notebook execution.
DESCRIBE TABLE gold.dim_patient;
DESCRIBE TABLE gold.dim_provider;
DESCRIBE TABLE gold.dim_facility;
DESCRIBE TABLE gold.dim_payer;
DESCRIBE TABLE gold.dim_date;
DESCRIBE TABLE gold.fact_encounter;
DESCRIBE TABLE gold.fact_claim;
DESCRIBE TABLE gold.fact_procedure;
DESCRIBE TABLE gold.fact_readmission;
