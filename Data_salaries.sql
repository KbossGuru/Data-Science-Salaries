SELECT * FROM Data_Salaries.dbo.ds_salaries;

-- Fix the datatypes of the columns in the table

ALTER TABLE Data_Salaries.dbo.ds_salaries
	DROP COLUMN [Column 0];

ALTER TABLE Data_Salaries.dbo.ds_salaries
	ALTER COLUMN work_year INT;

ALTER TABLE Data_Salaries.dbo.ds_salaries
	ALTER COLUMN salary INT;

ALTER TABLE Data_Salaries.dbo.ds_salaries
	ALTER COLUMN salary_in_usd INT;

SELECT DISTINCT(work_year) 
FROM Data_Salaries.dbo.ds_salaries;

UPDATE Data_Salaries.dbo.ds_salaries
SET remote_ratio = 'remote'
WHERE remote_ratio = 100 ;

--the remote_ratio table, identify the remote, partially remote and not remote jobs

UPDATE Data_Salaries.dbo.ds_salaries
SET remote_ratio = 'not_remote'
WHERE remote_ratio = '50' ;

UPDATE Data_Salaries.dbo.ds_salaries
SET remote_ratio = 'partial_remote'
WHERE remote_ratio = 'not_remote' ; -- a mistake was made in the partial_remote values

UPDATE Data_Salaries.dbo.ds_salaries
SET remote_ratio = 'not_remote'
WHERE remote_ratio = '0' ;

--What year had the highest average salaries for jobs in data science 

SELECT work_year, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year
ORDER BY average_salary DESC;

--average salries of different experience level per year

SELECT work_year, experience_level, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, experience_level;

--average salaries of different employment type per year

SELECT work_year, employment_type, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, employment_type;

--average salaries of different job_titles per year 

SELECT work_year, job_title, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, job_title;

-- Average salaries for different employee residence per year

SELECT work_year, employee_residence, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, employee_residence;

-- Average salaries of remote, partial remote and not remote jobs 

SELECT work_year, remote_ratio, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, remote_ratio;

-- Company locations and their average salaries per year

SELECT work_year, company_location, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, company_location;

-- Company size and their average salaries per year

SELECT work_year, company_size, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
GROUP BY work_year, company_size;

--which Data Sceience Job titles with the highest salaries in 2022

SELECT job_title, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
WHERE work_year = 2022
GROUP BY job_title
ORDER BY average_salary DESC;

--do Remote jobs pay more than Non-Remote jobs in 2022

SELECT remote_ratio, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
WHERE work_year = 2022
GROUP BY remote_ratio
ORDER BY average_salary DESC;


--which Company Location pays the highest in 2022

SELECT company_location, AVG(salary_in_usd) AS average_salary
FROM Data_Salaries.dbo.ds_salaries
WHERE work_year = 2022
GROUP BY company_location
ORDER BY average_salary DESC;