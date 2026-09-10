# Tableau Dashboard Guide

The Healthcare Analytics Command Center contains six analytical views.

## 1. Executive Overview
Purpose: provide leadership with a high-level snapshot of healthcare activity and financial performance.

Core metrics:
- Total Patients
- Total Encounters
- Total Inpatient Encounters
- 30-Day Readmission Rate
- Average Cost per Encounter
- Total Claim Cost
- Encounter Volume Trend

## 2. Clinical Utilization
Purpose: understand how frequently clinical services are used and where event-level cost is concentrated.

Core metrics:
- Total Clinical Events
- Total Clinical Event Cost
- Average Cost per Event
- Distinct Clinical Codes
- Clinical Event Volume Trend
- Utilization by Event Type

## 3. Financial & Claims
Purpose: analyze claim costs, payer contributions, and patient responsibility.

Core metrics:
- Total Claim Cost
- Payer Coverage
- Average Claim Cost per Encounter
- Patient Responsibility
- Monthly Claim Cost Trend
- Claim Cost by Payer

## 4. Hospital Operations
Purpose: monitor encounter mix, utilization, duration, and facility efficiency.

Core metrics:
- Total Encounters
- Emergency Encounter %
- Inpatient Encounter %
- Average Encounter Duration
- Encounter Mix by Facility
- Facility Efficiency Matrix

## 5. Patient Outcomes
Purpose: analyze mortality and demographic patterns in the synthetic patient population.

Core metrics:
- Total Patients
- Deceased Patients
- Mortality Rate
- Average Patient Age
- Mortality Risk by Age / Gender
- Patient Outcomes by Age Group

## 6. Provider Performance
Purpose: compare provider workload and selected quality / utilization indicators.

Core metrics:
- Active Providers
- Total Encounters
- Average Encounters per Provider
- 30-Day Readmission Rate
- Provider Volume / Quality Ranking
- Provider Performance Heatmap

## Refresh Label
If Tableau is connected to a static portfolio extract, prefer a label such as `Data Snapshot` or `Extract Refreshed` rather than implying a live production refresh.
