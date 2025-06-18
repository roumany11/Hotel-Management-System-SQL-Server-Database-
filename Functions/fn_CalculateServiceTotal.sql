CREATE FUNCTION dbo.fn_CalculateServiceTotal (@BookingId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(bs.Quantity * bs.TotalPrice)
    FROM dbo.Booking_Service bs
    WHERE bs.BookingId = @BookingId;
    RETURN ISNULL(@Total, 0);
END
GO