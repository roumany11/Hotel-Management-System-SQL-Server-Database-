CREATE VIEW dbo.v_BookingDetails
AS
SELECT
    b.Id            AS BookingId,
    g.FirstName + ' ' + g.LastName AS GuestName,
    r.Number        AS RoomNumber,
    rt.Name         AS RoomType,
    b.CheckIn,
    b.CheckOut,
    b.Status,
    s.Name          AS BookedByStaff,
    b.CreatedAt
FROM dbo.Booking b
JOIN dbo.Guest g       ON b.GuestId = g.Id
JOIN dbo.Room r        ON b.RoomId = r.Id
JOIN dbo.Room_Type rt  ON r.RoomTypeId = rt.Id
JOIN dbo.Staff s       ON b.BookedBy = s.Id;
GO