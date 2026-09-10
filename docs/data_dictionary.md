# Data Dictionary

This dictionary documents the core analytical entities used by the Healthcare Analytics Platform. Field names may vary slightly from the original synthetic source files.

## Patients
| Field | Description |
|---|---|
| patient_id | Unique synthetic patient identifier |
| birth_date | Patient date of birth |
| death_date | Date of death when applicable |
| gender | Synthetic patient gender |
| race | Synthetic patient race |
| ethnicity | Synthetic patient ethnicity |
| city | Patient city |
| state | Patient state |
| postal_code | Patient postal code |

## Encounters
| Field | Description |
|---|---|
| encounter_id | Unique encounter identifier |
| patient_id | Patient associated with the encounter |
| provider_id | Provider associated with the encounter |
| organization_id | Facility or organization identifier |
| encounter_start | Encounter start timestamp |
| encounter_stop | Encounter end timestamp |
| encounter_class | Encounter category such as ambulatory, emergency, or inpatient |
| base_cost | Base encounter cost |
| total_claim_cost | Total claim amount |
| payer_coverage | Amount covered by payer |
| patient_responsibility | Amount assigned to patient |

## Clinical Events
Clinical events may include conditions, procedures, medications, and observations.

| Field | Description |
|---|---|
| event_id | Unique event identifier |
| patient_id | Patient identifier |
| encounter_id | Related encounter |
| event_type | condition / procedure / medication / observation |
| code | Clinical code |
| description | Human-readable description |
| event_date | Event date |
| event_cost | Event-level cost when available |

## Providers
| Field | Description |
|---|---|
| provider_id | Unique provider identifier |
| organization_id | Associated organization |
| provider_name | Synthetic provider name |
| specialty | Provider specialty |
| active_flag | Indicates whether the provider is active |

## Organizations
| Field | Description |
|---|---|
| organization_id | Unique facility identifier |
| organization_name | Facility name |
| city | Facility city |
| state | Facility state |

## Payers
| Field | Description |
|---|---|
| payer_id | Unique payer identifier |
| payer_name | Payer name |

## Gold Metrics
The Gold layer derives metrics such as:
- patient count
- encounter count
- inpatient encounter count
- emergency encounter percentage
- average encounter duration
- readmission rate
- mortality rate
- average patient age
- average cost per encounter
- total claim cost
- payer coverage
- patient responsibility
- provider encounter volume
