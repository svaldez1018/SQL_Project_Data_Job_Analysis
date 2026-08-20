/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- focuses on job postings with specific salaries(remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibitlity.
*/

SELECT
    jpf.job_id,
    jpf.job_title,
    jpf.job_schedule_type,
    company.name AS company_name,
    jpf.salary_year_avg,
    jpf.job_posted_date,
    jpf.job_work_from_home

-- Join with company_dim to retrieve company names.
FROM
    job_postings_fact as jpf
LEFT JOIN company_dim AS company
ON jpf.company_id = company.company_id

-- Filter for Data Analyst roles, remote positions, and 
-- postings with salary data.
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_work_from_home = TRUE AND
    jpf.salary_year_avg IS NOT NULL
ORDER BY
    jpf.salary_year_avg DESC
LIMIT
    10;

/*
[
  {
    "job_id": 1793025,
    "job_title": "Marketing Data Analyst (Remote Option)",
    "job_schedule_type": "Full-time",
    "company_name": "NMB Bank Plc",
    "salary_year_avg": "21000000.0",
    "job_posted_date": "2026-01-10 10:20:02",
    "job_work_from_home": true
  },
  {
    "job_id": 1882401,
    "job_title": "Analysis & Reporting Analyst – z Platform / Mainframe",
    "job_schedule_type": "Full-time",
    "company_name": "Techify care",
    "salary_year_avg": "2500000.0",
    "job_posted_date": "2026-05-22 11:01:52",
    "job_work_from_home": true
  },
  {
    "job_id": 1860916,
    "job_title": "Ecommerce Growth & Data Analyst (LTV, Cohorts, Data Reconciliation)",
    "job_schedule_type": "Full-time",
    "company_name": "Hire Mountain",
    "salary_year_avg": "1450000.0",
    "job_posted_date": "2026-04-16 15:03:45",
    "job_work_from_home": true
  },
  {
    "job_id": 1902135,
    "job_title": "AI Operations Data & Analytics Analyst",
    "job_schedule_type": "Full-time",
    "company_name": "GoZupees",
    "salary_year_avg": "900000.0",
    "job_posted_date": "2026-06-22 14:03:32",
    "job_work_from_home": true
  },
  {
    "job_id": 1910501,
    "job_title": "Data Analyst Trainer From Kerala",
    "job_schedule_type": "Part-time",
    "company_name": "Neyyar Technologies Private Limited",
    "salary_year_avg": "805573.54",
    "job_posted_date": "2026-07-06 09:04:03",
    "job_work_from_home": true
  },
  {
    "job_id": 1820840,
    "job_title": "Data Analyst (Founding Role) — Build Our Reporting & Analytics System from Scratch",
    "job_schedule_type": "Full-time",
    "company_name": "Get Glass Distribution",
    "salary_year_avg": "770000.0",
    "job_posted_date": "2026-02-11 22:02:50",
    "job_work_from_home": true
  },
  {
    "job_id": 138072,
    "job_title": "Data Analyst",
    "job_schedule_type": "Full-time",
    "company_name": "Mantys",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:44",
    "job_work_from_home": true
  },
  {
    "job_id": 1799720,
    "job_title": "Data Analyst (Microsoft Dynamics 365 ERP)",
    "job_schedule_type": "Full-time",
    "company_name": "The Legends Agency",
    "salary_year_avg": "570000.0",
    "job_posted_date": "2026-01-18 10:04:12",
    "job_work_from_home": true
  },
  {
    "job_id": 1581273,
    "job_title": "Analytics Engineer - Playback Data (L5)",
    "job_schedule_type": "Full-time",
    "company_name": "Netflix",
    "salary_year_avg": "445000.0",
    "job_posted_date": "2025-06-10 16:02:43",
    "job_work_from_home": true
  },
  {
    "job_id": 1275887,
    "job_title": "Analytics Engineer (L5) - Live Quality of Experience",
    "job_schedule_type": "Full-time",
    "company_name": "Netflix",
    "salary_year_avg": "445000.0",
    "job_posted_date": "2025-01-04 10:01:54",
    "job_work_from_home": true
  }
]
*/