CREATE TABLE dbo.Booking (
    Id         INT          NOT NULL PRIMARY KEY,
    GuestId    INT          NOT NULL,
    RoomId     INT          NOT NULL,
    BookedBy   INT          NOT NULL,
    CheckIn    DATE         NOT NULL,
    CheckOut   DATE         NOT NULL,
    Status     VARCHAR(50)  NOT NULL,
    CreatedAt  DATETIME     NOT NULL DEFAULT GETDATE(),
    UpdatedAt  DATETIME     NULL,
    CONSTRAINT FK_Booking_Guest FOREIGN KEY (GuestId) REFERENCES dbo.Guest(Id),
    CONSTRAINT FK_Booking_Room  FOREIGN KEY (RoomId)  REFERENCES dbo.Room(Id),
    CONSTRAINT FK_Booking_Staff FOREIGN KEY (BookedBy) REFERENCES dbo.Staff(Id)
);