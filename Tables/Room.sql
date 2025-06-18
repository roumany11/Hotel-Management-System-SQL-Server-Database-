CREATE TABLE dbo.Room (
    Id          INT           NOT NULL PRIMARY KEY,
    Number      VARCHAR(50)   NOT NULL,
    RoomTypeId  INT           NOT NULL,
    Status      VARCHAR(50)   NOT NULL,
    CONSTRAINT FK_Room_RoomType FOREIGN KEY (RoomTypeId) REFERENCES dbo.Room_Type(Id)
);