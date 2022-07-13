USE campus_practice_sql
GO

ALTER TABLE Employees
    ADD CompanyId INT
GO

ALTER TABLE Employees
    ADD CONSTRAINT
        FK_Employees_Company
        FOREIGN KEY (CompanyId) REFERENCES Company (Id)
GO

ALTER TABLE Projects_Employees
    ADD CONSTRAINT FK_ProjectsEmployees_Projects
        FOREIGN KEY (ProjectId) REFERENCES Projects(Id)
GO

ALTER TABLE Projects_Employees
    ADD CONSTRAINT FK_ProjectsEmployees_Employees
        FOREIGN KEY (EmployeesId) REFERENCES Employees(Id)
GO