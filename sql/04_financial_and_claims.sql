-- Healthcare Analytics Platform
-- Databricks SQL
-- Catalog: healthcare_analytics
-- Synthetic healthcare data only; no real PHI is included.

USE CATALOG healthcare_analytics;

-- Financial & Claims KPIs.
SELECT
    SUM(total_claim_cost) AS total_claim_cost,
    CASE
        WHEN SUM(total_claim_cost) = 0 THEN NULL
        ELSE SUM(payer_coverage) / SUM(total_claim_cost)
    END AS payer_coverage_pct,
    AVG(total_claim_cost) AS avg_claim_cost_per_encounter,
    SUM(patient_responsibility) AS patient_responsibility
FROM gold.fact_claim;

-- Monthly claim-cost trend.
SELECT
    DATE_TRUNC('MONTH', claim_date) AS claim_month,
    SUM(total_claim_cost) AS total_claim_cost
FROM gold.fact_claim
GROUP BY 1
ORDER BY 1;

-- Claim cost by payer.
SELECT
    p.payer_name,
    SUM(c.total_claim_cost) AS total_claim_cost,
    SUM(c.payer_coverage) AS payer_coverage,
    SUM(c.patient_responsibility) AS patient_responsibility
FROM gold.fact_claim c
LEFT JOIN gold.dim_payer p
    ON c.payer_key = p.payer_key
GROUP BY p.payer_name
ORDER BY total_claim_cost DESC;
