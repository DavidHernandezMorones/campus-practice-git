USE campus_practice_sql;

SELECT Id, Name, Address
FROM Company;

SELECT Id, FirstName, LastName, Email, Phone, Salary
FROM Employees;

SELECT Projects.Id   [Project Id],
       Projects.Name [Project name],
       Projects.Deadline,
       Projects.FinishedOn,
       Status.Name   status
FROM Projects
         INNER JOIN Status ON Projects.StatusId = Status.Id
WHERE Status.Name = 'Finalizado'
  AND Projects.FinishedOn < Projects.Deadline;

SELECT Id, Name, StartDate, Deadline, FinishedOn
FROM Projects
WHERE StartDate != CONVERT(DATE, GETDATE());

SELECT Id, FirstName, LastName, Email, Phone, Salary
FROM Employees
WHERE Salary > 10000;

SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
WHERE Company.Name = 'Atoz';

SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
WHERE Company.Name != 'Disnei';

SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
ORDER BY Company.Name, Employees.LastName;

SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Projects.Name,
       Status.Name
FROM Employees
         INNER JOIN Projects_Employees
                    ON Employees.Id = Projects_Employees.EmployeesId
         INNER JOIN Projects
                    ON Projects_Employees.ProjectId = Projects.Id
         INNER JOIN Status
                    ON Status.Id = Projects.StatusId
WHERE Status.Name = 'En proceso';

SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Projects.Name,
       Status.Name
FROM Employees
         INNER JOIN Projects_Employees
                    ON Employees.Id = Projects_Employees.EmployeesId
         INNER JOIN Projects
                    ON Projects_Employees.ProjectId = Projects.Id
         INNER JOIN Status
                    ON Status.Id = Projects.StatusId
WHERE Status.Name != 'Pendiente' AND Status.Name != 'En proceso';
