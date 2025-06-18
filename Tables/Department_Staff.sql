CREATE TABLE dbo.Department_Staff (
    DepartmentId INT NOT NULL,
    StaffId      INT NOT NULL,
    CONSTRAINT PK_Department_Staff PRIMARY KEY (DepartmentId, StaffId),
    CONSTRAINT FK_DepStaff_Department FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(Id),
    CONSTRAINT FK_DepStaff_Staff      FOREIGN KEY (StaffId) REFERENCES dbo.Staff(Id)
);