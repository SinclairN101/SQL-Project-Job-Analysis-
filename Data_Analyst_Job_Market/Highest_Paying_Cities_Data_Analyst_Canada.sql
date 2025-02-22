-- Which Canadian cities offer the highest average salaries for Data Analyst roles?

SELECT 
    CASE 
        WHEN job_location ILIKE 'Anywhere%' OR job_location ILIKE 'Canada' THEN 'Remote'
        ELSE job_location 
    END AS location, 
    ROUND(AVG(salary_year_avg), 2) AS avg_salary  
FROM job_postings_fact
WHERE 
    job_country = 'Canada'  
    AND salary_year_avg IS NOT NULL
GROUP BY location  
HAVING COUNT(*) > 2  
ORDER BY avg_salary DESC 
LIMIT 10;