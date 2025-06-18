CREATE TABLE dbo.Booking_Service (
    BookingId  INT           NOT NULL,
    ServiceId  INT           NOT NULL,
    Quantity   INT           NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Booking_Service PRIMARY KEY (BookingId, ServiceId),
    CONSTRAINT FK_BS_Booking FOREIGN KEY (BookingId) REFERENCES dbo.Booking(Id),
    CONSTRAINT FK_BS_Service FOREIGN KEY (ServiceId) REFERENCES dbo.Service(Id)
);