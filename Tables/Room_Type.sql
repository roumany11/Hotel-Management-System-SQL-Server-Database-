CREATE TABLE dbo.Room_Type (
    Id          INT           NOT NULL PRIMARY KEY,
    Name        VARCHAR(100)  NOT NULL,
    Rate        DECIMAL(10,2) NOT NULL,
    Description TEXT          NULL
);