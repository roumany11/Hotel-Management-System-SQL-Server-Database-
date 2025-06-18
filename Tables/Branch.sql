CREATE TABLE dbo.Branch (
    Id       INT          NOT NULL PRIMARY KEY,
    HotelId  INT          NOT NULL,
    Name     VARCHAR(200) NOT NULL,
    Location VARCHAR(300) NULL,
    CONSTRAINT FK_Branch_Hotel FOREIGN KEY (HotelId) REFERENCES dbo.Hotel(Id)
);