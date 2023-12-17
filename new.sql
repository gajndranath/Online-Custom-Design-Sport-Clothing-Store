CREATE TABLE RoomType (
    TypeName VARCHAR(50) PRIMARY KEY,
    SpecialFacilities VARCHAR(100)
);

CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    RoomSize VARCHAR(20),
    Location VARCHAR(50),
    RoomRate DECIMAL(10, 2),
    RoomType VARCHAR(50),
    FOREIGN KEY (RoomType) REFERENCES RoomType(TypeName)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(100),
    ContactNumber VARCHAR(20)
);

CREATE TABLE Housekeeper (
    EmployeeID INT PRIMARY KEY,
    Qualifications VARCHAR(100),
    StartDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Cleaner (
    CleanerID INT PRIMARY KEY,
    Grade VARCHAR(20)
);

CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(100),
    NICNumber VARCHAR(20),
    CreditCardNumber VARCHAR(20)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    CheckInTime DATETIME,
    CheckOutTime DATETIME,
    RoomNumber INT,
    GuestID INT,
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    ServiceType VARCHAR(50),
    Charge DECIMAL(10, 2)
);

CREATE TABLE BookingService (
    BookingID INT,
    ServiceID INT,
    PRIMARY KEY (BookingID, ServiceID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);
