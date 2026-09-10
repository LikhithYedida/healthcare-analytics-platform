# Healthcare Analytics Platform — Architecture

## Overview
This portfolio project demonstrates an end-to-end healthcare analytics platform built with Azure services, Databricks, Delta Lake, SQL, and Tableau.

The project uses synthetic healthcare data only. No real patient data or protected health information (PHI) is included in this repository.

## Architecture

Synthetic Synthea / FHIR-style healthcare data  
→ Azure Data Lake Storage Gen2  
→ Bronze raw layer  
→ Azure Data Factory orchestration  
→ Azure Databricks using PySpark / Spark SQL  
→ Delta Lake Silver curated layer  
→ Delta Lake Gold analytics layer  
→ Databricks SQL / analytics views  
→ Tableau dashboards

## Data Layers

### Bronze
The Bronze layer preserves raw source data with minimal transformation. It provides traceability and supports reprocessing.

Typical entities:
- patients
- encounters
- conditions
- procedures
- medications
- observations
- claims
- payers
- organizations
- providers

### Silver
The Silver layer standardizes types, removes duplicates, normalizes text fields, validates identifiers, and applies basic business rules.

### Gold
The Gold layer contains analytics-ready datasets supporting:
- Executive Overview
- Clinical Utilization
- Financial & Claims
- Hospital Operations
- Patient Outcomes
- Provider Performance

## Azure Components
- Azure Data Lake Storage Gen2: storage for Bronze, Silver, and Gold data
- Azure Data Factory: ingestion and orchestration
- Azure Databricks: PySpark transformations and Delta Lake processing
- Databricks SQL: analytical access to Gold tables
- Tableau: interactive visualization and portfolio dashboard

## Security and Portfolio Notes
- No credentials, connection strings, storage keys, SAS tokens, or Databricks access tokens are stored in GitHub.
- Environment-specific settings should be supplied through Azure Key Vault, Databricks secrets, or deployment configuration.
- The repository contains synthetic healthcare data logic only and is intended to demonstrate healthcare-aware analytics engineering practices.
