CREATE TABLE dbo.Department (
    Id        INT          NOT NULL PRIMARY KEY,
    HotelId   INT          NOT NULL,
    Name      VARCHAR(200) NOT NULL,
    HeadId    INT          NULL,
    CONSTRAINT FK_Department_Hotel FOREIGN KEY (HotelId) REFERENCES dbo.Hotel(Id),
    CONSTRAINT FK_Department_Head FOREIGN KEY (HeadId) REFERENCES dbo.Staff(Id)
);