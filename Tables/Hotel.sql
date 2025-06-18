CREATE TABLE dbo.Hotel (
    Id        INT           NOT NULL PRIMARY KEY,
    Name      VARCHAR(200)  NOT NULL,
    Address   VARCHAR(500)  NULL,
    Phone     VARCHAR(50)   NULL,
    ManagerId INT           NULL,
    CONSTRAINT FK_Hotel_Manager FOREIGN KEY (ManagerId) REFERENCES dbo.Staff(Id)
);