CREATE FUNCTION dbo.fn_BookingDuration (@BookingId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Days INT;
    SELECT @Days = DATEDIFF(day, CheckIn, CheckOut) FROM dbo.Booking WHERE Id = @BookingId;
    RETURN @Days;
END
GO