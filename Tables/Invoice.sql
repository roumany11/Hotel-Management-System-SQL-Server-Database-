CREATE TABLE dbo.Invoice (
    Id           INT           NOT NULL PRIMARY KEY,
    BookingId    INT           NOT NULL,
    TotalAmount  DECIMAL(10,2) NOT NULL,
    IssuedOn     DATE          NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    DueDate      DATE          NOT NULL,
    Status       VARCHAR(50)   NOT NULL,
    CONSTRAINT FK_Invoice_Booking FOREIGN KEY (BookingId) REFERENCES dbo.Booking(Id)
);