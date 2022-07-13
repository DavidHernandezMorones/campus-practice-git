USE campus_practice_sql
GO

CREATE TRIGGER TR_Projects_InsertValidateDeadLine
    ON Projects
    AFTER INSERT
    AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @deadl AS DATE = (SELECT Deadline FROM inserted);
    DECLARE @startd AS DATE = (SELECT StartDate FROM inserted);
    IF (@deadl <= @startd)
        BEGIN
            RAISERROR ('No se puede insertar un DeadLine antes de que empieze el proyecto', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN
        END
END
GO

CREATE TRIGGER TR_Projects_InsertUpdateStatus
    ON Projects
    AFTER INSERT
    AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @deadl AS DATE = (SELECT Deadline FROM inserted);
    DECLARE @startd AS DATE = (SELECT StartDate FROM inserted);
    DECLARE @actual AS DATE = CONVERT(DATE, GETDATE())
    IF (@startd < @actual AND @actual < @deadl)
        BEGIN
            UPDATE Projects
            SET StatusId = (SELECT Id FROM Status WHERE Name = 'En proceso')
            FROM inserted AS i
            WHERE Projects.Id = i.Id
        END
    ELSE
        BEGIN
            IF (@startd > @actual)
                BEGIN
                    UPDATE Projects
                    SET StatusId = (SELECT Id FROM Status WHERE Name = 'Pendiente')
                    FROM inserted AS i
                    WHERE Projects.Id = i.Id
                END
        END
END
GO
