# \## \*\*Commercial Real Estate Property Analysis Dashboard Project\*\*

# 

# \*\*Objective:\*\* - Project related files to support Loan Servicing profitability analysis based on performance metrics such as Cap Rate, Rent Affordability and Net Operating/Cash Flow metrics. 

# 

# \*\*Project Contents:\*\* 

# 

# &#x20;- \*Business Requirement Documentation (BRD)\* - provided to demonstrate dashboard purpose, stakeholder goals, data definitions and visual wireframe design for each report item. 

# &#x20;- \*SQL Scripts\* - data query language to obtain needed data for the report. This produces the main dataset for the Power BI report, and includes calculations that are defined in the BRD documentation. 

# &#x20;- \*Excel Export Enriched Dataset\* - the output of the SQL Script file; nulls are eliminated from this dataset for consumption by end users or testing tools. 

# &#x20;- \*Power BI Files\* - this contins the main PBIX report file to product the dashboard. The dashboard contains 3 tabs: Dashboard Summary, Dashboard Details and Dashboard Descriptions. 

# &#x20;- \*Initial Source Data\* - this contains the 3 main CSV data files that were used to work into the SQL Scripts and into the Power BI report. 

# 

# \*\*Project Assumptions:\*\* 

# 

# &#x20;- Data is current and accurate from each source at the time the data is loaded. 

# &#x20;- Data will be provided and stored to be loaded on a frequent basis. 

# &#x20;- Metrics are based on Underwriting data (Cap Rate, Per Unit calculations). 

# &#x20;- No Row Level Security on any report item was added, nor was it requried at project origin. 

# 

# \*\*Data Refresh and Processing:\*\* 

# 

# &#x20;- \*Option 1\* - CSV files are the source; we will need to land each CSV on a shareable content provided (SharePoint / One Drive) to set up automatic semantic model refresh from Power BI Server. 

# &#x20;- \*Option 2\* - ETL/ELT consumption with help of data integration/engineering team. If possible, add metadata to each record on when record was loaded, to help with historical trending. 

# 

# \*\*Report Updates and Distribution:\*\* 

# 

# &#x20;- \*Report Model Update\* - weekly refresh via Power BI server; report will refresh data @ 2AM CST each week (Sunday). 

# &#x20;- \*Report Access\* - will deploy report to W\&D report portal to include with all existing reports for user access. We will follow stated AD Group access for report access. 

# &#x20;- \*Report Subscriptions\* - if needed, report can be delivered to end users upon request, in PDF form. 

# 

# \*\*Future Enhancements: \*\* 

# 

# &#x20;- \*Row Level Security (RLS)\* - ensure no user is seeing data they are not allowed to see. Confirm this with Account management to course correct if needed. 

# &#x20;- \*Power App Integration\* - work with AI tools to find 3 actionable or items of interest to automatically send to Account Management, along with link to report. Use Power Apps and AI agent creation to achieve this milestone. 

