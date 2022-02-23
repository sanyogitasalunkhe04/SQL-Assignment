--1
SELECT * FROM EmployeeDetail WHERE FirstName like '[^a-p]%'
--2
SELECT * FROM EmployeeDetail WHERE Gender like '__le' 
--3
SELECT * FROM EmployeeDetail WHERE FirstName like 'F____' 
--4
SELECT * FROM EmployeeDetail WHERE FirstName like '%[%]%' 
--5
SELECT DISTINCT(Department) FROM EmployeeDetail
--6
select *from employee where salary=(select Max(salary) from employees);
--7
select convert(varchar(20),JOD,106) from EmployeeDtls 
--8
select convert(varchar(20),JOD,102) from EmployeeDtls
--9
SELECT CONVERT(VARCHAR(20),JoiningDate,108) FROM [EmployeeDetail]
--10
SELECT DATEPART(YEAR, JoiningDate) FROM [EmployeeDetail]
--11 
SELECT FirstName, GETDATE() [Current Date], JoiningDate,
DATEDIFF(MM,JoiningDate,GETDATE()) AS [Total Months] FROM [EmployeeDetail]
--12
SELECT * FROM [EmployeeDetail] WHERE DATEPART(YYYY,JoiningDate) = '2013'
--13
SELECT * FROM [EmployeeDetail] WHERE DATEPART(MM,JoiningDate) = '1'
--14
SELECT * FROM [EmployeeDetail] WHERE JoiningDate BETWEEN '2013-01-01' AND '2013-12-01'
--15
Select Name,
    Case when Gender = 'Male' then 'M' when Gender = 'Female' then 'F' else 'Other' end
from TableA
--16
- select e.name, w.pid
from employee e, workon w
where e.empid = w.empid
group by e.name, w.pid, w.empid
having count (e.name) > 1
order by w.pid

--part b

--1
SELECT FirstName,ProjectName FROM [EmployeeDetail] A INNER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName
--2
SELECT FirstName,ProjectName FROM [EmployeeDetail] A LEFT OUTER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName
--3
SELECT FirstName, ISNULL(ProjectName,'-No Project Assigned') FROM [EmployeeDetail] A LEFT OUTER JOIN [ProjectDetail] B
ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName
--4
SELECT FirstName,ProjectName FROM [EmployeeDetail] A RIGHT OUTER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName
--5
SELECT FirstName,ProjectName FROM [EmployeeDetail] A FULL OUTER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName
--6 SELECT FirstName, ISNULL(ProjectName,'-No Project Assigned') AS [ProjectName] FROM [EmployeeDetail] A LEFT OUTER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID
WHERE ProjectName IS NULL
--7
SELECT ProjectName FROM [EmployeeDetail] A RIGHT OUTER JOIN [ProjectDetail] B ON A.EmployeeID = B.EmployeeDetailID
WHERE FirstName IS NULL
--8
Select EmployeeID, FirstName, ProjectName from [EmployeeDetail] E INNER JOIN [ProjectDetail] P
ON E.EmployeeID = P.EmployeeDetailID
WHERE EmployeeID IN (SELECT EmployeeDetailID FROM [ProjectDetail] GROUP BY EmployeeDetailID HAVING COUNT(*) >1 )
--9
Select P.ProjectName, E.FName from ProjectDetails P INNER JOIN EmployeeDetails E
on p.EmployeId = E.Id where P.ProjectName in(select ProjectName from ProjectDetails group by ProjectName having COUNT(1)>1)