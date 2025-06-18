CREATE VIEW dbo.v_HotelOccupancy
AS
SELECT
    h.Name           AS HotelName,
    COUNT(b.Id)      AS ActiveBookings,
    SUM(DATEDIFF(day, b.CheckIn, b.CheckOut)) AS TotalNights
FROM dbo.Booking b
JOIN dbo.Room r        ON b.RoomId = r.Id
JOIN dbo.Branch br     ON r.Id = br.Id
JOIN dbo.Hotel h       ON br.HotelId = h.Id
WHERE b.Status = 'Confirmed'
GROUP BY h.Name;
GO