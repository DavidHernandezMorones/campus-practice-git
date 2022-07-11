USE campus_practice_sql;

ALTER TABLE Employees
    ADD CompanyId INT;

ALTER TABLE Employees
    ADD CONSTRAINT
        FK_Employees_Company
        FOREIGN KEY (CompanyId) REFERENCES Company (Id);

ALTER TABLE Projects_Employees
    ADD CONSTRAINT FK_ProjectsEmployees_Projects
        FOREIGN KEY (ProjectId) REFERENCES Projects(Id);

ALTER TABLE Projects_Employees
    ADD CONSTRAINT FK_ProjectsEmployees_Employees
        FOREIGN KEY (EmployeesId) REFERENCES Employees(Id);
