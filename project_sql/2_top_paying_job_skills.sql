/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

-- Identify the 10 highest-paying remote Data Analyst jobs with a listed salary.
WITH top_paying_jobs AS (
    SELECT
        jpf.job_id,
        jpf.job_title,
        jpf.salary_year_avg,
        company.name AS company_name
    FROM
        job_postings_fact as jpf
    LEFT JOIN company_dim AS company
    ON jpf.company_id = company.company_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.job_work_from_home = TRUE AND
        jpf.salary_year_avg IS NOT NULL
    ORDER BY
        jpf.salary_year_avg DESC
    LIMIT
        10
)
-- Attach skills to the top-paying jobs.
-- INNER JOIN ensures that only jobs with associated skills are included
-- in the final analysis.
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON 
top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;

/*
Analysis:
- SQL was the most commonly requested skill among these high-paying
  remote Data Analyst positions.
- Python was the second most common.
- Power BI, Tableau, and Excel were also frequently requested.

Data note:
- The CTE initially returns 10 jobs, but Mantys (job_id 138072)
  has no associated skills in skills_job_dim.
- Because the final query uses INNER JOINs, Mantys is excluded,
  resulting in 9 jobs in the final analysis.
[
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "sql"
  },
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "python"
  },
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "r"
  },
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "tableau"
  },
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "excel"
  },
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "salary_year_avg": "21000000.0",
    "company_name": "NMB Bank Plc",
    "skills": "power bi"
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "salary_year_avg": "2500000.0",
    "company_name": "Techify care",
    "skills": "sas"
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "salary_year_avg": "2500000.0",
    "company_name": "Techify care",
    "skills": "java"
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "salary_year_avg": "2500000.0",
    "company_name": "Techify care",
    "skills": "db2"
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "salary_year_avg": "2500000.0",
    "company_name": "Techify care",
    "skills": "asp.net"
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "salary_year_avg": "2500000.0",
    "company_name": "Techify care",
    "skills": "sas"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "sql"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "python"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "r"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "snowflake"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "excel"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "sheets"
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "salary_year_avg": "1450000.0",
    "company_name": "Hire Mountain",
    "skills": "slack"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "sql"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "python"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "pandas"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "excel"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "looker"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "power bi"
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "salary_year_avg": "900000.0",
    "company_name": "GoZupees",
    "skills": "sheets"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "sql"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "python"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "tableau"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "excel"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "looker"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "power bi"
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "salary_year_avg": "805573.54",
    "company_name": "Neyyar Technologies Private Limited",
    "skills": "sheets"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "sql"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "python"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "postgresql"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "snowflake"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "redshift"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "bigquery"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "pandas"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "tableau"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "looker"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "power bi"
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "salary_year_avg": "770000.0",
    "company_name": "Get Glass Distribution",
    "skills": "spreadsheet"
  },
  {
    "job_id": 1799720,
    "job_title": "Data Analyst (Microsoft Dynamics 365 ERP)",
    "salary_year_avg": "570000.0",
    "company_name": "The Legends Agency",
    "skills": "sql"
  },
  {
    "job_id": 1799720,
    "job_title": "Data Analyst (Microsoft Dynamics 365 ERP)",
    "salary_year_avg": "570000.0",
    "company_name": "The Legends Agency",
    "skills": "tableau"
  },
  {
    "job_id": 1799720,
    "job_title": "Data Analyst (Microsoft Dynamics 365 ERP)",
    "salary_year_avg": "570000.0",
    "company_name": "The Legends Agency",
    "skills": "power bi"
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "sql"
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "python"
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "go"
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "scala"
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "typescript"
  },
  {
    "job_id": 1237392,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "sql"
  },
  {
    "job_id": 1237392,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "salary_year_avg": "445000.0",
    "company_name": "Netflix",
    "skills": "python"
  }
]
*/