/*
What skills are required for the top-paying data analyst jobs in Canada?
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
        AND A.job_country = 'Canada' 
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
ORDER BY 1 DESC;