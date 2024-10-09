-- Project Status Table
WITH project_status_table AS (
SELECT
project_id,
project_name,
project_budget,
'upcoming' AS project_status
FROM upcoming_projects
UNION ALL
SELECT
project_id,
project_name,
project_budget,
'completed' AS project_status
FROM completed_projects)


-- Big Table
SELECT
e.employee_id,
e.first_name,
e.last_name,
e.job_title,
e.salary,
d.Department_name,
d.Department_Budget,
d.Department_Goals,
pa.project_id,
ps.project_name,
ps.project_budget,
ps.project_status
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.Department_ID
JOIN project_assignments AS pa
ON pa.employee_id = e.employee_id
JOIN project_status_table AS ps
ON ps.project_id = pa.project_id