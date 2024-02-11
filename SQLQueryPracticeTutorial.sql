----CREATE TABLE #temp_Employee (
----EmployeeID int,
----JobTitle varchar(100),
----Salary int
----)

----Select *
----FROM #temp_Employee

----INSERT INTO #temp_Employee VALUES (
----'1001', 'HR', '45000'
----)

----INSERT INTO #temp_Employee
----SELECT *
----FROM [SQL Tutorial]..EmployeeSalary

----DROP TABLE IF EXISTS #temp_Employee2
----CREATE TABLE #temp_Employee2 (
----JobTitle varchar(50),
----EmployeeJob int,
----AvgAge int,
----AvgSalary int)

----INSERT INTO #temp_Employee2 
----SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
----FROM EmployeeDemographics
----JOIN EmployeeSalary
----	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
----GROUP BY JobTitle

----SELECT *
----FROM #temp_Employee2



--Select *
--FROM EmployeeErrors

--INSERT INTO EmployeeErrors Values
--('1001 ', 'Jimbo', 'Halbert'),
--(' 1002', 'Pamela', 'Beasely'),
--('1005', 'TOby', 'Flenderson - Fired')

--Select EmployeeID, TRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--Select EmployeeID, LTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--Select EmployeeID, RTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors


--Select LastName, REPLACE(LastName, '- Fired',' ') as LastNameFixed
--FROM EmployeeErrors

--Select SUBSTRING(FirstName,3,3)
--FROM EmployeeErrors

--Select err.FirstName, SUBSTRING(err.FirstName,1,3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


--Select FirstName, LOWER(FirstName)
--FROM EmployeeErrors

--Select FirstName, UPPER(FirstName)
--FROM EmployeeErrors


--Today's Topic: Stored Procedures


--CREATE PROCEDURE TEST
--AS
--Select *
--From EmployeeDemographics


--EXEC TEST



--CREATE PROCEDURE Temp_Employee
--AS
--Create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--INSERT INTO #temp_employee
--SELECT JobTitle, COUNT(JobTitle), Avg(Age), AVG(Salary)
--FROM [SQL Tutorial]..EmployeeDemographics emp
--JOIN [SQL Tutorial]..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--Group by JobTitle

--Select *
--FROM #temp_employee

--EXEC Temp_Employee


--Subqueries (in the select, From and where statement)

Select *
From EmployeeSalary

--Subquerry in Select

Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) As AllAVgSalary
From EmployeeSalary

--How to do it with Partition By

Select EmployeeID, Salary, AVG(Salary) over () As AllAVgSalary
From EmployeeSalary

--Why Group by doesn't work 

Select EmployeeID, Salary, AVG(Salary) over () As AllAVgSalary
From EmployeeSalary
Group By EmployeeID, Salary
Order by 1,2


--Subquery in From

Select a.EmployeeID, AllAVgSalary
From (Select EmployeeID, Salary, AVG(Salary) over () As AllAVgSalary
	  From EmployeeSalary) a

--Subquerry in Where

Select EmployeeID, Salary, JobTitle
From EmployeeSalary
WHERE EmployeeID in (
		Select EmployeeID
		From EmployeeDemographics
		Where Age > 30)