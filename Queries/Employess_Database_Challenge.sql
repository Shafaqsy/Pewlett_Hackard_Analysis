--Challenge 07
--Deliverable # 01
--Create a table with The Number of Retiring Employees by Title.
SELECT e.emp_no,
    e.first_name,
e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_title
FROM employees as e
INNER JOIN Titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
SELECT * FROM retirement_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_title
FROM retirement_title as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_title;

--retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_title as ut
GROUP BY title
ORDER BY COUNT(title) DESC;
SELECT * FROM retiring_titles



--Deliverable # 02

--create a Mentorship Eligibility table that holds the employees who are eligible 
--to participate in a mentorship program.
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
From employees as e
	INNER JOIN dept_emp as de
		ON(e.emp_no = de.emp_no)
			INNER JOIN titles as ti
				ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
SELECT * FROM mentorship_eligibilty;
