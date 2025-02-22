/*
What are the top 10 highest-paying Data Analyst jobs in Canada, & Which companies offer the highest-paying Salary?
*/

-- Top 10 highest-paying Data Analyst jobs in Canada

WITH top_paying_jobs AS (
    SELECT 
        J.job_id,
        J.job_title,
        J.job_location,
        J.job_schedule_type,
        J.salary_year_avg,
        J.job_posted_date,
        C.name AS company_name  
    FROM job_postings_fact J
    LEFT JOIN company_dim C ON J.company_id = C.company_id
    WHERE 
        J.job_title_short = 'Data Analyst' 
        AND J.job_country = 'Canada'
        AND J.salary_year_avg IS NOT NULL
    ORDER BY J.salary_year_avg DESC  
    LIMIT 10
)
-- Top companies with the highest average salaries for Data Analyst roles

SELECT 
    T.*,  
    ROUND(AVG(T.salary_year_avg) OVER (PARTITION BY T.company_name), 2) AS avg_company_salary
FROM top_paying_jobs T
ORDER BY avg_company_salary DESC, T.salary_year_avg DESC;
