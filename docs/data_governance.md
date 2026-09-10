# Data Governance and HIPAA-Aware Design

## Scope
This project uses synthetic healthcare data for portfolio and educational purposes. It does not contain real patient records or real PHI.

## Governance Principles

### Data minimization
Only fields needed for the analytical use case should be exposed to downstream datasets.

### Least privilege
Production healthcare environments should restrict access to storage, compute, and analytics resources according to role.

### Secret management
Credentials must never be embedded in notebooks, SQL files, pipeline JSON, screenshots, or source control. Use managed identities, Azure Key Vault, and Databricks secret scopes where applicable.

### Encryption
Production healthcare workloads should use encryption in transit and at rest using platform-native Azure capabilities.

### Auditability
Pipeline execution, data access, failures, and transformations should be logged so that processing can be reviewed and reproduced.

### Environment separation
Development, test, and production resources should be isolated and configured independently.

### Data quality
The project includes checks for:
- null primary identifiers
- duplicate identifiers
- invalid timestamps
- negative costs
- encounter end before encounter start
- orphaned patient, provider, or facility relationships
- implausible derived ages

## HIPAA Awareness
HIPAA compliance depends on the complete operational, administrative, and technical environment, not merely source code. This repository therefore demonstrates HIPAA-aware engineering practices but does not claim that the portfolio project itself is a HIPAA-certified system.

## GitHub Publishing Rules
Before publishing:
- remove secrets and tokens
- remove storage account keys
- remove SAS URLs
- remove tenant/subscription identifiers when unnecessary
- do not upload real PHI
- use synthetic screenshots and data
- review notebook outputs for accidental credentials or identifiers
