-- HR Data Analytics SQL Project
-- Dataset: HRData.csv (1470 employee records)
-- Objective: To explore and analyze employee trends, attrition, salary distribution, and departmental insights using SQL.

-- 1. How many employees are there in total?
SELECT COUNT(*) AS total_noof_employees FROM employee_data;

-- 2. What is the count of employees by department?
SELECT Department, COUNT(*) AS employee_count
FROM employee_data
GROUP BY Department;

-- 3. How many employees are male vs. female?
SELECT Gender, COUNT(*) AS employee_count
FROM employee_data
GROUP BY Gender;

-- 4. What’s the average age of employees by department?
SELECT Department, AVG(Age) AS employee_avg_age
FROM employee_data
GROUP BY Department;

-- 5. What is the education level distribution among employees?
SELECT Education, COUNT(*) AS employee_count
FROM employee_data
GROUP BY Education;

-- 6. Which education field has the most employees?
SELECT EducationField, COUNT(*) AS employee_count
FROM employee_data
GROUP BY EducationField
ORDER BY employee_count DESC
LIMIT 1;

-- 7. How many employees have left the company?
SELECT COUNT(*) AS noof_employees_left
FROM employee_data
WHERE Attrition = 1;

-- 8. What is the attrition rate by department?
SELECT Department, COUNT(*) AS attrition_count
FROM employee_data
WHERE Attrition = 1
GROUP BY Department
ORDER BY attrition_count DESC;

-- 9. What is the average monthly income of employees who left vs. stayed?
SELECT Attrition, AVG(MonthlyIncome) AS avg_monthly_income
FROM employee_data
GROUP BY Attrition;

-- 10. Do employees who do overtime leave more often?
SELECT OverTime, Attrition, COUNT(*) AS count
FROM employee_data
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

-- 11. What is the average total working years for employees who left?
SELECT Attrition, AVG(TotalWorkingYears) AS avg_work_years
FROM employee_data
GROUP BY Attrition;

-- 12. Which job roles have the highest attrition?
SELECT JobRole, COUNT(*) AS attrition_count
FROM employee_data
WHERE Attrition = 1
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- 13. What is the average salary by department?
SELECT Department, AVG(MonthlyIncome) AS avg_income
FROM employee_data
GROUP BY Department;

-- 14. What is the average salary by job role?
SELECT JobRole, AVG(MonthlyIncome) AS avg_income
FROM employee_data
GROUP BY JobRole;

-- 15. What’s the correlation between education level and monthly income?
SELECT Education, AVG(MonthlyIncome) AS avg_income
FROM employee_data
GROUP BY Education
ORDER BY Education;

-- 16. Is there a difference in salary by gender?
SELECT Gender, AVG(MonthlyIncome) AS avg_income
FROM employee_data
GROUP BY Gender;

-- 17. Which department has the highest salary hike percentage?
SELECT Department, MAX(PercentSalaryHike) AS highest_salary_hike
FROM employee_data
GROUP BY Department
ORDER BY Department;

-- 18. What is the average performance rating per department?
SELECT Department, AVG(PerformanceRating) AS avg_performance_rating
FROM employee_data
GROUP BY Department;

-- 19. How many employees haven’t been promoted in the last 3+ years?
SELECT COUNT(*) AS no_of_employees_without_promotion
FROM employee_data
WHERE YearsSinceLastPromotion >= 3;

-- 20. What’s the relationship between training and performance rating?
SELECT TrainingTimesLastYear, AVG(PerformanceRating) AS avgp_rating
FROM employee_data
GROUP BY TrainingTimesLastYear
ORDER BY TrainingTimesLastYear;

-- 21. How many employees have high performance but low salary hikes?
SELECT PercentSalaryHike, PerformanceRating, COUNT(*) AS employee_count
FROM employee_data
WHERE PercentSalaryHike <= 12 AND PerformanceRating >= 4
GROUP BY PercentSalaryHike, PerformanceRating
ORDER BY PercentSalaryHike;

-- 22. List employees who have worked more than 10 years with the same manager
SELECT Department, YearsWithCurrManager, COUNT(*) AS emp_count
FROM employee_data
WHERE YearsWithCurrManager >= 10
GROUP BY YearsWithCurrManager, Department;

-- 23. What’s the average distance from home for each department?
SELECT Department, AVG(DistanceFromHome) AS avg_distance
FROM employee_data
GROUP BY Department;

-- 24. Which marital status group has the highest attrition?
SELECT MaritalStatus, COUNT(*) AS attrition_count
FROM employee_data
WHERE Attrition = 1
GROUP BY MaritalStatus
ORDER BY attrition_count DESC;

-- 25. Compare attrition between employees who travel frequently vs. rarely.
SELECT BusinessTravel, COUNT(*) AS attrition_count
FROM employee_data
WHERE Attrition = 1
GROUP BY BusinessTravel
ORDER BY attrition_count DESC;

-- 26. How many employees have worked in more than 3 companies before?
SELECT NumCompaniesWorked, COUNT(*) AS total_companies_worked
FROM employee_data
WHERE NumCompaniesWorked >= 3
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked;

-- 27. What’s the average number of years in current role by department?
SELECT Department, AVG(YearsInCurrentRole) AS avgnoofyears_currrole
FROM employee_data
GROUP BY Department
ORDER BY avgnoofyears_currrole;

-- 28. What’s the top 5 job roles with longest average tenure?
SELECT JobRole, AVG(YearsAtCompany) AS avg_yatcom
FROM employee_data
GROUP BY JobRole
ORDER BY avg_yatcom DESC
LIMIT 5;

-- 29. Do employees who have worked in many companies get higher salaries?
SELECT NumCompaniesWorked, AVG(MonthlyIncome) AS avg_mincome
FROM employee_data
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked ASC;

-- 30. List employees with high potential: High performance, long tenure, low salary, no recent promotion
SELECT EmployeeNumber, PerformanceRating, YearsAtCompany, MonthlyIncome, YearsSinceLastPromotion
FROM employee_data
WHERE PerformanceRating >= 4 
  AND YearsAtCompany >= 5 
  AND MonthlyIncome < 4000 
  AND YearsSinceLastPromotion >= 3;
