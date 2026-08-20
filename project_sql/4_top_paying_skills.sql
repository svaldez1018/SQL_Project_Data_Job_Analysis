/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/


SELECT
    skills_dim.skills,
    ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary
FROM job_postings_fact as jpf
INNER JOIN skills_job_dim ON 
jpf.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC
LIMIT
    25;

/*
[
  {
    "skills": "gcp",
    "avg_salary": "18052592.32"
  },
  {
    "skills": "aws",
    "avg_salary": "4716322.91"
  },
  {
    "skills": "azure",
    "avg_salary": "4415468.13"
  },
  {
    "skills": "sql",
    "avg_salary": "1477769.19"
  },
  {
    "skills": "r",
    "avg_salary": "1448123.27"
  },
  {
    "skills": "power bi",
    "avg_salary": "1117438.19"
  },
  {
    "skills": "tableau",
    "avg_salary": "971006.66"
  },
  {
    "skills": "python",
    "avg_salary": "829967.16"
  },
  {
    "skills": "asp.net",
    "avg_salary": "225742.41"
  },
  {
    "skills": "kotlin",
    "avg_salary": "198500.00"
  },
  {
    "skills": "fastapi",
    "avg_salary": "193750.00"
  },
  {
    "skills": "svn",
    "avg_salary": "185000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "178521.25"
  },
  {
    "skills": "hugging face",
    "avg_salary": "163611.76"
  },
  {
    "skills": "blazor",
    "avg_salary": "161000.00"
  },
  {
    "skills": "clickup",
    "avg_salary": "157500.00"
  },
  {
    "skills": "terraform",
    "avg_salary": "154917.71"
  },
  {
    "skills": "seaborn",
    "avg_salary": "150573.69"
  },
  {
    "skills": "apl",
    "avg_salary": "148125.00"
  },
  {
    "skills": "vue.js",
    "avg_salary": "148000.00"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "142462.26"
  },
  {
    "skills": "scala",
    "avg_salary": "140800.91"
  },
  {
    "skills": "db2",
    "avg_salary": "136251.68"
  },
  {
    "skills": "node.js",
    "avg_salary": "135194.77"
  },
  {
    "skills": "nltk",
    "avg_salary": "133125.00"
  }
]
*/