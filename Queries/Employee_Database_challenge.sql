-- Create table with retirement titles using a join from employees and titles table and limiting to retirement age
SELECT * FROM employees LIMIT 5;
SELECT e.emp_no,e.first_name,e.last_name,t.title, t.from_date,t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no =t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (t.to_date='9999-01-01')
ORDER BY e.emp_no;
SELECT * FROM retirement_titles LIMIT 5;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
	rt.first_name,rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;
-- SELECT number of employees by their most recent job title who are about to retire
--DROP TABLE retiring_titles;
SELECT COUNT (ut.title),ut.title 
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT (ut.title) DESC;
-- SELECT * FROM retiring_titles;
-- CREATE a Mentorship Eligibility table for emplyees who are eligible by age and dept and title
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, 
	e.birth_date, de.from_date, de.to_date,t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
SELECT * FROM mentorship_eligibility LIMIT 10;

--Additional table queries
DROP TABLE current_retirement_titles
SELECT e.emp_no,e.first_name,e.last_name,t.title, t.from_date,t.to_date
INTO current_retirement_titles
FROM employees AS e
JOIN titles AS t
ON e.emp_no =t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (t.to_date='9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM current_retirement_titles;



SELECT DISTINCT ON (crt.emp_no) crt.emp_no, 
	crt.first_name,crt.last_name, crt.title
INTO current_unique_titles
FROM current_retirement_titles AS crt
ORDER BY crt.emp_no, crt.to_date DESC;
SELECT * FROM current_unique_titles;
DROP TABLE current_retiring_titles;
SELECT COUNT (cut.title),cut.title 
INTO current_retiring_titles
FROM current_unique_titles AS cut
GROUP BY cut.title
ORDER BY COUNT (cut.title) DESC;
select * from current_retiring_titles;

