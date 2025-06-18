CREATE TABLE dbo.Maintenance_Request (
    Id           INT          NOT NULL PRIMARY KEY,
    RoomId       INT          NOT NULL,
    RequestedBy  INT          NOT NULL,
    Description  TEXT         NOT NULL,
    Priority     VARCHAR(50)  NOT NULL,
    Status       VARCHAR(50)  NOT NULL,
    CreatedAt    DATETIME     NOT NULL DEFAULT GETDATE(),
    ResolvedAt   DATETIME     NULL,
    CONSTRAINT FK_MR_Room      FOREIGN KEY (RoomId)      REFERENCES dbo.Room(Id),
    CONSTRAINT FK_MR_RequestedBy FOREIGN KEY (RequestedBy) REFERENCES dbo.Staff(Id)
);