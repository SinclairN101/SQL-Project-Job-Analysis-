
/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        A.job_id,
        A.job_title,
        A.salary_year_avg,
        B.name AS company_name
    FROM job_postings_fact A
    LEFT JOIN company_dim B ON A.company_id = B.company_id
    WHERE 
        A.job_title_short = 'Data Analyst' 
        AND A.job_location = 'Anywhere' 
        AND A.salary_year_avg IS NOT NULL
    ORDER BY A.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    C.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim D ON top_paying_jobs.job_id = D.job_id
INNER JOIN skills_dim C ON D.skill_id = C.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC