SELECT job_title_short, avg_salary
FROM (
    SELECT job_title_short, ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
    GROUP BY job_title_short
) AS job_salaries
WHERE avg_salary > (SELECT AVG(salary_year_avg) FROM job_postings_fact WHERE salary_year_avg IS NOT NULL)
ORDER BY avg_salary DESC;