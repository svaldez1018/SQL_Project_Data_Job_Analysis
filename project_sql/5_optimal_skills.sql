/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact as jpf
    INNER JOIN skills_job_dim ON 
    jpf.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON 
    skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
),
average_salary AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact as jpf
    INNER JOIN skills_job_dim ON 
    jpf.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON 
    skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)

SELECT
   -- skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON
skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT
    25;

/*
[
  {
    "skills": "sql",
    "demand_count": "919",
    "avg_salary": "125515.87"
  },
  {
    "skills": "python",
    "demand_count": "576",
    "avg_salary": "140796.16"
  },
  {
    "skills": "tableau",
    "demand_count": "560",
    "avg_salary": "139314.21"
  },
  {
    "skills": "excel",
    "demand_count": "533",
    "avg_salary": "131186.34"
  },
  {
    "skills": "power bi",
    "demand_count": "335",
    "avg_salary": "158748.83"
  },
  {
    "skills": "r",
    "demand_count": "324",
    "avg_salary": "166169.71"
  },
  {
    "skills": "looker",
    "demand_count": "142",
    "avg_salary": "111920.48"
  },
  {
    "skills": "sas",
    "demand_count": "118",
    "avg_salary": "114160.61"
  },
  {
    "skills": "sas",
    "demand_count": "118",
    "avg_salary": "114160.61"
  },
  {
    "skills": "powerpoint",
    "demand_count": "108",
    "avg_salary": "88089.70"
  },
  {
    "skills": "snowflake",
    "demand_count": "104",
    "avg_salary": "127255.91"
  },
  {
    "skills": "word",
    "demand_count": "99",
    "avg_salary": "81556.66"
  },
  {
    "skills": "aws",
    "demand_count": "92",
    "avg_salary": "87646.85"
  },
  {
    "skills": "azure",
    "demand_count": "86",
    "avg_salary": "97180.53"
  },
  {
    "skills": "oracle",
    "demand_count": "79",
    "avg_salary": "103781.78"
  },
  {
    "skills": "jira",
    "demand_count": "72",
    "avg_salary": "120693.23"
  },
  {
    "skills": "sql server",
    "demand_count": "72",
    "avg_salary": "99596.45"
  },
  {
    "skills": "sheets",
    "demand_count": "64",
    "avg_salary": "131050.90"
  },
  {
    "skills": "go",
    "demand_count": "64",
    "avg_salary": "121396.11"
  },
  {
    "skills": "redshift",
    "demand_count": "51",
    "avg_salary": "95441.27"
  },
  {
    "skills": "flow",
    "demand_count": "49",
    "avg_salary": "98170.57"
  },
  {
    "skills": "vba",
    "demand_count": "46",
    "avg_salary": "89067.17"
  },
  {
    "skills": "sharepoint",
    "demand_count": "46",
    "avg_salary": "85562.98"
  },
  {
    "skills": "databricks",
    "demand_count": "45",
    "avg_salary": "113854.91"
  },
  {
    "skills": "bigquery",
    "demand_count": "43",
    "avg_salary": "122035.86"
  }
]
*/