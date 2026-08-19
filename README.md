# SQL Project: Data Analyst Job Market Analysis

Exploring the Data Analyst job market through SQL — pinpointing the top-paying roles, the skills employers demand most, and where high pay and high demand overlap. The dataset spans job postings from 2023 through mid-2026, refreshed to reflect current market data.

## Background

This project analyzes real-world job posting data (job titles, salaries, locations, and required skills) using PostgreSQL, with the goal of understanding what actually makes a Data Analyst role well-paid and in-demand. It was built as a hands-on way to practice writing production-style SQL — CTEs, joins across a small star schema, and aggregate queries — against a realistic dataset, following Luke Barousse's *SQL for Data Analytics* course, then updated with a refreshed dataset to keep the results current.

Each query in this project was written to answer one specific question:

1. **What are the top-paying Data Analyst jobs?** ([`1_top_paying_jobs.sql`](project_sql/1_top_paying_jobs.sql)) — Pulls the 10 highest-paying remote Data Analyst postings with a listed salary.
2. **What skills do those top-paying jobs require?** ([`2_top_paying_job_skills.sql`](project_sql/2_top_paying_job_skills.sql)) — Joins the top 10 from query 1 against the skills tables to see what's actually required to land one of those roles.
3. **What are the most in-demand skills overall?** ([`3_top_demanded_skills.sql`](project_sql/3_top_demanded_skills.sql)) — Ranks the top 5 skills by how often they appear across all Data Analyst postings.
4. **Which skills are associated with the highest salaries?** ([`4_top_paying_skills.sql`](project_sql/4_top_paying_skills.sql)) — Averages salary by skill to surface the most financially rewarding ones to learn.
5. **What are the most *optimal* skills to learn?** ([`5_optimal_skills.sql`](project_sql/5_optimal_skills.sql)) — Combines demand and salary for remote roles to find the skills that are both in-demand *and* well-paid.

## Tools Used

- **SQL / PostgreSQL** — querying and analyzing the job postings dataset
- **VS Code** — writing and running the SQL scripts
- **Git & GitHub** — version control

## Database Structure

The queries run against a small star-schema database (`sql_course`) made up of four tables:

| Table | Contents |
|---|---|
| `job_postings_fact` | One row per job posting — title, location, salary, work-from-home flag, posted date, etc. |
| `company_dim` | Company name and metadata, keyed by `company_id` |
| `skills_dim` | Master list of skills, keyed by `skill_id` |
| `skills_job_dim` | Bridge table mapping postings to the skills they require |

Setup scripts for building this schema and loading the data live in [`sql_load/`](sql_load):
1. [`1_create_database.sql`](sql_load/1_create_database.sql) — creates the `sql_course` database
2. [`2_create_tables.sql`](sql_load/2_create_tables.sql) — creates the four tables above, with primary/foreign keys and indexes
3. [`3_modify_tables.sql`](sql_load/3_modify_tables.sql) — loads the data from CSV files via `COPY`

## Getting Started

1. Install PostgreSQL and pgAdmin (or your preferred client).
2. Run the scripts in `sql_load/` in order to create the database and tables.
3. Update the file paths in `3_modify_tables.sql` to point to your local CSV files, then run it to load the data.
4. Run any of the queries in `project_sql/` to reproduce the analysis.

## Key Findings

**1. Top-Paying Remote Data Analyst Jobs**
The highest salary in the raw results — **$21,000,000/year** for a Marketing Data Analyst role at NMB Bank Plc — is almost certainly a data anomaly rather than a real figure (NMB Bank operates in Zimbabwe/Tanzania/Malawi, so this looks like a currency-mismatch issue in the source data rather than a USD salary). Setting that entry aside, the more consistent top of the range is:

| Company | Role | Salary |
|---|---|---|
| The Legends Agency | Data Analyst (Microsoft Dynamics 365 ERP) | $570,000 |
| Mantys | Data Analyst | $650,000 |
| Netflix | Analytics Engineer – Playback Data (L5) | $445,000 |
| Netflix | Analytics Engineer (L5) – Live Quality of Experience | $445,000 |

**2. Skills Required by Top-Paying Jobs**
SQL was the most commonly requested skill among the high-paying remote postings, with Python close behind. Power BI, Tableau, and Excel also came up frequently — suggesting that even the highest-paying roles still expect the same core toolkit as the rest of the market, not just niche or specialized skills. (Note: Mantys, the #1 realistic salary above, had no rows in `skills_job_dim`, so it's excluded from this join — 9 of the top 10 jobs are represented instead of 10.)

**3. Most In-Demand Skills**
Across all Data Analyst postings, demand is dominated by:

| Skill | Postings |
|---|---|
| SQL | 213,954 |
| Excel | 156,955 |
| Python | 138,642 |
| Tableau | 106,787 |
| Power BI | 104,303 |

SQL, spreadsheets, a programming language, and a visualization tool make up the core expectations for the role.

**4. Skills Associated with the Highest Average Salary**
A few cloud-platform skills (GCP, AWS, Azure) show extreme average salaries ($18M, $4.7M, and $4.4M respectively) — almost certainly the same kind of data anomaly as the $21M job posting pulling a small sample's average way up, rather than a real pay premium. Excluding those, the more reliable leaders are SQL, R, Power BI, Tableau, and Python — consistent with query 3, this reinforces that the core Data Analyst toolkit isn't just the most in-demand set of skills, it's also associated with the strongest pay.

**5. Most Optimal Skills (High Demand *and* High Salary, Remote Roles)**
This query's results were the most internally consistent of the five — no runaway outliers, and the salary figures land in a realistic $80K–$170K range:

| Skill | Demand | Avg. Salary |
|---|---|---|
| SQL | 919 | $125,516 |
| Python | 576 | $140,796 |
| Tableau | 560 | $139,314 |
| Excel | 533 | $131,186 |
| Power BI | 335 | $158,749 |
| R | 324 | $166,170 |

SQL is the clear demand leader, but Power BI and R offer a noticeably higher average salary for a smaller (though still substantial) pool of postings — a solid argument for pairing SQL with a visualization or statistical tool rather than treating it as a standalone skill.

> **Data quality note:** A handful of postings in this dataset have salary values several orders of magnitude above the rest (into the millions), which skew any average that includes them. Query 5's demand-and-salary combination happened to avoid this, but queries 1 and 4 didn't — worth keeping in mind if extending this analysis, since a couple of bad rows can distort an aggregate a lot more than they'd distort a simple ranking.

## What I Learned

Working through this project sharpened my SQL skills in a few specific areas:
- Writing **CTEs** to break multi-step logic (like query 5) into readable pieces
- Combining multiple **INNER/LEFT JOINs** across a normalized schema
- Using **aggregate functions** (`COUNT`, `AVG`) with `GROUP BY` to summarize demand and salary trends
- Structuring queries around a specific business question rather than just exploring data

## Notes

`.gitignore` excludes the raw CSV files, VS Code settings, and a scratch `query_practice` folder — the data itself isn't included in this repo.