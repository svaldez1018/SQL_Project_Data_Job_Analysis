/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact as jpf
INNER JOIN skills_job_dim ON 
jpf.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY
    demand_count DESC
LIMIT
    5;

/*
Analysis:
SQL is the most in-demand skill for Data Analyst positions, appearing
in 213,954 job postings. Excel and Python follow with 156,955 and 
138,642 postings, respectively. Tableau and Power BI also show 
strong demand, appearing in over 100,000 postings each.

Overall, the results show that employers are primarily looking for 
Data Analysts with skills in SQL, spreadsheets, programming, and 
data visualization.
[
  {
    "skills": "sql",
    "demand_count": "213954"
  },
  {
    "skills": "excel",
    "demand_count": "156955"
  },
  {
    "skills": "python",
    "demand_count": "138642"
  },
  {
    "skills": "tableau",
    "demand_count": "106787"
  },
  {
    "skills": "power bi",
    "demand_count": "104303"
  }
]
*/