CREATE PROCEDURE dbo.sp_GetAvailableRooms
    @FromDate DATE,
    @ToDate   DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT r.Id, r.Number, rt.Name AS RoomType, rt.Rate
    FROM dbo.Room r
    JOIN dbo.Room_Type rt ON r.RoomTypeId = rt.Id
    WHERE r.Status = 'Available'
      AND NOT EXISTS (
          SELECT 1 FROM dbo.Booking b
          WHERE b.RoomId = r.Id AND b.Status <> 'Cancelled'
            AND @FromDate < b.CheckOut AND @ToDate > b.CheckIn
      );
END
GO