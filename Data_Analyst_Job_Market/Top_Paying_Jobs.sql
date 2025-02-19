/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT 
    A.job_id,
    A.job_title,
    A.job_location,
    A.job_schedule_type,
    TO_CHAR(A.salary_year_avg, '999,999,999') AS salary_year_avg,
    A.job_posted_date,
    B.name AS company_name
FROM job_postings_fact A
LEFT JOIN company_dim B ON A.company_id = B.company_id
WHERE 
    A.job_title_short = 'Data Analyst' 
    AND A.job_location = 'Anywhere' 
    AND A.salary_year_avg IS NOT NULL
ORDER BY A.salary_year_avg DESC
LIMIT 10