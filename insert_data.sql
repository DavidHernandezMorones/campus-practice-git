USE campus_practice_sql;

INSERT INTO Status (Name)
VALUES ('Pendiente'),
       ('En proceso'),
       ('Cancelado'),
       ('Finalizado'),
       ('En Pausa');

INSERT INTO Company(Name, Address)
VALUES ('IMC', '5151 W 29th St #2201 Greeley, Colorado(CO), 80634'),
       ('Atoz', '2007 Ardmore Hwy Ardmore, Tennessee(TN), 38449'),
       ('Disnei', '4226 Highgate Dr Horn Lake, Mississippi(MS), 38637');

INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary, CompanyId)
VALUES ('Juan', 'Perez', 'juan@jmail.com', '9991808182', 9500, (SELECT Id FROM Company WHERE Name = 'IMC')),
       ('Paco', 'Ochoa', 'paco@jmail.com', '9991808183', 8000, (SELECT Id FROM Company WHERE Name = 'Atoz')),
       ('Pedro', 'Fernandez', 'pedro@jmail.com', '9991808184', 12500, (SELECT Id FROM Company WHERE Name = 'Disnei')),
       ('Sofi', 'Hernandez', 'sofi@jmail.com', '9991808185', 11000, (SELECT Id FROM Company WHERE Name = 'IMC')),
       ('Isabella', 'Smith', 'isabella@jmail.com', '9991808186', 9000, (SELECT Id FROM Company WHERE Name = 'Atoz')),
       ('Eduardo', 'Jimenez', 'eduardo@jmail.com', '9991808187', 11000, (SELECT Id FROM Company WHERE Name = 'Disnei')),
       ('Jose', 'Pavon', 'jose@jmail.com', '9991808188', 12000, (SELECT Id FROM Company WHERE Name = 'IMC')),
       ('Pancho', 'Fernandez', 'pancho@jmail.com', '9991808189', 12500, (SELECT Id FROM Company WHERE Name = 'Atoz')),
       ('Francisco', 'Fernandez', 'francisco@jmail.com', '9991808190', 25000, (SELECT Id FROM Company WHERE Name = 'Disnei')),
       ('Diego', 'Olivarez', 'diego@jmail.com', '9991808191', 9000, (SELECT Id FROM Company WHERE Name = 'IMC'));

INSERT INTO Projects (Name, StartDate, Deadline, FinishedOn, StatusId)
VALUES ('Dainler Learning', '2022/7/11', '2050/2/22', NULL, (SELECT Id FROM Status WHERE Name = 'En proceso')),
       ('Provident Software', '2022/9/15', '2023/2/28', NULL, (SELECT Id FROM Status WHERE Name = 'Pendiente')),
       ('DataAnlysis', '2023/1/31', '2023/10/5', NULL, (SELECT Id FROM Status WHERE Name = 'Pendiente')),
       ('SoftCentral Migration', '2021/5/2', '2022/7/25', '2022/1/1', (SELECT Id FROM Status WHERE Name = 'Finalizado')),
       ('Atoz Insight', '2022/12/30', '2024/10/1', NULL, (SELECT Id FROM Status WHERE Name = 'Cancelado'));

INSERT INTO Projects_Employees (ProjectId, EmployeesId)
VALUES (1, 1),
       (1, 4),
       (1, 7),
       (1, 10),
       (2, 2),
       (2, 5),
       (2, 8),
       (3, 3),
       (3, 6),
       (3, 9),
       (4, 1),
       (4, 4),
       (4, 7),
       (5, 2),
       (5, 5),
       (5, 8);
