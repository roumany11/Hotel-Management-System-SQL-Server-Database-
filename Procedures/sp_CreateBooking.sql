CREATE PROCEDURE dbo.sp_CreateBooking
    @GuestId    INT,
    @RoomId     INT,
    @BookedBy   INT,
    @CheckIn    DATE,
    @CheckOut   DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Booking (GuestId, RoomId, BookedBy, CheckIn, CheckOut, Status, CreatedAt)
    VALUES (@GuestId, @RoomId, @BookedBy, @CheckIn, @CheckOut, 'Confirmed', GETDATE());

    UPDATE dbo.Room SET Status = 'Booked' WHERE Id = @RoomId;
END
GO