USE campus_practice_sql
GO

CREATE FUNCTION GetNameProjectIdEmployeeName(@EmployeeName VARCHAR(50))
    RETURNS INT
AS
BEGIN
    DECLARE @projectdate AS DATE = CONVERT(DATE, (
        SELECT MAX(StartDate)
        FROM Projects
        JOIN Projects_Employees
        ON Projects.Id = Projects_Employees.ProjectId
        JOIN Employees
        ON Projects_Employees.EmployeesId = Employees.Id
        AND Employees.FirstName = @EmployeeName
        ))

    DECLARE @id AS INT = CONVERT(INT, (
        SELECT Projects.Id
        FROM Projects
        JOIN Projects_Employees
        ON Projects.Id = Projects_Employees.ProjectId
        JOIN Employees
        ON Projects_Employees.EmployeesId = Employees.Id
        WHERE Employees.FirstName = @EmployeeName
        AND StartDate = @projectdate
        ))

    RETURN @id
END
GO

CREATE FUNCTION HasAnyProject(@EmployeeName VARCHAR(50))
    RETURNS BIT
AS
BEGIN
    DECLARE @nProjects AS INT = CONVERT(INT, (SELECT COUNT(Projects.Id)
                                              FROM Projects_Employees
                                                       JOIN Projects
                                                            ON Projects_Employees.ProjectId = Projects.Id
                                                       JOIN Employees
                                                            ON Projects_Employees.EmployeesId = Employees.Id
                                              WHERE Employees.FirstName = @EmployeeName))
    IF @nProjects <= 1
        RETURN 0

    RETURN 1
END
GO
