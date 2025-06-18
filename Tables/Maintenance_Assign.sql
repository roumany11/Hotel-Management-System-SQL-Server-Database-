CREATE TABLE dbo.Maintenance_Assign (
    RequestId   INT       NOT NULL,
    StaffId     INT       NOT NULL,
    AssignedAt  DATETIME  NOT NULL DEFAULT GETDATE(),
    CompletedAt DATETIME  NULL,
    CONSTRAINT PK_Maintenance_Assign PRIMARY KEY (RequestId, StaffId),
    CONSTRAINT FK_MA_Request FOREIGN KEY (RequestId) REFERENCES dbo.Maintenance_Request(Id),
    CONSTRAINT FK_MA_Staff   FOREIGN KEY (StaffId)   REFERENCES dbo.Staff(Id)
);