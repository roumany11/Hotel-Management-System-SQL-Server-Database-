CREATE TABLE dbo.Feedback (
    Id         INT       NOT NULL PRIMARY KEY,
    BookingId  INT       NOT NULL,
    GuestId    INT       NOT NULL,
    Content    TEXT      NOT NULL,
    Rating     INT       NOT NULL,
    CreatedAt  DATETIME  NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Feedback_Booking FOREIGN KEY (BookingId) REFERENCES dbo.Booking(Id),
    CONSTRAINT FK_Feedback_Guest   FOREIGN KEY (GuestId)   REFERENCES dbo.Guest(Id)
);