use hr_analysis;

show tables;

select* from hr_1;
select * from hr_2;

/*-----  AVERAGE ATTRITION RATE ---*/

select Department, Avg(case when attrition ="Yes" then 1 else 0 end) as Attrition_Rate
from hr_1
group by Department;

/*----- 1. AVERAGE ATTRITION RATE FOR ALL DEPARTMENT---*/

select 
    Department,
    concat(round(avg(case when Attrition = 'Yes' then 1 else 0 end) * 100, .2),"%") as Average_Attrition_Rate
from 
    hr_1
group by 
    Department;
    
/*------ 2. AVERAGE HOURLY RATE FOR MALE RESEARCH SCIENTIST------*/

select 
    avg(HourlyRate) as Average_HourlyRate
from 
    hr_1
where 
    Gender = 'Male' and JobRole = 'Research Scientist';
    
/*------ 3.ATTRITION RATE VS MONTHLYINCOME STATS AGAINST DEPARTMENT -----*/

select 
    avg(MonthlyIncome) AS Average_MonthlyIncome, concat(round(Avg(case when attrition ="Yes" then 1 else 0 end) * 100, .2),"%") as Attrition_Rate, Department
from 
    hr_1 as a
inner join
	hr_2 as b
on a.EmployeeNumber = b.Employee_ID
group by 
    department;

/* ----- 4.AVERAGE WORKING YEAR FOR EACH DEPARTMENT-----*/

select 
    a.Department, 
    avg(b.TotalWorkingYears) as Average_WorkingYears
from 
    hr_1 AS a
inner join 
    hr_2 AS b
on 
    a.EmployeeNumber = b.Employee_ID
group by 
    Department;
    
/*------ 5. JOB ROLE VS WORK LIFE BALANCE ----- */

Select 
		JobRole, avg(worklifebalance) as Average_WorkLifeBalance
from 	
	hr_1
join 
	hr_2
on 
	employeenumber=employee_id
group by jobrole;


/*---- 6. ATTRITION RATE VS YEAR SINCE LAST PROMOTION RELATION AGAINST JOB ROLE -----*/

Select
		jobrole,format(avg(YearsSinceLastPromotion),2) as Average_YearsSinceLastPromotion, concat(round(Avg(case when attrition ="Yes" then 1 else 0 end) * 100, .2),"%") as Attrition_Rate
from
	hr_1
join
	hr_2
on
	employeenumber=employee_id
group by jobrole;