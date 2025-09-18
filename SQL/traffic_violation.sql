create database Traffic_Violation;
use Traffic_Violation;

create table Vehicle_Types(
	vehicle_types_id int primary key auto_increment,
    vehicle_types_name nvarchar(50),
    description nvarchar(100)
);

create table Owners(
	owner_id int primary key auto_increment,
    owner_name nvarchar(50),
    gender nvarchar(10),
    birthday date,
    email nvarchar(50),
    phone nvarchar(20),
    address nvarchar(100)
);

create table Vehicles(
	vehicle_id int primary key auto_increment,
    lisense_plate nvarchar(15),
    vehicle_types_id int,
    owner_id int,
    brand nvarchar(50),
    model nvarchar(50),
    year_manufacture int,
    foreign key (vehicle_types_id) references Vehicle_Types(vehicle_types_id),
    foreign key (owner_id) references Owners(owner_id)
);

create table Violation_Types(
	violation_type_id int primary key auto_increment,
    violation_name nvarchar(100),
    penalty decimal(15,2),
    desciption nvarchar(100)
);

create table Violations(
	violation_id int primary key auto_increment,
    vehicle_id int,
    violation_type_id int,
    violation_date date,
    location nvarchar(100),
    status nvarchar(20),
    foreign key (vehicle_id) references Vehicles(vehicle_id),
    foreign key (violation_type_id) references Violation_Types(violation_type_id)
);

INSERT INTO Vehicle_Types (vehicle_types_name, description) VALUES
(N'Car', N'4-wheeled motor vehicle'),
(N'Motorbike', N'Two-wheeled motor vehicle'),
(N'Truck', N'Heavy load vehicle'),
(N'Bus', N'Passenger transport vehicle'),
(N'Bicycle', N'Non-motorized two-wheeled vehicle');
INSERT INTO Vehicle_Types (vehicle_types_name, description) VALUES
(N'Minivan', N'Small passenger van'),
(N'Electric Car', N'Environmentally friendly car'),
(N'Scooter', N'Small two-wheeled motorbike'),
(N'Jeep', N'Off-road vehicle'),
(N'Pickup', N'Utility truck with open cargo area');

INSERT INTO Owners (owner_name, gender, birthday, email, phone, address) VALUES
(N'Nguyen Van A', N'Male', '1990-05-20', 'vana@example.com', '0901234567', N'Hanoi'),
(N'Tran Thi B', N'Female', '1995-08-15', 'thib@example.com', '0912345678', N'Ho Chi Minh City'),
(N'Le Van C', N'Male', '1988-11-02', 'vanc@example.com', '0923456789', N'Da Nang'),
(N'Pham Thi D', N'Female', '2000-01-10', 'thid@example.com', '0934567890', N'Can Tho'),
(N'Hoang Van E', N'Male', '1985-07-25', 'vane@example.com', '0945678901', N'Hai Phong');
INSERT INTO Owners (owner_name, gender, birthday, email, phone, address) VALUES
(N'Nguyen Thi F', N'Female', '1992-03-12', 'thif@example.com', '0956789012', N'Hue'),
(N'Do Van G', N'Male', '1980-09-18', 'vang@example.com', '0967890123', N'Quang Ninh'),
(N'Bui Thi H', N'Female', '1998-12-05', 'thih@example.com', '0978901234', N'Nam Dinh'),
(N'Pham Van I', N'Male', '1975-06-22', 'vani@example.com', '0989012345', N'Nghe An'),
(N'Vu Thi J', N'Female', '2001-10-30', 'thij@example.com', '0990123456', N'Thai Nguyen');

