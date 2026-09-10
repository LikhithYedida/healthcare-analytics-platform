# Azure Data Factory Artifacts

This folder documents the ingestion/orchestration layer of the Healthcare Analytics Platform.

## Confirmed project object

- Data Factory pipeline: `pl_ingest_synthea_to_bronze`
- Purpose: copy synthetic Synthea CSV files into the Bronze landing area before Databricks processing
- Downstream Databricks catalog: `healthcare_analytics`
- Databricks Bronze volume used by the project: `/Volumes/healthcare_analytics/bronze/synthea_raw`

## Files

- `pl_ingest_synthea_to_bronze.json` — sanitized portfolio representation of the ADF Copy pipeline
- `ds_synthea_source.json` — sanitized source dataset contract
- `ds_bronze_sink.json` — sanitized Bronze sink dataset contract

## Important

The original Azure Data Factory environment contains environment-specific linked services and storage configuration.
Those values are intentionally not committed to GitHub. Placeholder linked-service/container values in this folder
must be replaced before attempting deployment.

No credentials, storage keys, SAS tokens, tenant secrets, or passwords are included.

## End-to-end flow

Synthea CSV
→ Azure Data Factory (`pl_ingest_synthea_to_bronze`)
→ Bronze landing
→ Databricks notebook `00_bronze_inventory_and_load`
→ Silver transformations
→ Gold dimensional model
→ Analytics marts
→ Data-quality validation
→ Tableau
