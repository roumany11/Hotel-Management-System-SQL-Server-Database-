CREATE TABLE dbo.Staff (
    Id            INT           NOT NULL PRIMARY KEY,
    Name          VARCHAR(200)  NOT NULL,
    Email         VARCHAR(200)  NOT NULL UNIQUE,
    PasswordHash  VARCHAR(500)  NOT NULL,
    RoleId        INT           NOT NULL,
    DepartmentId  INT           NULL,
    HiredAt       DATETIME      NOT NULL DEFAULT GETDATE(),
    LastLogin     DATETIME      NULL,
    CONSTRAINT FK_Staff_Role       FOREIGN KEY (RoleId) REFERENCES dbo.Role(Id),
    CONSTRAINT FK_Staff_Department FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(Id)
);