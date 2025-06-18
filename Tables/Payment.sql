CREATE TABLE dbo.Payment (
    Id         INT           NOT NULL PRIMARY KEY,
    BookingId  INT           NOT NULL,
    Amount     DECIMAL(10,2) NOT NULL,
    Method     VARCHAR(50)   NOT NULL,
    PaidOn     DATE          NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingId) REFERENCES dbo.Booking(Id)
);