CREATE TABLE dbo.Guest (
    Id        INT           NOT NULL PRIMARY KEY,
    FirstName VARCHAR(100)  NOT NULL,
    LastName  VARCHAR(100)  NOT NULL,
    Email     VARCHAR(200)  NULL,
    Phone     VARCHAR(50)   NULL,
    JoinedAt  DATE          NOT NULL DEFAULT CAST(GETDATE() AS DATE)
);