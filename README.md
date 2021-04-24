# Pewlett-Hackard-Analysis
### Project Overview
The goal of the project is to identify eligible retiring employees at Pewlett Hackard and summarize by title.  In addition, we will utilize pre-defined critieria to identify employees for possible participation in the mentorship program.  These will be performed using Postgres SQL queries and data will be exported to csv files.
#### Results
* Initially the retirement table suggest approximately 133,776 employees are eligible for retirement with birth dates between
January 1, 1952 and December 31, 1955. 
![retirement titles first 10](/Data/Retirement_titles.png)

*  With redundancy titles eliminated the number of eligilble employees drops to 90,398 employees with unique titles.

* These employees are mostly senior engineers and senior staff as illustrated in the figure below from the retiring_titles table.
![Retiring Count by Titles](/Data/retiring_titles.png)

* 1549 employees were identified in the data for employees hired in 1965.  The figure below indicates the breakdown of these by title.
![Eligible mentors by title](/Data/mentorship_by_title.png)

CSV's are located here:
[retirement_titles.csv](/Data/retirement_titles.csv)
[unique_titles.csv](/Data/unique_titles.csv)
[retiring_titles.csv](/Data/retiring_titles.csv)
[mentorship_eligibility.csv](/Data/mentorship_eligibility.csv)


#### Summary
* As the 'silver tsunami' begins to impact the company there appears to be a need of 90,398 employees just to replace those about to retire.  
* Additional queries reveal that this number is too high as the filtering criteria didn't exclude those no longer employeed by the company.  Additional filtering to current employees reveals ~72,000 employees with the titles in the below figure.
![Current Retiring Employees by Title](/Data/current_retiring_titles.png)
* Several factors need to be considered including are any current employees being mentored or trained as replacements, growth of the company, division needs, and do new mentoered employees replace current retirees on a one to one level.
* Using the 1965 year there only appears to be 1,549 employees available with the mentor program.  Clearly not enough to mentor the replacements of the silver tsunami.  
* Using additional queries by broading this range to five birth date years (1960-1965) allows for more mentors eligible.  Tens of thousands more mentors become available broading this birth date criteria.

![1965-1970 Eligible mentors](/Data/mentors_1960_to_1965.png) 