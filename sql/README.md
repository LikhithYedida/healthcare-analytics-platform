# SQL Analytics Layer

The Databricks notebooks are the implementation source of truth for this project:

1. `00_bronze_inventory_and_load`
2. `01_silver_core_transformations`
3. `02_gold_dimensional_model`
4. `03_gold_analytics_marts`
5. `04_data_quality_validation`

The SQL in this folder documents the analytical model and the logic used to support the Tableau layer.

Catalog / schemas confirmed from the project:
- Catalog: `healthcare_analytics`
- Schemas: `bronze`, `silver`, `gold`

The model follows the project design around patient, provider, facility, payer, encounter, claims,
procedure/clinical utilization, readmission, outcome, cost, and provider-performance analytics.

These scripts are portfolio/reproducibility artifacts. Upstream column contracts are created by the
Databricks transformation notebooks, so the notebook exports should be kept in the same repository.
