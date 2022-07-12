USE campus_practice_sql
GO

CREATE PROCEDURE sp_InsertProject @CompanyName VARCHAR(50), @Projectname VARCHAR(50)
AS
DECLARE @i AS INT
DECLARE @n AS INT
DECLARE @tempName AS VARCHAR(50)
DECLARE @tempId AS INT
DECLARE @projectid AS INT
DECLARE
    @cEmp AS TABLE
             (
                 id    INT IDENTITY (1,1) PRIMARY KEY,
                 eId   INT,
                 eName VARCHAR(50)
             )

INSERT INTO @cEmp
SELECT Employees.Id, Employees.FirstName
FROM Company
         JOIN Employees
              ON Company.Id = Employees.CompanyId
WHERE Company.Name = @CompanyName

SET @i = (SELECT MIN(id)
          FROM @cEmp)

SET @n = (SELECT MAX(id)
          FROM @cEmp)
WHILE (@i <= @n)
    BEGIN
        SET @tempName = (SELECT eName
                         FROM @cEmp
                         WHERE id = @i)

        SET @projectid = (SELECT Id
                          FROM Projects
                          WHERE Name = @Projectname)

        SET @tempid = (SELECT eId
                               FROM @cEmp
                               WHERE id = @i)

        IF (1 = (SELECT dbo.HasAnyProject(@tempName)))
            BEGIN
                DELETE FROM Projects_Employees WHERE EmployeesId = @tempId
            END

        INSERT INTO Projects_Employees (ProjectId, EmployeesId)
        VALUES (@projectid, @tempId)

        SET @i = @i + 1
    END
GO
