USE campus_practice_sql
GO
-- Devuelve todas las companias
SELECT Id, Name, Address
FROM Company
GO

-- Devuelve todos los empleados
SELECT Id, FirstName, LastName, Email, Phone, Salary
FROM Employees
GO

-- Devuelve los proyectos que hayan sido finalizados antes del deadline
SELECT Projects.Id   [Project Id],
       Projects.Name [Project name],
       Projects.Deadline,
       Projects.FinishedOn,
       Status.Name   status
FROM Projects
         INNER JOIN Status ON Projects.StatusId = Status.Id
WHERE Status.Name = 'Finalizado'
  AND Projects.FinishedOn < Projects.Deadline
GO

-- Duevelve los proyectos que no hayan empezado a partir de la fecha actual
SELECT Id, Name, StartDate, Deadline, FinishedOn
FROM Projects
WHERE StartDate != CONVERT(DATE, '2022/7/11'/*GETDATE()*/)
GO

-- Devuelve los empleados con salario mayor a 10000
SELECT Id, FirstName, LastName, Email, Phone, Salary
FROM Employees
WHERE Salary > 10000;

-- Devuelve los empleados de Atoz
SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
WHERE Company.Name = 'Atoz'
GO

-- Devuelve los empleados que no son de Disnei
SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
WHERE Company.Name != 'Disnei'
GO

/*Devuelve los empleados con sus respectivas companies,
  ordenados primeramente por el nombre
  de sus companies y luego por sus apellidos
*/
SELECT Employees.Id,
       Employees.FirstName,
       Employees.LastName,
       Employees.Email,
       Employees.Phone,
       Employees.Salary,
       Company.Name [Company Name]
FROM Employees
         INNER JOIN Company ON Employees.CompanyId = Company.Id
ORDER BY Company.Name, Employees.LastName
GO

-- Devuelve los empleados que pertenezcan a proyectos que esten en proceso
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
WHERE Status.Name = 'En proceso'
GO

-- Devuelve los empleados sin proyectos pendientes o en proceso
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
WHERE Status.Name != 'Pendiente' AND Status.Name != 'En proceso'
GO
