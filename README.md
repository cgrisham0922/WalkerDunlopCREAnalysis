# Commercial Real Estate Property Analysis Dashboard

## Overview

This project contains all supporting artifacts for a **Commercial Real Estate (CRE) Loan Servicing Profitability Analysis Dashboard** developed in Power BI. The dashboard enables users to evaluate property performance and profitability using key underwriting and operational metrics such as:

- Capitalization Rate (Cap Rate)
- Rent Affordability
- Net Operating Income (NOI)
- Cash Flow Performance
- Per Unit Financial Metrics

The solution combines source data, SQL transformations, business requirements, and Power BI reporting into a single end-to-end analytics workflow.

---

## Project Objectives

Provide stakeholders with an interactive analytics platform that supports loan servicing and property profitability analysis through standardized performance metrics, visual reporting, and actionable insights.

---

## Project Contents

### 📋 Business Requirements Documentation (BRD)

The BRD outlines:

- Business objectives
- Stakeholder requirements
- Metric definitions
- Data mapping and assumptions
- Report wireframes and dashboard design specifications

### 🗄️ SQL Scripts

SQL scripts used to:

- Extract and transform source data
- Calculate business metrics defined in the BRD
- Generate the reporting dataset consumed by Power BI

### 📊 Enriched Dataset (Excel Export)

The processed dataset generated from the SQL scripts.

Features include:

- Cleansed data
- Reduced null values
- Analysis-ready structure
- Support for validation and testing activities

### 📈 Power BI Files

Contains the primary Power BI report (`.pbix`) including:

1. **Dashboard Summary**
2. **Dashboard Details**
3. **Dashboard Descriptions**

The report provides both executive-level summaries and property-level analysis.

### 📁 Source Data

Original CSV files used during development and modeling.

These datasets serve as the foundational source for:

- SQL transformations
- Data validation
- Report development

---

## Project Assumptions

The following assumptions apply to this solution:

- Source data is accurate and current at the time of ingestion.
- New data will be received and stored on a recurring basis.
- Financial metrics are derived primarily from underwriting data.
- Cap Rate and Per Unit calculations follow documented business rules.
- Row-Level Security (RLS) was not required within the original project scope.

---

## Data Refresh & Processing Options

### Option 1: File-Based Refresh

Use CSV files as the primary data source.

Process:

1. Store CSV files in a shared location (SharePoint or OneDrive).
2. Connect Power BI to the hosted files.
3. Configure scheduled semantic model refreshes through Power BI Service.

### Option 2: ETL / ELT Integration

Integrate the solution with enterprise data engineering processes.

Benefits:

- Automated ingestion pipelines
- Improved governance
- Data lineage tracking
- Historical snapshot capabilities

**Recommendation:** Add record load timestamps to support trend analysis and historical reporting.

---

## Report Distribution & Maintenance

### 🔄 Report Refresh Schedule

- Refresh Frequency: Weekly
- Refresh Day: Sunday
- Refresh Time: 2:00 AM CST

### 🔐 Report Access

The report will be deployed to the Walker & Dunlop reporting portal and secured through Active Directory (AD) group memberships.

### 📧 Report Subscriptions

Reports can be distributed upon request through Power BI subscriptions or exported to PDF format for stakeholders.

---

## Future Enhancements

### Row-Level Security (RLS)

Implement security roles to ensure users only have access to authorized data.

Potential activities:

- Define security requirements with Account Management
- Establish property- or region-based access controls
- Validate role assignments through user acceptance testing

### Power Apps & AI Integration

Extend the dashboard with automated workflows and intelligent insights.

Potential capabilities include:

- AI-generated recommendations
- Automated alerting for performance anomalies
- Property opportunity identification
- Power Apps integration for workflow management
- Automated notifications to Account Management teams

---

## Technology Stack

| Technology | Purpose |
|------------|---------|
| Power BI | Dashboard Development & Visualization |
| SQL Server / SQL Scripts | Data Transformation & Business Logic |
| Excel | Exported Analysis Dataset |
| CSV Files | Source Data Storage |
| SharePoint / OneDrive | File Hosting & Scheduled Refresh |
| Power Apps | Future Workflow Integration |
| AI Services | Future Insight Automation |

---

## Repository Structure

```text
├── BRD/
│   └── Business Requirements Documentation
├── SQL/
│   └── SQL Scripts
├── Data/
│   ├── Source CSV Files
│   └── Enriched Dataset Export
├── PowerBI/
│   └── PBIX Report Files
└── README.md
```

---

## Author

Commercial Real Estate Property Analysis Dashboard Project
Chris Grisham July 2026

Power BI • SQL • Loan Servicing Analytics • Property Performance Reporting
