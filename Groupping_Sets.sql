-- Create tables :
Create Table Employees
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10),
    Salary int,
    Country nvarchar(10)
)
Go

Insert Into Employees Values (1, 'Mark', 'Male', 5000, 'USA')
Insert Into Employees Values (2, 'John', 'Male', 4500, 'India')
Insert Into Employees Values (3, 'Pam', 'Female', 5500, 'USA')
Insert Into Employees Values (4, 'Sara', 'Female', 4000, 'India')
Insert Into Employees Values (5, 'Todd', 'Male', 3500, 'India')
Insert Into Employees Values (6, 'Mary', 'Female', 5000, 'UK')
Insert Into Employees Values (7, 'Ben', 'Male', 6500, 'UK')
Insert Into Employees Values (8, 'Elizabeth', 'Female', 7000, 'USA')
Insert Into Employees Values (9, 'Tom', 'Male', 5500, 'UK')
Insert Into Employees Values (10, 'Ron', 'Male', 5000, 'USA')
Go

----------------------------------------------------------------

Select Country, Gender, Sum(Salary) TotalSalary
From Employees
Group BY
      GROUPING SETS
      (
            (Country, Gender), -- Sum of Salary by Country and Gender
            (Country),               -- Sum of Salary by Country
            (Gender) ,               -- Sum of Salary by Gender
            ()                             -- Grand Total
      )
Order By Grouping(Country), Grouping(Gender), Gender

----------------------------------------------------------------

Select Country, Gender, Sum(Salary) as TotalSalary
From Employees 
Group By Country, Gender

UNION ALL

Select Country, NULL, Sum(Salary) as TotalSalary
From Employees 
Group By Country

UNION ALL

Select NULL, Gender, Sum(Salary) as TotalSalary
From Employees 
Group By Gender

UNION ALL

Select NULL, NULL, Sum(Salary) as TotalSalary
From Employees 