INSERT INTO Vehicles (lisense_plate, vehicle_types_id, owner_id, brand, model, year_manufacture) VALUES
(N'30A-12345', 1, 1, N'Toyota', N'Camry', 2018),
(N'59X2-67890', 2, 2, N'Honda', N'Wave Alpha', 2020),
(N'43C-11223', 3, 3, N'Hyundai', N'HD320', 2015),
(N'51B-44556', 4, 4, N'Thaco', N'Town Bus', 2019),
(N'29B-99887', 5, 5, N'Asama', N'City Bike', 2021);
INSERT INTO Vehicles (lisense_plate, vehicle_types_id, owner_id, brand, model, year_manufacture) VALUES
(N'30F-22334', 6, 6, N'Kia', N'Sedona', 2017),
(N'30G-55667', 7, 7, N'VinFast', N'VF8', 2023),
(N'59H1-77889', 8, 8, N'Yamaha', N'Janus', 2019),
(N'43A-88990', 9, 9, N'Jeep', N'Wrangler', 2016),
(N'29C-33445', 10, 10, N'Ford', N'Ranger', 2021);

INSERT INTO Violation_Types (violation_name, penalty, desciption) VALUES
(N'Speeding', 1500000.00, N'Driving over the speed limit'),
(N'No Helmet', 300000.00, N'Motorbike driver without helmet'),
(N'Running Red Light', 1200000.00, N'Passing when red light is on'),
(N'Drunk Driving', 7000000.00, N'Driving under the influence of alcohol'),
(N'Illegal Parking', 500000.00, N'Parking in prohibited area');
INSERT INTO Violation_Types (violation_name, penalty, desciption) VALUES
(N'Expired Registration', 800000.00, N'Vehicle registration expired'),
(N'Overloading', 2000000.00, N'Carrying load over limit'),
(N'No Seatbelt', 500000.00, N'Driver not wearing seatbelt'),
(N'Using Phone While Driving', 1000000.00, N'Distracted driving'),
(N'Obstructing Traffic', 1500000.00, N'Blocking road or intersection');

INSERT INTO Violations (vehicle_id, violation_type_id, violation_date, location, status) VALUES
(1, 1, '2025-08-01', N'Hanoi - Ba Dinh', N'Unpaid'),
(2, 2, '2025-08-05', N'HCM - District 1', N'Paid'),
(3, 4, '2025-08-10', N'Da Nang - Hai Chau', N'Unpaid'),
(4, 3, '2025-08-12', N'Can Tho - Ninh Kieu', N'Processing'),
(5, 5, '2025-08-15', N'Hai Phong - Le Chan', N'Paid');
INSERT INTO Violations (vehicle_id, violation_type_id, violation_date, location, status) VALUES
(6, 6, '2025-08-18', N'Hue - Phu Hoi', N'Paid'),
(7, 7, '2025-08-20', N'Quang Ninh - Ha Long', N'Unpaid'),
(8, 8, '2025-08-22', N'Nam Dinh - Giao Thuy', N'Processing'),
(9, 9, '2025-08-25', N'Nghe An - Vinh', N'Unpaid'),
(10, 10, '2025-08-28', N'Thai Nguyen - Pho Yen', N'Paid');

ALTER TABLE Vehicle_Types
-- Vehicle type name must be unique
ADD CONSTRAINT uq_vehicle_types_name UNIQUE (vehicle_types_name),
-- Description cannot be empty (CHECK for length > 0)
ADD CONSTRAINT ck_vehicle_types_desc CHECK (LENGTH(description) > 0);

ALTER TABLE Owners
-- Email must be unique
ADD CONSTRAINT uq_owner_email UNIQUE (email),
-- Phone must be unique
ADD CONSTRAINT uq_owner_phone UNIQUE (phone),
-- Gender must be Male or Female
ADD CONSTRAINT ck_owner_gender CHECK (gender IN (N'Male', N'Female'));

ALTER TABLE Vehicles
-- License plate must be unique
ADD CONSTRAINT uq_license_plate UNIQUE (lisense_plate);

ALTER TABLE Violation_Types
-- Violation name must be unique
ADD CONSTRAINT uq_violation_name UNIQUE (violation_name),
-- Penalty must be positive
ADD CONSTRAINT ck_penalty CHECK (penalty > 0),
-- Default penalty description
ALTER desciption SET DEFAULT N'No description provided';

ALTER TABLE Violations
-- Status must be one of predefined values
ADD CONSTRAINT ck_status CHECK (status IN (N'Unpaid', N'Paid', N'Processing')),
-- Default status = 'Unpaid'
ALTER status SET DEFAULT N'Unpaid';

